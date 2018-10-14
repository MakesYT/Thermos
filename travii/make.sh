mkdir $HOME/release
rm -r $HOME/release/*

# 2386
cd MinecraftForge
git checkout 615f4966ce9e8abd9aea0df4757c775edf09cf5d
cd ..
git pull origin master
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.11.2-2386-server.jar

# 2588
cd MinecraftForge
git checkout 23410ad4d4d485927b39c56b33f479ea00628c44
cd ..
git pull origin master
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar packageBundle
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.11.2-2588-server.jar

cd build/distributions/
unzip Thermos*bundle*zip
rm -r bin/unknown
mv bin libraries
zip -r libraries.zip libraries
cp libraries.zip $HOME/release