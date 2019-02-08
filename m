From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V17 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 18:37:15 +0000
Message-ID: <BYAPR12MB3398DAC18B36F12F20765354C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549648195-3989-1-git-send-email-skomatineni@nvidia.com>
 <1549648195-3989-3-git-send-email-skomatineni@nvidia.com>
 <0c30dfe0-1174-0056-5ef6-432b75de2353@gmail.com>
 <BYAPR12MB339810D394AC0A50934DD5EAC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <3e4db3e9-8198-f1bf-f909-492bf1ff8c56@gmail.com>
 <BYAPR12MB33981B3AD88271597CC4F7F5C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB3398429D6C403347C149B643C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB33986FBB8B684F2E56948FBCC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33986FBB8B684F2E56948FBCC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "wsa@the-dreams.de" <wsa@the-dreams.de>, "peda@axentia.se" <peda@axentia.se>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

PiA+ID4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfYWRhcHRlcl9xdWlya3MgdGVncmExOTRf
aTJjX3F1aXJrcyA9IHsNCj4gPiA+Pj4gIAkuZmxhZ3MgPSBJMkNfQVFfTk9fWkVST19MRU4sDQo+
ID4gPj4+ICsJLm1heF93cml0ZV9sZW4gPSA2NTUzNSAtIEkyQ19QQUNLRVRfSEVBREVSX1NJWkUs
DQo+ID4gPj4NCj4gPiA+PiBJZGVhbGx5IGl0IHNob3VsZCBiZSBTWl82NEsgLSBJMkNfUEFDS0VU
X0hFQURFUl9TSVpFIHRvIG5vdCBtaXNzIHRoZSBvbmUgYnl0ZSwgb3RoZXJ3aXNlIGdvb2QgdG8g
bWU6DQo+ID4gPj4NCj4gPiA+PiBSZXZpZXdlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPg0KPiA+ID4gIA0KPiA+ID4gV2l0aCBTWl82NEsgLSBJMkNfUEFDS0VUX0hFQURS
X1NpemUsIFdoZW4gd2UgY29tcHV0ZSBkbWFfYnVmX3NpemUgDQo+ID4gPiA9IG1heF93cml0ZV9s
ZW4gKyBJMkNfUEFDS0VUX0hFQURFUl9TSVpFLCBkbWFfYnVmX3NpemUgd2lsbCBiZSANCj4gPiA+
IFNaXzY0SyB3aGljaCBpcyAweDEwMDAwIGFwYmRtYSBkbWEgY291bnQgbGltaXQgc2hvdWxkIGJl
IDwgNjRLIA0KPiA+ID4gbWVhbmluZyA2NTUzNSBtYXggaXMgYWxsb3dlZA0KPiA+ID4gDQo+ID4N
Cj4gPiBCdXQgaXQncyBmb3IgdGhlIEdQQ0RNQSwgZG9lcyBpdCBoYXZlIHRoZSBzYW1lIDY0SyBs
aW1pdCBhcyBBUEIgRE1BPw0KPg0KIDY0SyBsaW1pdCBpcyBmb3IgQVBCRE1BLiBUaGlzIHBhdGNo
IGhhcyBBUEJETUEgc3VwcG9ydCBvbmx5LiBObyBHUENETUEgc3VwcG9ydCBzbyBidWYgc2l6ZSBs
aW1pdCBpcyBiYXNlZCBvbiBBUEJETUEuDQogR1BDRE1BIHN1cHBvcnRzIHVwdG8gMUdCLiANCg0K
IEkgdGhpbmsgZG1hX2J1Zl9zaXplIGlzIG9ubHkgZm9yIGJ1ZmZlciBhbGxvY2F0aW9uIHNvIHNo
b3VsZG7igJl0IGhhcm0gZm9yIGV4YWN0IDY0Sy4NCldpbGwgdGFrZSBhIGxvb2sgYXQgZG1hIGRy
aXZlci4uLg0KDQpBbGwgbXNnIHJlYWRzLCBtYXggbGVuZ3RoIGlzIDY1NTM1DQpBbGwgbXNnIHdy
aXRlcywgbWF4IGxlbmd0aCByZXF1ZXN0cyBpcyBhbHNvIGxpbWl0ZWQgdG8gNjU1MzUgZHVlIHRv
IHUxNiB0eXBlIG9mIG1zZy5sZW4gU28sIEluIGFueSBjYXNlLCB3ZSBkb27igJl0IG5lZWQgNjU1
MzYgYnl0ZXMuDQpDb25mdXNlZCwgeWVhaCB3aXRoIG1heCB3cml0ZSBxdWlyaywgbWF4IHRyYW5z
ZmVyIGNhbiBiZSA2NEsuDQoNCldpbGwgY2hhbmdlIHRvIDY0SyBpbnN0ZWFkIG9mIDY1NTM1Lg0K
