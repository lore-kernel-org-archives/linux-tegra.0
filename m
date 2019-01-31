From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 16:56:56 +0000
Message-ID: <BYAPR12MB3398CFEE7E912513AE48DD2FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
 <4663c7b9-d306-1cd4-1bdc-f7be84af0667@gmail.com>
 <8a88f8ee-24d3-00ac-f1fa-c43b576ed82c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a88f8ee-24d3-00ac-f1fa-c43b576ed82c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+ID4+ICBkcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZyAgICAgfCAgIDIgKy0NCj4gPj4gIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDM2MiANCj4gPj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMzM5IGlu
c2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IFRlZ3JhMjAgY3Jhc2hlcyBi
ZWNhdXNlIG9mIHRoaXMgcGF0Y2g6DQo+ID4gDQo+IFtzbmlwXQ0KPiA+IDw0PlsgICAgMy4zOTU5
MTVdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+IDwyPlsgICAgMy4z
OTU5MTldIGtlcm5lbCBCVUcgYXQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jOjgxMCEN
Cj4gVGhlIEJVRyBsaW5lIGlzIGZyb206DQo+DQo+CWlmIChzdGF0dXMgJiBJMkNfSU5UX1BBQ0tF
VF9YRkVSX0NPTVBMRVRFKSB7DQo+CQlpZiAoaTJjX2Rldi0+aXNfY3Vycl9kbWFfeGZlcikNCj4J
CQlpMmNfZGV2LT5tc2dfYnVmX3JlbWFpbmluZyA9IDA7DQo+CQlCVUdfT04oaTJjX2Rldi0+bXNn
X2J1Zl9yZW1haW5pbmcpOw0KPgkJY29tcGxldGUoJmkyY19kZXYtPm1zZ19jb21wbGV0ZSk7DQo+
CX0NCj4NCkJVR19PTiBsaW5lIGlzIG5vdCBwYXJ0IG9mIHRoaXMgY2hhbmdlLiBJdCB3YXMgYWxy
ZWFkeSB0aGVyZSBpbiBleGlzdGluZyBkcml2ZXIuDQpCYXNlZCBvbiBsb2csIEkgc2VlIERNQSB0
cmFuc2ZlciBpcyBkb25lIGZvciAyMjQgYnl0ZXMgZm9sbG93ZWQgYnkgMSBzdWNjZXNzZnVsIFBJ
TyB0cmFuc2ZlciBhbmQgdGhlbiBvbiBuZXh0IFBJTyB0cmFuc2ZlciBpdCByZWNlaXZlZCBwYWNr
ZXQgeGZlciBjb21wbGV0ZSBpbnRlcnJ1cHQgd2l0aCBpbmNvbXBsZXRlIHRyYW5zZmVyIGJ5dGVz
IGFuZCB0aGF0IHdoZXJlIGl0IGhpdCBCVUdfT04gY29uZGl0aW9uLg0KDQoNCg==
