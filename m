From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH] pinctrl: tegra: fix spelling in devicetree binding
 document
Date: Fri, 20 Jul 2018 08:24:16 +0000
Message-ID: <1532075054.19673.5.camel@toradex.com>
References: <20180720075235.18617-1-marcel@ziswiler.com>
         <5e51036b-a0b0-9cb4-4698-cf830309ef8a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5e51036b-a0b0-9cb4-4698-cf830309ef8a@nvidia.com>
Content-Language: en-US
Content-ID: <C97AEDD578193941A5A43705314AE296@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCAyMDE4LTA3LTIwIGF0IDA5OjEyICswMTAwLCBKb24gSHVudGVyIHdyb3RlOg0KPiBP
biAyMC8wNy8xOCAwODo1MiwgTWFyY2VsIFppc3dpbGVyIHdyb3RlOg0KPiA+IEZyb206IE1hcmNl
bCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KPiA+IA0KPiA+IFRoaXMg
Zml4ZXMgYSBzcGVsbGluZyBtaXN0YWtlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmNl
bCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KPiA+IA0KPiA+IC0tLQ0K
PiA+IA0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9udmlk
aWEsdGVncmExMjQtDQo+ID4gcGlubXV4LnR4dCB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbnZpZGlhLHRlZ3Jh
MTI0LQ0KPiA+IHBpbm11eC50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL252aWRpYSx0ZWdyYTEyNC0NCj4gPiBwaW5tdXgudHh0DQo+ID4gaW5kZXgg
ZWNiNWMwZDI1MjE4Li5mNGQwNmJiMGI1NWEgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbnZpZGlhLHRlZ3JhMTI0LQ0KPiA+IHBpbm11
eC50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9udmlkaWEsdGVncmExMjQtDQo+ID4gcGlubXV4LnR4dA0KPiA+IEBAIC0xNyw3ICsxNyw3IEBA
IFRlZ3JhMTI0IGFkZHMgdGhlIGZvbGxvd2luZyBvcHRpb25hbCBwcm9wZXJ0aWVzDQo+ID4gZm9y
IHBpbiBjb25maWd1cmF0aW9uIHN1Ym5vZGVzLg0KPiA+ICBUaGUgbWFjcm9zIGZvciBvcHRpb25z
IGFyZSBkZWZpbmVkIGluIHRoZQ0KPiA+ICAJaW5jbHVkZS9kdC1iaW5kaW5nL3BpbmN0cmwvcGlu
Y3RybC10ZWdyYS5oLg0KPiA+ICAtIG52aWRpYSxlbmFibGUtaW5wdXQ6IEludGVnZXIuIEVuYWJs
ZSB0aGUgcGluJ3MgaW5wdXQgcGF0aC4NCj4gPiAtCQllbmFibGUgOlRFR1JBX1BJTl9FTkFCTEUw
IGFuZA0KPiA+ICsJCWVuYWJsZSA6VEVHUkFfUElOX0VOQUJMRSBhbmQNCj4gPiAgCQlkaXNhYmxl
IG9yIG91dHB1dCBvbmx5OiBURUdSQV9QSU5fRElTQUJMRS4NCj4gPiAgLSBudmlkaWEsb3Blbi1k
cmFpbjogSW50ZWdlci4NCj4gPiAgCQllbmFibGU6IFRFR1JBX1BJTl9FTkFCTEUuDQo+IA0KPiBU
aGFua3MgZm9yIGZpeGluZyEgQ2FuIHlvdSBhbHNvIGZpeCB1cCB0aGUgb25lIGluIG52aWRpYSx0
ZWdyYTIxMC0NCj4gcGlubXV4LnR4dCBhcyB3ZWxsPw0KDQpTdXJlLCB0aGF0IHJlbWluZHMgbWUg
dG8gYWx3YXlzIGdyZXAgdGhyb3VnaCB0aGUgd2hvbGUgdHJlZSBmb3Igc3VjaA0KY3VyaW9zaXRp
ZXMgKDstcCkuDQoNCkkganVzdCBzZW50IG91dCBhIHYyLg0KDQo+IENoZWVycyENCj4gSm9u
