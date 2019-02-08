From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V17 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 18:28:47 +0000
Message-ID: <BYAPR12MB3398429D6C403347C149B643C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549648195-3989-1-git-send-email-skomatineni@nvidia.com>
 <1549648195-3989-3-git-send-email-skomatineni@nvidia.com>
 <0c30dfe0-1174-0056-5ef6-432b75de2353@gmail.com>
 <BYAPR12MB339810D394AC0A50934DD5EAC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <3e4db3e9-8198-f1bf-f909-492bf1ff8c56@gmail.com>
 <BYAPR12MB33981B3AD88271597CC4F7F5C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33981B3AD88271597CC4F7F5C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "wsa@the-dreams.de" <wsa@the-dreams.de>, "peda@axentia.se" <peda@axentia.se>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

PiA+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2FkYXB0ZXJfcXVpcmtzIHRlZ3JhMTk0X2ky
Y19xdWlya3MgPSB7DQo+ID4+PiAgCS5mbGFncyA9IEkyQ19BUV9OT19aRVJPX0xFTiwNCj4gPj4+
ICsJLm1heF93cml0ZV9sZW4gPSA2NTUzNSAtIEkyQ19QQUNLRVRfSEVBREVSX1NJWkUsDQo+ID4+
DQo+ID4+IElkZWFsbHkgaXQgc2hvdWxkIGJlIFNaXzY0SyAtIEkyQ19QQUNLRVRfSEVBREVSX1NJ
WkUgdG8gbm90IG1pc3MgdGhlIG9uZSBieXRlLCBvdGhlcndpc2UgZ29vZCB0byBtZToNCj4gPj4N
Cj4gPj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4NCj4g
PiAgDQo+ID4gV2l0aCBTWl82NEsgLSBJMkNfUEFDS0VUX0hFQURSX1NpemUsIFdoZW4gd2UgY29t
cHV0ZSBkbWFfYnVmX3NpemUgPSBtYXhfd3JpdGVfbGVuICsgSTJDX1BBQ0tFVF9IRUFERVJfU0la
RSwgZG1hX2J1Zl9zaXplIHdpbGwgYmUgU1pfNjRLIHdoaWNoIGlzIDB4MTAwMDAgYXBiZG1hIGRt
YSBjb3VudCBsaW1pdCBzaG91bGQgYmUgPCA2NEsgbWVhbmluZyA2NTUzNSBtYXggaXMgYWxsb3dl
ZA0KPiA+IA0KPg0KPiBCdXQgaXQncyBmb3IgdGhlIEdQQ0RNQSwgZG9lcyBpdCBoYXZlIHRoZSBz
YW1lIDY0SyBsaW1pdCBhcyBBUEIgRE1BPw0KDQo2NEsgbGltaXQgaXMgZm9yIEFQQkRNQS4gVGhp
cyBwYXRjaCBoYXMgQVBCRE1BIHN1cHBvcnQgb25seS4gTm8gR1BDRE1BIHN1cHBvcnQgc28gYnVm
IHNpemUgbGltaXQgaXMgYmFzZWQgb24gQVBCRE1BLg0KR1BDRE1BIHN1cHBvcnRzIHVwdG8gMUdC
LiANCg0KSSB0aGluayBkbWFfYnVmX3NpemUgaXMgb25seSBmb3IgYnVmZmVyIGFsbG9jYXRpb24g
c28gc2hvdWxkbuKAmXQgaGFybSBmb3IgZXhhY3QgNjRLLg0KV2lsbCB0YWtlIGEgbG9vayBhdCBk
bWEgZHJpdmVyLi4uDQo=
