Description
===========

This cookbook provide an interface via attributes to serveral Quagga daemons. It's written with
the intention of deploying Quagga on Cumulus OS running on compatible [1] OEM switches.

It's currently supporting the following daemons:

OSPF
BGP

[1] http://cumulusnetworks.com/support/linux-hardware-compatibility-list/

Requirements
============

Linux

Attributes
==========

NOTE! Where you see "String or Array" for type, a String may be used _only_ for single values.  Use an Array of Strings for multiple values.

### General

Attribute        | Description |Type | Default
-----------------|-------------|-----|--------
`node[:quagga][:router_id]` | Router-id to use for all protocols. This is superseded by protocol-specific router-ids, if they are defined. | String | `nil`
`node[:quagga][:enable_reload]` | Must be true in to enable reloading the quagga service (only applies to certain versions). | Boolean | `true`
`node[:quagga][:max_instances]` | Sets /etc/defaults/quagga "MAX_INSTANCES" value. | Integer | `5`
`node[:quagga][:integrated_vtysh_config]` | Must be set to true in order to reload quagga (vs restart) on config changes. Details [here](http://www.nongnu.org/quagga/docs/docs-multi/VTY-shell-integrated-configuration.html) and [here](http://docs.cumulusnetworks.com/display/DOCS/Configuring+Quagga). | Boolean | `false`

### BGP

Attribute        | Description |Type | Default
-----------------|-------------|-----|--------
`node[:quagga][:bgp]` | A hash containing the BGP processes and their configuration.  Keys are the local ASNs/processes (Integer), values are the data for that process (Hash). | Hash | `{}`
`node[:quagga][:bgp][$LOCAL_ASN][:router_id]` | Sets the router-id for this BGP process. | String | `nil`
`node[:quagga][:bgp][$LOCAL_ASN][:neighbors]` | A hash containing neighbors and their configuration.  Keys are the neighbor IPs or group names (String), values are the data for that neighbor or group (Hash). | Hash | `nil`
`node[:quagga][:bgp][$LOCAL_ASN][:neighbors][$NEIGHBOR][:remote_as]` | The remote-as for this neighbor. | Integer | `nil`
`node[:quagga][:bgp][$LOCAL_ASN][:neighbors][$NEIGHBOR][:default_originate]` | Set to `true` to advertise a default route to this neighbor. | Boolean | `false`
`node[:quagga][:bgp][$LOCAL_ASN][:neighbors][$NEIGHBOR][:default_originate_map]` | The name of the route-map to use with default-originate. | String | `nil`
`node[:quagga][:bgp][$LOCAL_ASN][:neighbors][$NEIGHBOR][:peer_group]` | Set to `true` if this is a peer-group. | String | `nil`
`node[:quagga][:bgp][$LOCAL_ASN][:neighbors][$NEIGHBOR][:peer_group_range]` | The IP range(s) to permit for this group (BGP Dynamic Neighbors). | String or Array | `nil`

### OSPF

Attribute        | Description |Type | Default
-----------------|-------------|-----|--------
`node[:quagga][:ospf][:router_id]` | Sets the router-id for OSPF. | String | `nil`
`node[:quagga][:ospf][:passive_default]` | Set passive-interface default (Active interfaces must be defined). | Boolean | `true` ***needs testing***
`node[:quagga][:ospf][:passive_ints]` | Names of passive interfaces. | String or Array | `nil`
`node[:quagga][:ospf][:areas]` | A Hash containing areas and their configurations.  Keys are the area IDs (eg: 0.0.0.0), values are the data for that area. | Hash | `{}`
`node[:quagga][:ospf][:areas][$AREA][:networks]` | Networks to include in the area. | String or Array | `nil`
`node[:quagga][:ospf][:networks]` | ***TODO -- needs testing***. | String or Array | `[]`
`node[:quagga][:ospf][:protocols]` | ***TODO -- needs testing***. | String or Array | `[]`

Usage
=====

Simply set the desired attributes (see Attributes section above) then call the proper recipe (quagga::bgpd, quagga::ospfd).  There is also a provider for zebra, but no recipe as of yet.

Author and License
===================

__Original Author__ Bao Nguyen <opensource-cookbooks@ooyala.com>  
__Current Author (0.2.0 onwards)__ Ian Clark <ian@f85.net>

Copyright 2014, Ooyala Inc.  
Copyright 2015, Ian Clark

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
