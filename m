From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 19:14:33 +0000
Message-ID: <BYAPR12MB339812565AB1C9973A934522C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <e09062b7-9c74-6aee-477a-72fb72bbd5d3@gmail.com>
 <BYAPR12MB33980D6751904EBEFC38BBAAC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
 <da8138fe-ea4b-42be-1065-c7098ac59691@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <da8138fe-ea4b-42be-1065-c7098ac59691@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQoNCj4gPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHRlZ3Jh
MjEwX2kyY19odyA9IHsgQEAgDQo+ID4+PiAtOTgwLDYgKzEzMDIsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHRlZ3JhMjEwX2kyY19odyA9IHsNCj4gPj4+ICAJ
Lmhhc19tc3RfZmlmbyA9IGZhbHNlLA0KPiA+Pj4gIAkucXVpcmtzID0gJnRlZ3JhX2kyY19xdWly
a3MsDQo+ID4+PiAgCS5zdXBwb3J0c19idXNfY2xlYXIgPSB0cnVlLA0KPiA+Pj4gKwkuaGFzX2Fw
Yl9kbWEgPSB0cnVlLA0KPiA+Pj4gIH07DQo+ID4+DQo+ID4+IFQxODYgaXMgbWlzc2VkIGhlcmUu
DQo+ID4gDQo+ID4gQ3VycmVudGx5IHQxODYgaHcgZmVhdHVyZSBpcyBub3QgcHJlc2VudCBpbiBl
eGlzdGluZyBsaW51eCBuZXh0IGFuZCBkZXZpY2UgdHJlZXMgdXNlIGJvdGggdDE4NiBhbmQgdDEx
NCBjb21wYXRpYmxlcywgc28gdDExNCBpcyBiZWluZyBhcHBsaWVzLg0KPiA+IEJ1dCBkbWFzIGFy
ZSBub3QgdXNlZCBmb3IgdDE4NiB5ZXQuDQo+ID4gDQo+ID4gVDE4NiBodyBmZWF0dXJlIGlzIGFk
ZGVkIGZvciBmaXJzdCB0aW1lIGFzIHBhcnQgb2YgaW50ZXJmYWNlIHRpbWluZyBhbmQgaXRzIGlu
IHBhdGNoIG5leHQgdG8gdGhpcyBwYXRjaCBpbiBzYW1lIHNlcmllcy4NCj4gPiBUaGlzIGlzIHRo
ZSBzYW1lIGZyb20gYmVnaW5uaW5nIG9mIGFsbCB0aGVzZSBzZXJpZXMuDQo+ID4NCj4gPj4NCj4g
Pj4+ICANCj4gPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHRl
Z3JhMTk0X2kyY19odyA9IHsgQEAgDQo+ID4+PiAtOTk1LDYgKzEzMTgsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHRlZ3JhMTk0X2kyY19odyA9IHsNCj4gPj4+
ICAJLmhhc19tc3RfZmlmbyA9IHRydWUsDQo+ID4+PiAgCS5xdWlya3MgPSAmdGVncmExOTRfaTJj
X3F1aXJrcywNCj4gPj4+ICAJLnN1cHBvcnRzX2J1c19jbGVhciA9IHRydWUsDQo+ID4+PiArCS5o
YXNfYXBiX2RtYSA9IGZhbHNlLA0KPiA+Pj4gIH07DQo+ID4gDQo+DQo+IFlvdSBhZGRlZCAiaGFz
X2FwYl9kbWEiIGZvciBUMTk0IGFuZCBub3QgVDE4NiBpbiB0aGlzIHBhdGNoLCBJIGhhcHBlbmVk
IHRvIG5vdGljZSBpdCBvbmx5IHJpZ2h0IG5vdy4gUGxlYXNlLCBsZXQncyBiZSBjb25zaXN0ZW50
IGFuZCBzZXQgdGhlIG5ldyBmaWVsZCBmb3IgYWxsIG9mIHRoZSBwbGF0Zm9ybXMgaW4gdGhpcyBw
YXRjaC4NCg0KT0ssIFdpbGwgbW92ZSB0MTg2IGh3IGZlYXR1cmUgYWRkaXRpb24gdG8gdGhpcyBw
YXRoIGZyb20gaW50ZXJmYWNlIHRpbWluZyB0byByZWZsZWN0IGFwYiBkbWEgZmxhZy4NCg==
