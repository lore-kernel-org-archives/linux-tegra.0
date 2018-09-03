From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v2 15/34] ARM: tegra: apalis_t30: reorder backlight
 properties
Date: Mon, 3 Sep 2018 11:50:23 +0000
Message-ID: <1535975421.14464.2.camel@toradex.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
         <20180831163817.23970-16-marcel@ziswiler.com>
         <20180903092228.7k46uf6qehgou5wx@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903092228.7k46uf6qehgou5wx@holly.lan>
Content-Language: en-US
Content-ID: <D7D3751328FC16458C5888D171360193@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCAyMDE4LTA5LTAzIGF0IDEwOjIyICswMTAwLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6
DQo+IE9uIEZyaSwgQXVnIDMxLCAyMDE4IGF0IDA2OjM3OjU3UE0gKzAyMDAsIE1hcmNlbCBaaXN3
aWxlciB3cm90ZToNCj4gPiBGcm9tOiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0
b3JhZGV4LmNvbT4NCj4gPiANCj4gPiBSZW9yZGVyIGJhY2tsaWdodCBwcm9wZXJ0aWVzLg0KPiAN
Cj4gVGhpcyBpcyBhIGJpdCB0ZXJzZS4gU2hvdWxkIHRoZSBoZWFkZXIgZXhwbGFpbiB3aHkgdG9v
Pw0KDQpJIGFncmVlLiBJIGd1ZXNzIEkgbWlzc2VkIG1lbnRpb25pbmcgaXQgaGVyZSBleHBsaWNp
dGx5LiBBdCBvdGhlcg0KcGxhY2VzIEkgZGlkIHVzdWFsbHkgbWVudGlvbmVkIHRoYXQgaXQgaW1w
cm92ZXMgdGhlIHNpdHVhdGlvbiBpbg0KcmVnYXJkcyB0byBhbGwgb3VyIG90aGVyIGRldmljZSB0
cmVlcy4gSXQncyBqdXN0IGEgcGFpbiB0byBsb29rIGF0DQp2YXJpb3VzIGRldmljZSB0cmVlcyBp
ZiBzdHVmZiBpcyByYW5kb21seSBvcmRlcmVkLg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyY2Vs
IFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQo+ID4gDQo+ID4gLS0tDQo+
ID4gDQo+ID4gQ2hhbmdlcyBpbiB2MjogTm9uZQ0KPiA+IA0KPiA+ICBhcmNoL2FybS9ib290L2R0
cy90ZWdyYTMwLWFwYWxpcy1ldmFsLmR0cyB8IDMgKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvdGVncmEzMC1hcGFsaXMtZXZhbC5kdHMNCj4gPiBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3RlZ3JhMzAtYXBhbGlzLWV2YWwuZHRzDQo+ID4gaW5kZXggOWYyMzkyYTA1NTMyLi4z
MDBjZTcyNmZmNGQgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEzMC1h
cGFsaXMtZXZhbC5kdHMNCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWFwYWxp
cy1ldmFsLmR0cw0KPiA+IEBAIC0xODUsMTMgKzE4NSwxMiBAQA0KPiA+ICANCj4gPiAgCWJhY2ts
aWdodDogYmFja2xpZ2h0IHsNCj4gPiAgCQljb21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOw0K
PiA+IC0JCS8qIFBXTV9CS0wxICovDQo+ID4gLQkJcHdtcyA9IDwmcHdtIDAgNTAwMDAwMD47DQo+
ID4gIAkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MjU1IDIzMSAyMjMgMjA3IDE5MSAxNTkgMTI3DQo+
ID4gMD47DQo+ID4gIAkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDY+Ow0KPiA+ICAJCS8q
IEJLTDFfT04gKi8NCj4gPiAgCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW8gVEVHUkFfR1BJTyhWLCAy
KQ0KPiA+IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICAJCXBvd2VyLXN1cHBseSA9IDwmcmVnXzN2
Mz47DQo+ID4gKwkJcHdtcyA9IDwmcHdtIDAgNTAwMDAwMD47IC8qIEJLTDFfUFdNICovDQo+ID4g
IAl9Ow0KPiA+ICANCj4gPiAgCWdwaW8ta2V5cyB7DQo+ID4gLS0gDQo+ID4gMi4xNC40
