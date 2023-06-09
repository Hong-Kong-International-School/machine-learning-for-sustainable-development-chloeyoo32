# Machine Learning Project
Plant Disease Detection
This project is aimed at developing a user-friendly tool to detect plant diseases using deep learning techniques. By automating disease identification and providing accurate diagnoses, we strive to help farmers and gardeners make informed decisions in managing their crops. This project contributes to the United Nations Sustainable Development Goal (SDG) 2: Zero Hunger, by promoting sustainable agriculture practices and ensuring food security for all.

## SDG Goal 2
How will this help solve the SDG goal 2:
1. Reduced Crop Losses: Timely disease management can reduce yield losses by up to 50% (Oerke, 2006), contributing to the broader efforts to minimize crop losses and enhance food security.
2. Support for Smallholder Farmers: Empowers smallholder farmers, who contribute to over 70% of the world's food supply (FAO, 2021), by providing them with the knowledge and tools to protect their crops and improve their livelihoods.
3. Improved Decision-making: Facilitates data-driven decision-making by researchers, governments, and other stakeholders, enabling more effective and efficient use of resources in the fight against crop diseases.

## Overview
The plant disease detection system utilizes a Convolutional Neural Network (CNN) model trained on a comprehensive dataset of plant images with various diseases. Users can upload images of their plants, and the system will analyze these images to identify the presence of any diseases. Our goal is to provide a reliable, accurate, and easy-to-use tool to support farmers and gardeners in maintaining the health of their crops and ultimately increasing yield.

## Features
1. Early Disease Detection: Utilizes advanced machine learning algorithms to accurately identify and diagnose common plant diseases based on images captured by farmers.
2. User-friendly Interface: Designed to be accessible and easy-to-use for smallholder farmers who may lack access to advanced agricultural technologies and expertise.
3. Data-driven Monitoring: Aggregates data to support monitoring and evaluation of disease incidence at regional and national levels, informing targeted interventions.

## System Details
Platform: iOS
Language: Swift
Dependencies: Core ML, Vision

## Data Source
I got my data set from Kaggle, which can be found here: https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset

## Notebook
My Kaggle notebook: https://www.kaggle.com/code/chloeyoo32/plant-disease-detection-project
Here I trained the dataset using a convolutional neural network. 

## Xcode
I uploaded my Xcode files in a folder called "plant disease app".
Here is a video of an example of how it works:

https://github.com/Hong-Kong-International-School/machine-learning-for-sustainable-development-chloeyoo32/assets/70065860/c86e5c0c-44cc-4834-9ee0-fbe0632c9f5f

## Installation
#### Prerequisites
Xcode 12 or later
iOS 14 or later
##### Steps to Install
Clone this repository
Open the project in Xcode.
Build and run the project on an iOS device or simulator.
#### How to Use
Launch the Plant Disease Detector app on your iOS device.
Take a photo or select an image of a plant leaf from your device.
The app will analyze the image and display the detected disease along with a confidence score.

## Biggest Challenge
My biggest challenge was converting my .h5 file, my downloaded CNN model from Kaggle, into a .mlmodel file, which is what Xcode accepts. As Xcode only accepts a machine learning file of .mlmodel, and Kaggle doesn't export as a .mlmodel, so I had to convert it with code on Visual Studio Code. This part was quite challenging finding how to do it.

## Future
I had lots of errors running my code, especially on Kaggle, due to the limited storage and memory on my Mac. Hopefully in the near future I can try to find another device to run it on so that there are more ephocs and a larger batch size, for a more accuracy. Additionally, my Xcode code is not perfect, and need some tweeks but the video embeded is how I would like my app to look like at the end.



