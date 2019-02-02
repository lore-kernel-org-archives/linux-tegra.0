From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Sat, 2 Feb 2019 18:43:57 +0000
Message-ID: <BYAPR12MB339885398C3B0218D452B6CAC2930@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <951cf1f5-ba3a-94ef-0399-2259effebc99@gmail.com>
 <BYAPR12MB33984FB81B8BB1EC8C0C4908C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
 <6150de70-6ca8-944a-780a-4574ff2b21c7@gmail.com>
 <f667ab55-c7c7-4ac1-100a-7f7ade87708d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f667ab55-c7c7-4ac1-100a-7f7ade87708d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+ID4+Pj4gK3N0YXRpYyBpbnQgdGVncmFfaTJjX2luaXRfZG1hKHN0cnVjdCB0ZWdyYV9pMmNf
ZGV2ICppMmNfZGV2KSB7DQo+ID4+Pj4gKwlzdHJ1Y3QgZG1hX2NoYW4gKmRtYV9jaGFuOw0KPiA+
Pj4+ICsJdTMyICpkbWFfYnVmOw0KPiA+Pj4+ICsJZG1hX2FkZHJfdCBkbWFfcGh5czsNCj4gPj4+
PiArCWludCBlcnIgPSAwOw0KPiA+Pj4+ICsNCj4gPj4+PiArCWlmICghSVNfRU5BQkxFRChDT05G
SUdfVEVHUkEyMF9BUEJfRE1BKSkNCj4gPj4+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gPj4+DQo+
ID4+PiBEcml2ZXIgc2hhbGwgbm90IGZhaWwgdG8gcHJvYmUgaWYgRE1BIGRyaXZlciBpcyBkaXNh
YmxlZCwgYnV0IHRvIGNvbnRpbnVlIHdpdGggdGhlIFBJTy1vbmx5IG1vZGUgYXZhaWxhYmxlLg0K
PiA+Pj4NCj4gPj4+IFNob3VsZCBiZToNCj4gPj4+DQo+ID4+PiAJaWYgKCFJU19FTkFCTEVEKENP
TkZJR19URUdSQTIwX0FQQl9ETUEpKQ0KPiA+Pj4gCQlyZXR1cm4gMDsNCj4gPj4+DQo+ID4+IEV4
Y2VwdCBFUFJPQkVfREVGRVIsIGFueXRoaW5nIGVsc2UgcmV0dXJuZWQgZnJvbSB0ZWdyYV9pMmNf
aW5pdF9kbWEgDQo+ID4+IChFTk9ERVYvRU5PTUVNKSBpcyBpZ25vcmVkIGluIGkyY19wcm9iZSBE
TUEgbW9kZSBkZWNpc2lvbiBpcyBiYXNlZCBvbiB4ZmVyIHNpemUgYW5kIGF2YWlsYWJpbGl0eSBv
ZiBkbWEgY2hhbm5lbCBvciBjYW4gYmUgY2hhbmdlZCBiYXNlZCBvbiB2YWxpZCBkbWEgYnVmIHRv
IHNob3J0ZW4gdGhlIGxpbmUuDQo+ID4+DQo+ID4gDQo+ID4gQWgsIHNvcnJ5LiBJIG1pc3NlZCB0
aGF0LCBzZWVtcyBnb29kIHRoZW4uDQo+ID4gDQo+DQo+IEJUVywgaXQgbWF5IGJlIHdvcnRod2hp
bGUgdG8gbW92ZSBvdXQgdGhlIGVycm9yIGNvZGUgaGFuZGxpbmcgaW50byB0ZWdyYV9pMmNfaW5p
dF9kbWEoKSBmb3IgY2xhcml0eS4gSXQgYWxzbyB3b24ndCBodXJ0IHRvIG5vdCBpZ25vcmUgZXJy
b3JzIG90aGVyIHRoYW4gLUVOT0RFVi4NCg0KRWl0aGVyIHdheXMgYXJlIHNhbWUuIFRvIGJlIG1v
cmUgcmVhZGFibGUvY2xlYXIgb24gZXJyb3IgdHlwZXMgZm9yIGRpZmYgY2FzZXMgYW5kIGVycm9y
cyB0aGF0IHdlIGFyZSBpZ25vcmluZywgSSBhbSBleHBsaWNpdGx5IGtlZXBpbmcgZXJyb3IgY29k
ZWNzIChFUFJPQkVfREVGRVIvRU5PREVWL0VOT01FTSkgc2FtZSB3YXkuDQpBbHNvIGluIHByb2Jl
IGZvciByZWFkYWJpbGl0eSBjaGVja2luZyB3aXRoIEVQUk9CRV9ERUZFUiB3aGljaCBleHBsaWNp
dGx5IGluZGljYXRpbmcgd2Uga2VlcCBkZWZlcnJpbmcgaTJjIHByb2JlIHJhdGhlciB0aGFuIHNp
bXBsZSByZXR1cm4uDQoNCg==
