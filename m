From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V2 3/4] i2c: tegra: Add DMA Support
Date: Fri, 25 Jan 2019 20:31:08 +0000
Message-ID: <BYAPR12MB339829FC6F2F95F833FE45A1C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
 <1548363113-25969-3-git-send-email-skomatineni@nvidia.com>
 <dcc1e094-638e-5b04-7a61-bdbc24ee068f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dcc1e094-638e-5b04-7a61-bdbc24ee068f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+ID4gKwlpZiAoaTJjX2Rldi0+aGFzX2RtYSkgew0KPiA+ICsJCXJldCA9IHRlZ3JhX2kyY19p
bml0X2RtYV9wYXJhbShpMmNfZGV2LCB0cnVlKTsNCj4gPiArCQlpZiAocmV0ID09IC1FUFJPQkVf
REVGRVIpDQo+ID4gKwkJCWdvdG8gZGlzYWJsZV9kaXZfY2xrOw0KPiA+ICsJCXJldCA9IHRlZ3Jh
X2kyY19pbml0X2RtYV9wYXJhbShpMmNfZGV2LCBmYWxzZSk7DQo+ID4gKwkJaWYgKHJldCA9PSAt
RVBST0JFX0RFRkVSKQ0KPiA+ICsJCQlnb3RvIGRpc2FibGVfZGl2X2NsazsNCj4NCj4gU28gdGVn
cmFfaTJjX2luaXRfZG1hX3BhcmFtKCkgY291bGQgZmFpbCwgcHJpbnRpbmcgYSBlcnJvciBtZXNz
YWdlLCBhbmQgcHJvYmUgd2lsbCBzdWNjZWVkPyBJZiBhbGxvY2F0aW9uIGZhaWxzIGR1cmluZyB0
aGUgZHJpdmVyJ3MgcHJvYmUsIHRoZW4ganVzdCBmYWlsIHRoZSBwcm9iZS4gUGxlYXNlIGdpdmUg
dGhlIHJhdGlvbmFsZS4NCg0KSWYgQVBCIERNQSBwcm9iZSBkb2VzbuKAmXQgaGFwcGVuIHByaW9y
IHRvIHRlZ3JhIGkyYywgRE1BIGlzIG5vdCBhdmFpbGFibGUgYnkgdGhlIHRpbWUgdGVncmFfaW5p
dF9kbWFfcGFyYW0gdHJpZXMgdG8gcmVxdWVzdCBzbGF2ZSBjaGFubmVsIGFuZCBpbiB0aG9zZSBj
YXNlcyBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsX3JlYXNvbiB3aWxsIHJldHVybiBFUFJPQkVf
REVGRVIgZm9yIHRlZ3JhIEkyQyBwcm9iZSB0byByZXRyeQ0KDQpJbiBjYXNlIGlmIERNQSBpcyBh
dmFpbGFibGUgYnV0IERNQSBidWZmZXIgYWxsb2NhdGlvbiBmYWlscywgdGhlbiB0ZWdyYV9pMmNf
aW5pdF9kbWFfcGFyYW0gcmV0dXJucyBFTk9NRU0gYW5kIHByb2JlIGFsc28gZmFpbHMgcmV0dXJu
aW5nIHNhbWUgRU5PTUVNDQoNClRoYW5rcw0KU293amFueWENCg0K
