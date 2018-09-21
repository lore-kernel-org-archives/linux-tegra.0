From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [RESEND PATCH 1/6] ARM: config: multi_v5: enable dynamic debug
Date: Fri, 21 Sep 2018 16:58:29 +0000
Message-ID: <1537549106.6513.1.camel@toradex.com>
References: <20180814140612.12554-1-marcel@ziswiler.com>
         <9461e62248cc7c1b5585004ff8cf7268b823e29c.camel@perches.com>
         <f20387e3-4cce-78eb-886c-03ab8c39ae42@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f20387e3-4cce-78eb-886c-03ab8c39ae42@gmail.com>
Content-Language: en-US
Content-ID: <FBACB5C17289DF4E9483FAAC4ACA2F1E@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "golf@perches.com" <golf@perches.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "andrew@aj.id.au" <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>, "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCAyMDE4LTA4LTE1IGF0IDE4OjI5IC0wNzAwLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
Og0KPiANCj4gT24gMDgvMTQvMjAxOCAwNzoxNiBBTSwgSm9lIFBlcmNoZXMgd3JvdGU6DQo+ID4g
T24gVHVlLCAyMDE4LTA4LTE0IGF0IDE2OjA2ICswMjAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+ID4gPiBGcm9tOiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNv
bT4NCj4gPiA+IA0KPiA+ID4gRHluYW1pYyBkZWJ1ZyBpcyByZWFsbHkgaGVscGZ1bC4NCj4gPiAN
Cj4gPiBJdCdzIHVzZWZ1bCwgYnV0IHBlcmhhcHMgbm90IGFwcHJvcHJpYXRlLg0KPiA+IA0KPiA+
IE1vc3QgYXJtIGNvbmZpZ3MgYXJlIGZvciBzbWFsbCByZXNvdXJjZSBjb25zdHJhaW5lZCBzeXN0
ZW1zLg0KPiANCj4gWWVzLCBidXQgbXVsdGlfdipfZGVmY29uZmlnLCBieSBkZWZpbml0aW9uIGFy
ZSBub3QsIHNvIHRoaXMgcmVhbGx5DQo+IHNlZW1zDQo+IGFjY2VwdGFibGUgdG8gbWUgaGVyZS4N
Cg0KV2hhdCBpcyB0aGUgY29uY2x1c2lvbiBub3c/IElzIGFueWJvZHkgZ29uYSBwdWxsIHRoaXMg
cGF0Y2hzZXQgaW4/IE9yDQphcmUgYW55IGNoYW5nZXMgbmVlZGVkPw0KDQo+ID4gZHluYW1pY19k
ZWJ1ZyBhZGRzIGEgbG90IG9mIGFkZGl0aW9uYWwgdGV4dCBhbmQgYSBmYWlyIGFtb3VudCBvZg0K
PiA+IGRhdGEuDQo+ID4gDQo+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjZWwgWmlzd2ls
ZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4gPiA+IA0KPiA+ID4gLS0tDQo+ID4g
PiANCj4gPiA+ICBhcmNoL2FybS9jb25maWdzL211bHRpX3Y1X2RlZmNvbmZpZyB8IDEgKw0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcNCj4gPiA+IGIvYXJjaC9h
cm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcNCj4gPiA+IGluZGV4IDMxOGI3NmZhMjZkMS4u
YjMwMmFjNjhkNTg3IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92
NV9kZWZjb25maWcNCj4gPiA+ICsrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjVfZGVmY29u
ZmlnDQo+ID4gPiBAQCAtMjc1LDYgKzI3NSw3IEBAIENPTkZJR19OTFNfQ09ERVBBR0VfODUwPXkN
Cj4gPiA+ICBDT05GSUdfTkxTX0lTTzg4NTlfMT15DQo+ID4gPiAgQ09ORklHX05MU19JU084ODU5
XzI9eQ0KPiA+ID4gIENPTkZJR19OTFNfVVRGOD15DQo+ID4gPiArQ09ORklHX0RZTkFNSUNfREVC
VUc9eQ0KPiA+ID4gIENPTkZJR19ERUJVR19JTkZPPXkNCj4gPiA+ICBDT05GSUdfREVCVUdfRlM9
eQ0KPiA+ID4gIENPTkZJR19NQUdJQ19TWVNSUT15DQo+ID4gDQo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdA0KPiA+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbA==
