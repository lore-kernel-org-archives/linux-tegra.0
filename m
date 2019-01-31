From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 21:46:48 +0000
Message-ID: <BYAPR12MB3398D3DCD0DEACD67A58C75FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
 <4663c7b9-d306-1cd4-1bdc-f7be84af0667@gmail.com>
 <8a88f8ee-24d3-00ac-f1fa-c43b576ed82c@gmail.com>
 <BYAPR12MB3398CFEE7E912513AE48DD2FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
 <e50a353c-94c4-1a47-92a4-5f41f4f64aa7@gmail.com>
 <c2676c08-83d7-2ac9-ce34-c7c7f86d798e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c2676c08-83d7-2ac9-ce34-c7c7f86d798e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

PiBJdCB3b3JrcyB3aXRoIHRoaXMgY2hhbmdlOg0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy10ZWdyYS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jIGlu
ZGV4IGZlNWI4OWFiYzU3Ni4uOGUwNTllOTRiOTRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXRlZ3JhLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdy
YS5jDQo+IEBAIC0xMTcwLDEwICsxMTcwLDExIEBAIHN0YXRpYyBpbnQgdGVncmFfaTJjX3hmZXJf
bXNnKHN0cnVjdCB0ZWdyYV9pMmNfZGV2ICppMmNfZGV2LA0KPiAgICAgICAgICAgICAgICAgdGlt
ZV9sZWZ0LCBjb21wbGV0aW9uX2RvbmUoJmkyY19kZXYtPm1zZ19jb21wbGV0ZSksDQo+ICAgICAg
ICAgICAgICAgICBpMmNfZGV2LT5tc2dfZXJyKTsNCj4NCj4gKyAgICAgICB0ZWdyYV9pMmNfaW5p
dChpMmNfZGV2LCB0cnVlKTsNCj4gKw0KPiAgICAgICAgIGlmIChsaWtlbHkoaTJjX2Rldi0+bXNn
X2VyciA9PSBJMkNfRVJSX05PTkUpKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAN
Cj4gLSAgICAgICB0ZWdyYV9pMmNfaW5pdChpMmNfZGV2LCB0cnVlKTsNCj4gICAgICAgICAvKiBz
dGFydCByZWNvdmVyeSB1cG9uIGFyYml0cmF0aW9uIGxvc3MgaW4gc2luZ2xlIG1hc3RlciBtb2Rl
ICovDQo+ICAgICAgICAgaWYgKGkyY19kZXYtPm1zZ19lcnIgPT0gSTJDX0VSUl9BUkJJVFJBVElP
Tl9MT1NUKSB7DQo+ICAgICAgICAgICAgICAgICBpZiAoIWkyY19kZXYtPmlzX211bHRpbWFzdGVy
X21vZGUpDQo+DQo+DQo+IFdoaWNoIG1lYW5zIHRoYXQgSFcgc3RhdGUgaXMga2VwdCBkaXJ0eSBh
ZnRlciBETUEgdHJhbnNmZXIuIFBsZWFzZSBjaGVjayBldmVyeXRoaW5nIGNhcmVmdWxseS4NCg0K
SWRlbnRpZmllZCBpc3N1ZSwgV2hlbiBJIG1vdmVkIGxvZ2ljIGFyb3VuZCBmb3IgZGlmZiBjaGFu
Z2VzLCBJTlQgZW5hYmxlIGlzbuKAmXQgY29ycmVjdCBmb3IgRklGTyBEQVRBIFJFUS4gV2lsbCBo
YXZlIHByb3BlciBmaXggaW4gbmV4dCB2ZXJzaW9uLiANCg0K
