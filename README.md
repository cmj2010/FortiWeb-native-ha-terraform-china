# FortiWeb-native-ha-terraform-china
Use terraform to launch a pair of FortiWeb High volume HA

## limition
FortiWeb can't apply ha config before import license

config and license must store in the S3 bucket.
```
{
"cloud-initd": "enable",
"bucket" : "mjchen-ningxia",
"region" : "cn-northwest-1",
"license" : "/fwbha/fwblic/FVVM080000206993.lic",
"config" : "/fwbha/fwbcfg/fwb1.txt",
}
```

There is another userdata format, this formati must work with aws aws cloudformation
```
fwb_json_start {
"HaCloudInit":"enable",
"HaPasswd": "Rm9ydGluZXQxMjMj",
"HaMode": "active-active-high-volume",
"HaGroupName":"FWHAGroup",
"HaGroupId":"30",
"HaOverride":"disable",
"HaBucket":"mjchen-ningxia",
"HaLicense":"fwbha/fwblic/FVVM080000206993.lic",
}
````

You can check the userdata state on FWB GUI event and cli by follow command
```
FortiWeb # fn sh
/#
/#
/# cd /var/log/gui_upload
/var/log/gui_upload#  cat ha_event_log
2020-08-11 02:03:14 dbg-hatalk sysha.c:843 Multi policy available count is change from 0 to -1
2020-08-11 10:03:16 dbg-udp-tunnel main.c:594 Udp-tunneld is start.....
2020-08-11 10:03:16 dbg-udp-tunnel main.c:442 tunnel_init..
2020-08-11 10:03:16 dbg-udp-tunnel main.c:247 install_signal..
2020-08-11 10:03:16 dbg-udp-tunnel main.c:74 load tunnel config, ha is standlone
2020-08-11 10:03:16 dbg-udp-tunnel main.c:462 conf->epoll_fd create success:6
2020-08-11 10:03:17 dbg-hamain ha_clicfg.c:93 override old:0 new:0
2020-08-11 10:03:17 dbg-hatalk hb.c:209 heartbeat start...
2020-08-11 10:03:17 dbg-hamain ha_clicfg.c:93 override old:0 new:0
2020-08-11 10:03:17 dbg-hasync sync.c:99 sync start...
2020-08-11 10:03:17 dbg-hamain main.c:98 firmware is: FV-AWS-6.3-FW-build1075
2020-08-11 10:03:17 dbg-hamain main.c:140 ========== start hasyncd ==========
2020-08-11 10:03:24 dbg-cloud-initd cloud_initd_main.c:773 [HA-DEBUG] Get HaBucket: mjchen-ningxia
2020-08-11 10:03:24 dbg-cloud-initd cloud_initd_main.c:780 [HA-DEBUG] Get HaLicense: fwbha/fwblic/FVVM080000206993.lic
2020-08-11 10:03:24 dbg-cloud-initd cloud_initd_main.c:785 [ERROR][line:0785] cloud-initd ha download license error, bucket:mjchen-ningxia license:fwbha/fwblic/FVVM080000206993.lic
```