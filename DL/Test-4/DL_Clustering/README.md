Problem
-

Look at the image cluster dataset. It contains images of 3 different objects, i.e. aeroplane, ship and car. Build a network to cluster images of similar objects to form 3 clusters.

Approach
-

1. Load images from the common folder "clustering".
2. Reshape and preprocess images.
3. Using InceptionV3 model, get the image features.
4. Fit KMeans algorithm on the features and form 3 clusters.
5. Save images on separate folders based on class type.
