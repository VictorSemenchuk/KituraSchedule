#! /usr/bin/env bash

pkill swift
cd .build/release
./KituraServer
cd -
