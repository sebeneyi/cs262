import React, { useEffect, useState } from 'react';
import { ActivityIndicator, FlatList, Text, View } from 'react-native';

export default App = () => {
  const [isLoading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch('https://www.googleapis.com/books/v1/volumes?q=jane%20austen')
      .then((response) => response.json())
      .then((json) => setData(json.items))
      .catch((error) => console.error(error))
      .finally(() => setLoading(false));
  }, []);

  return (
    <View style={{ flex: 1, padding: 24 }}>
      {isLoading ? <ActivityIndicator /> : (
        <FlatList
          data={data}
          keyExtractor={({ id }, index) => id}
          renderItem={({ item }) => (
            <View>
              <Text>{item.volumeInfo.title}, {item.volumeInfo.authors}</Text>
              <Text style={{ paddingLeft: 24 }}>Page count: {item.volumeInfo.pageCount}</Text>
              <Text style={{ paddingLeft: 24 }}>Published Date: {item.volumeInfo.publishedDate}</Text>
              <Text style={{ paddingLeft: 24 }}>Maturity: {item.volumeInfo.maturityRating}</Text>
            </View>
          )
          }
        />
      )}
    </View >
  );
};
