From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 09:43:37 +0000
Message-ID: <1539337415.30485.21.camel@toradex.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
         <20180906122436.25610-1-linus.walleij@linaro.org>
         <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
         <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
         <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
         <1539272073.18645.12.camel@toradex.com>
         <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
Content-Language: en-US
Content-ID: <3140E6B455FBA04390E32157F31E1659@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "jacopo@jmondi.org" <jacopo@jmondi.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "shc_work@mail.ru" <shc_work@mail.ru>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>, "zonque@gmail.com" <zonque@gmail.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "linux-tegra@vger.kernel.org" <linux-te>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDE4LTEwLTExIGF0IDE5OjQ3ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAxMSwgMjAxOCBhdCA1OjM0IFBNIE1hcmNlbCBaaXN3aWxlcg0KPiA8bWFy
Y2VsLnppc3dpbGVyQHRvcmFkZXguY29tPiB3cm90ZToNCj4gDQo+ID4gSSBndWVzcyB0aGF0IGlz
IGFsc28gd2hhdCBicm9rZSBIRE1JIG9uIEFwYWxpcy9Db2xpYnJpIFQzMCBjYXVzaW5nDQo+ID4g
bWUNCj4gPiB0byBzdWJtaXQgYSBmaXggWzFdLiBJIG1heSBhbHNvIGhlbHAgdGVzdGluZy4NCj4g
DQo+IEkgc2VlIHRoZXJlIGFyZSBtYW55IHdheXMgdG8gc2tpbiB0aGlzIGNhdC4NCg0KWWVzLCBh
cyBhIG1hdHRlciBvZiBmYWN0IEkgc2NyZWVuZWQgdGhlIGtlcm5lbCBjb25jZXJuaW5nIHRoaXMg
bXVsdGkNCmdwaW8gc3R1ZmYgYnV0IGNvdWxkIG5vdCBxdWl0ZSBmaW5kIG1hbnkgZXhhbXBsZXMg
YW5kIG5vIG1lbnRpb25pbmcNCmFueXdoZXJlIHdoZXRoZXIgb3Igbm90IHRoaXMgaXMgYWN0dWFs
bHkgYWxsb3dlZC4gU28gSSBraW5kIG9mIGFzc3VtZWQNCnRoYXQgdGhpcyBtYXkganVzdCBub3Qg
cmVhbGx5IGJlIGFsbG93ZWQgYW5kIGNvb2tlZCB1cCBteSBwYXRjaCB3aGljaA0KaXMgYW55d2F5
IGtpbmQgb2YgYSBjbGVhbmVyIHNvbHV0aW9uLiBJIG1lYW4gZXhwbGljaXRseSBtb2RlbGxpbmcg
dGhlDQpHUElPIGludG8gc29tZSBpbnRlcm1lZGlhdGUgcmVndWxhdG9yIHN1cHBseWluZyB0aGUg
b3RoZXJzLg0KDQo+IERvZXMgdGhpcyBwYXRjaCBmaXggdGhpbmdzIGZvciB5b3UgYXMgd2VsbD8N
Cj4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgta2VybmVsJm09MTUzOTI2ODU0MzI3MTc2Jnc9
Mg0KDQpZZXMsIGRhLWRhIGFuZCBIRE1JIHdvcmtzIGFnYWluLiBUaGFua3MhDQoNCkkgd2lsbCBz
dGlsbCB0cnkgdG8gZ2V0IG15IG90aGVyIHBhdGNoIGluIGFzIGxpa2UgbWVudGlvbmVkIGFib3Zl
IEkNCmZlZWwgaXQgaXMgYSBjbGVhbmVyIHNvbHV0aW9uIHRvIG91ciByZWd1bGF0b3Igc2V0dXAu
DQoNCkJUVzogSGF2ZSB5b3UgaGVhcmQgb2YgbG9yZSBhcyB3ZWxsPyBJIGJlbGlldmUgaXQgaXMg
dGhlIGJldHRlciBtYWlsaW5nDQpsaXN0IGFyY2hpdmUgYXMgb2YgdG9kYXk6DQoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxODEwMTExNDM1MzEuNzE5NS0xLWxpbnVzLndhbGxlaWpA
bGluYXJvDQoub3JnLw0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlq
