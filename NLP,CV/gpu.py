from keras.datasets import fashion_mnist
from keras.layers import Dense
from keras.models import Sequential
import numpy as np
from sklearn.model_selection import train_test_split



def load_train(path):
    features_train = np.load(path + 'train_features.npy')
    target_train = np.load(path + 'train_target.npy')
    features_train = features_train.reshape(features_train.shape[0], 28 * 28) / 255.
    return features_train, target_train


def create_model(input_shape):
    model = Sequential()
    model.add(Dense(10, input_shape=input_shape, activation='relu'))
    model.add(Dense(20, activation='relu'))
    model.add(Dense(10, activation='relu'))
    model.add(Dense(10, activation='softmax'))
    model.compile(optimizer='adam', loss='sparse_categorical_crossentropy',
                  metrics=['acc'])

    return model


def train_model(model, train_data, test_data, batch_size=32, epochs=50,
               steps_per_epoch=None, validation_steps=None):

    features_train, target_train = train_data
    features_test, target_test = test_data
    model.fit(features_train, target_train, 
              validation_data=(features_test, target_test),
              batch_size=batch_size, epochs=epochs,
              steps_per_epoch=steps_per_epoch,
              validation_steps=validation_steps,
              verbose=2, shuffle=True)

    return model


if __name__ == "__main__":

    features_train, target_train = load_train(path)
    X_train,X_test,y_train,y_test = train_test_split(features_train, target_train, test_size=0.2,stratify = target_train)
    train_data = (X_train,y_train)
    # test_data = (X_test,y_test)

    model = create_model(features_train.shape[1])

    result = train_model(model, train_data, test_data)

