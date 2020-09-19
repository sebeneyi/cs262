import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { StyleSheet, Text, View, Button, TextInput, FlatList } from 'react-native';

export default function App() {
  const [name, setName] = useState('John');
  const [age, setAge] = useState(0);

  const [birthdays, setBirthdays] = useState([]);

  const newAge = age + 1;

  const addList = () => {
    setBirthdays(birthdays.concat({ key: newAge.toString() }));
  }

  const clickHandler = () => {
    setAge(age + 1)
    addList(birthdays);
  };



  return (
    <View style={styles.container}>

      <Text>Enter Name: </Text>
      <TextInput style={styles.input}
        keyboardType='default'
        placeholder='e.g. John'
        onChangeText={(val) => setName(val) + setAge(0)}
      />

      <Text>{name} is {age} years old.</Text>
      <View style={styles.buttonContainer}>
        <Button title='Birthday' onPress={clickHandler} />
      </View>

      <FlatList
        data={birthdays}
        renderItem={({ item }) => (
          <Text style={styles.item}>{item.key}</Text>
        )}
      />

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    paddingTop: 40,
    paddingHorizontal: 20,
    alignItems: 'center',

  },
  input: {
    borderWidth: 1,
    borderColor: '#000',
    padding: 8,
    margin: 10,
    width: 200,
  },
  buttonContainer: {
    marginTop: 20
  },
  item: {
    marginTop: 10,
  }
});
