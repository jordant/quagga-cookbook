#
# Author:: Bao Nguyen <opensource-cookbooks@ooyala.com>
# Cookbook Name:: quagga
# Resource:: ospf
#
# Copyright 2014, Bao Nguyen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :add, :remove

default_action :add

attribute :name, kind_of: String, name_attribute: true
attribute :protocols, kind_of: Array, default: []
attribute :router_id, kind_of: String, default: nil
attribute :areas, kind_of: Hash, default: {}
attribute :interfaces, kind_of: Hash, default: {}
attribute :passive_ints, kind_of: [Array, String], default: []
attribute :ospf_options, kind_of: Array, default: []
attribute :passive_default, kind_of: [TrueClass, FalseClass], default: true
