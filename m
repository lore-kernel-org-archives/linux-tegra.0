From: Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: Regression: SUNRPC: Use poll() to fix up the socket requeue races
Date: Mon, 25 Feb 2019 21:03:48 +0000
Message-ID: <ab485d7ba4f9603850b81e6c2242dc25026eabcb.camel@hammerspace.com>
References: <95702994-6762-e42b-06ee-ae945c2137bd@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <95702994-6762-e42b-06ee-ae945c2137bd@nvidia.com>
Content-Language: en-US
Content-ID: <273E302E5EDAB447A081E11307CDFB63@namprd13.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCAyMDE5LTAyLTI1IGF0IDIwOjI1ICswMDAwLCBKb24gSHVudGVyIHdyb3RlOg0KPiBI
aSBUcm9uZCwNCj4gDQo+IFN0YXJ0aW5nIGluIG5leHQtMjAxOTAyMjIgSSBoYXZlIG9ic2VydmVk
IGEgcmVncmVzc2lvbiB3aXRoIE5GUw0KPiBjYXVzaW5nDQo+IHNvbWUgb2Ygb3VyIGJvYXJkcyB0
byBmYWlsIHRvIGJvb3QuIEJpc2VjdCBwb2ludHMgdG8geW91ciBjb21taXQgLi4uDQo+IA0KPiBj
b21taXQgMGZmZTg2ZjQ4MDI2YjdmMzRkYjIyZDEwMDRiYzk5OTJmMGRiOGIzMw0KPiBBdXRob3I6
IFRyb25kIE15a2xlYnVzdCA8dHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbT4NCj4gRGF0
ZTogICBXZWQgSmFuIDMwIDE0OjUxOjI2IDIwMTkgLTA1MDANCj4gDQo+ICAgICBTVU5SUEM6IFVz
ZSBwb2xsKCkgdG8gZml4IHVwIHRoZSBzb2NrZXQgcmVxdWV1ZSByYWNlcw0KPiANCj4gDQo+IEFm
dGVyIHJldmVydGluZyB0aGlzIG9uIHRvcCBvZiAtbmV4dCBJIG5vIGxvbmdlciBzZWUgdGhlIHBy
b2JsZW0uIEkNCj4gaGF2ZQ0KPiBub3QgaGFkIGNoYW5jZSB0byBsb29rIGFueSBjbG9zZXIsIGJ1
dCB3YW50ZWQgdG8gc2VlIGlmIHlvdSBoYWQgYW55DQo+IGlkZWFzIHdoYXQgbWlnaHQgYmUgdGhl
IHByb2JsZW0uDQo+IA0KPiBDaGVlcnMNCj4gSm9uDQoNCldoYXQga2luZCBvZiBib290IGlzIHRo
aXM/IFVEUCBvciBUQ1A/IG5mc3Jvb3Q/IE5GU3YzIG9yIE5GU3Y0PyANCg0KLS0gDQpUcm9uZCBN
eWtsZWJ1c3QNCkxpbnV4IE5GUyBjbGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UNCnRyb25k
Lm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20NCg0KDQo=
