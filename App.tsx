import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import {
	Dimensions,
	StyleSheet,
	Text,
	View,
	TouchableOpacity,
	ToastAndroid,
} from "react-native";
import * as Clipboard from "expo-clipboard";

export default function App() {
	const [rolledValue, setRolledValue] = useState("");

	const copyToClipboard = async () => {
		await Clipboard.setStringAsync(rolledValue);
		ToastAndroid.show("Copied to clipboard!", ToastAndroid.LONG);
	};

	// const fetchCopiedText = async () => {
	//   const text = await Clipboard.getStringAsync();
	//   setCopiedText(text);
	// };

	const handleRoll = () => {
		// generate 9 random numbers between 0 and 9 inclusive
		const randomNumbers = Array(9)
			.fill(0)
			.map(() => Math.floor(Math.random() * 10));

		setRolledValue(randomNumbers.join(""));
	};

	return (
		<View style={styles.container}>
			<StatusBar style="auto" />

			{!!rolledValue ? (
				<Text style={styles.rollNumber} onPress={copyToClipboard}>
					{rolledValue}
				</Text>
			) : (
				<Text style={styles.rollText}>{"Roll for your number!"}</Text>
			)}

			<TouchableOpacity style={styles.rollButton} onPress={handleRoll}>
				<Text style={styles.rollButtonText}>Roll!</Text>
			</TouchableOpacity>
		</View>
	);
}

const styles = StyleSheet.create({
	container: {
		flex: 1,
		backgroundColor: "#fff",
		alignItems: "center",
		justifyContent: "center",
	},
	rollNumber: {
		fontSize: 25,
		marginBottom: 20,
		fontWeight: "bold",
		letterSpacing: 2,
	},
	rollText: {
		fontSize: 22,
		marginBottom: 20,
		fontWeight: "bold",
	},
	rollButton: {
		alignItems: "center",
		justifyContent: "center",
		paddingVertical: 12,
		paddingHorizontal: 32,
		borderRadius: 4,
		elevation: 3,
		backgroundColor: "black",
		width: Dimensions.get("window").width * 0.8,
	},
	rollButtonText: {
		fontSize: 20,
		lineHeight: 21,
		fontWeight: "bold",
		letterSpacing: 0.25,
		color: "white",
	},
});
