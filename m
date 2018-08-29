From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH 13/26] ARM: tegra: colibri_t30: use proper irq-gpio for
 stmpe811
Date: Wed, 29 Aug 2018 14:56:59 +0000
Message-ID: <1535554617.14664.30.camel@toradex.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
         <20180723123658.980-14-marcel@ziswiler.com>
         <844bac7c4e00a014f5e5b857e38a47bf@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <844bac7c4e00a014f5e5b857e38a47bf@agner.ch>
Content-Language: en-US
Content-ID: <D45AECD8DCABB548B2590B692D3CAE5E@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "stefan@agner.ch" <stefan@agner.ch>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-tegra-owner@vger.kernel.org" <linux-tegra-owner@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDE4LTA3LTI2IGF0IDEwOjA3ICswMjAwLCBTdGVmYW4gQWduZXIgd3JvdGU6DQo+
IE9uIDIzLjA3LjIwMTggMTQ6MzYsIE1hcmNlbCBaaXN3aWxlciB3cm90ZToNCj4gPiBGcm9tOiBN
YXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4gPiANCj4gPiBV
c2UgcHJvcGVyIGlycS1ncGlvIGZvciBzdG1wZTgxMSB0b3VjaCBjb250cm9sbGVyLg0KPiANCj4g
SSBkb24ndCB0aGluayB0aGlzIGNoYW5nZSBpcyBuZWNlc3NhcnksIGludGVycnVwdHMvaW50ZXJy
dXB0LXBhcmVudA0KPiBzcGVjaWZpY2F0aW9uIHNlZW1zIHRvIGJlIHN1cHBvcnRlZCBieSB0aGUg
ZHJpdmVyIGFzIHdlbGwuDQoNClllcywgaG93ZXZlciwgc2hvdWxkIHlvdSBsb29rIGF0IHRoZSBk
cml2ZXIgbW9yZSBjbG9zZWx5IHlvdSBtYXkgbm90aWNlDQp0aGF0IG9ubHkgaWYgdXNpbmcgaXJx
LWdwaW8gdGhlIEdQSU8gaW4gcXVlc3Rpb24gYWxzbyBkb2VzIGdldCBwcm9wZXJseQ0KcmVxdWVz
dGVkIGJ5IGRldm1fZ3Bpb19yZXF1ZXN0X29uZSgpIHdpdGggYW4gInN0bXBlIiBsYWJlbC4gU28g
SSByZWFsbHkNCmRvIHRoaW5rIGRvaW5nIGl0IHRoaXMgd2F5IGlzIGFkdmFudGFnZW91cy4gSSBk
aWQgbm90aWNlIHRoaXMNCmRpZmZlcmVuY2UgYnkgY2hhbmNlIHdoZW4gZmlnaHRpbmcgc29tZSBw
cm9iZSBkZWZlciBpc3N1ZXMgZWFybGllci4NCg0KPiAtLQ0KPiBTdGVmYW4NCj4gDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRl
eC5jb20+DQo+ID4gDQo+ID4gLS0tDQo+ID4gDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL3RlZ3Jh
MzAtY29saWJyaS5kdHNpIHwgMyArLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy90ZWdyYTMwLWNvbGlicmkuZHRzaQ0KPiA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEz
MC1jb2xpYnJpLmR0c2kNCj4gPiBpbmRleCBjODBiOWJmNDQ3NTIuLmFjZTcyYTUzMTg2YSAxMDA2
NDQNCj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWNvbGlicmkuZHRzaQ0KPiA+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMzAtY29saWJyaS5kdHNpDQo+ID4gQEAgLTgz
Niw4ICs4MzYsNyBAQA0KPiA+ICAJCXN0bXBlODExQDQxIHsNCj4gPiAgCQkJY29tcGF0aWJsZSA9
ICJzdCxzdG1wZTgxMSI7DQo+ID4gIAkJCXJlZyA9IDwweDQxPjsNCj4gPiAtCQkJaW50ZXJydXB0
cyA9IDxURUdSQV9HUElPKFYsIDApDQo+ID4gSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiAtCQkJ
aW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpbz47DQo+ID4gKwkJCWlycS1ncGlvID0gPCZncGlvIFRF
R1JBX0dQSU8oViwgMCkNCj4gPiBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICAJCQlpbnRlcnJ1
cHQtY29udHJvbGxlcjsNCj4gPiAgCQkJaWQgPSA8MD47DQo+ID4gIAkJCWJsb2NrcyA9IDwweDU+
Ow==
