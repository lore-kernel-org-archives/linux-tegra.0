From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 18:56:14 +0000
Message-ID: <BYAPR12MB33980D6751904EBEFC38BBAAC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <e09062b7-9c74-6aee-477a-72fb72bbd5d3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e09062b7-9c74-6aee-477a-72fb72bbd5d3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

IA0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHRlZ3JhMjEw
X2kyY19odyA9IHsgQEAgDQo+ID4gLTk4MCw2ICsxMzAyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB0ZWdyYV9pMmNfaHdfZmVhdHVyZSB0ZWdyYTIxMF9pMmNfaHcgPSB7DQo+ID4gIAkuaGFzX21z
dF9maWZvID0gZmFsc2UsDQo+ID4gIAkucXVpcmtzID0gJnRlZ3JhX2kyY19xdWlya3MsDQo+ID4g
IAkuc3VwcG9ydHNfYnVzX2NsZWFyID0gdHJ1ZSwNCj4gPiArCS5oYXNfYXBiX2RtYSA9IHRydWUs
DQo+ID4gIH07DQo+DQo+IFQxODYgaXMgbWlzc2VkIGhlcmUuDQoNCkN1cnJlbnRseSB0MTg2IGh3
IGZlYXR1cmUgaXMgbm90IHByZXNlbnQgaW4gZXhpc3RpbmcgbGludXggbmV4dCBhbmQgZGV2aWNl
IHRyZWVzIHVzZSBib3RoIHQxODYgYW5kIHQxMTQgY29tcGF0aWJsZXMsIHNvIHQxMTQgaXMgYmVp
bmcgYXBwbGllcy4NCkJ1dCBkbWFzIGFyZSBub3QgdXNlZCBmb3IgdDE4NiB5ZXQuDQoNClQxODYg
aHcgZmVhdHVyZSBpcyBhZGRlZCBmb3IgZmlyc3QgdGltZSBhcyBwYXJ0IG9mIGludGVyZmFjZSB0
aW1pbmcgYW5kIGl0cyBpbiBwYXRjaCBuZXh0IHRvIHRoaXMgcGF0Y2ggaW4gc2FtZSBzZXJpZXMu
DQpUaGlzIGlzIHRoZSBzYW1lIGZyb20gYmVnaW5uaW5nIG9mIGFsbCB0aGVzZSBzZXJpZXMuDQoN
Cj4NCj4gPiAgDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfaTJjX2h3X2ZlYXR1cmUg
dGVncmExOTRfaTJjX2h3ID0geyBAQCANCj4gPiAtOTk1LDYgKzEzMTgsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHRlZ3JhX2kyY19od19mZWF0dXJlIHRlZ3JhMTk0X2kyY19odyA9IHsNCj4gPiAg
CS5oYXNfbXN0X2ZpZm8gPSB0cnVlLA0KPiA+ICAJLnF1aXJrcyA9ICZ0ZWdyYTE5NF9pMmNfcXVp
cmtzLA0KPiA+ICAJLnN1cHBvcnRzX2J1c19jbGVhciA9IHRydWUsDQo+ID4gKwkuaGFzX2FwYl9k
bWEgPSBmYWxzZSwNCj4gPiAgfTsNCg0K
