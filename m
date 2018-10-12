From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 13:13:43 +0000
Message-ID: <1539350021.30485.45.camel@toradex.com>
References: <20180906122436.25610-1-linus.walleij@linaro.org>
         <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
         <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
         <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
         <1539272073.18645.12.camel@toradex.com>
         <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
         <1539337415.30485.21.camel@toradex.com>
         <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
         <20181012104338.GS30658@n2100.armlinux.org.uk>
         <1539344591.30485.28.camel@toradex.com>
         <20181012125911.GT30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012125911.GT30658@n2100.armlinux.org.uk>
Content-Language: en-US
Content-ID: <F22801CE320C904D97148006A4A0711B@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "jacopo@jmondi.org" <jacopo@jmondi.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, "shc_work@mail.ru" <shc_work@mail.ru>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>, "zonque@gmail.com" <zonque@gmail.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCAyMDE4LTEwLTEyIGF0IDEzOjU5ICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggd3JvdGU6DQo+IE9uIEZyaSwgT2N0IDEyLCAyMDE4IGF0IDExOjQzOjEzQU0gKzAwMDAsIE1h
cmNlbCBaaXN3aWxlciB3cm90ZToNCj4gPiBJIGRvbid0IHRoaW5rIGl0IGlzIHRoYXQgZmljdGl0
aW91cyBhcyBpdCBtYWtlcyBpdCBjcnlzdGFsIGNsZWFyDQo+ID4gdGhhdA0KPiA+IHRoZXJlIGlz
IHNvbWV0aGluZyBzaGFyZWQgd2l0aCBhbGwgaXRzIHByb3MgYW5kIGNvbnMuIEUuZy4gd2hhdA0K
PiA+IGhhcHBlbnMNCj4gPiBpZiBvbmUgb2YgdGhlbSByZWd1bGF0b3JzIHdhbnRzIHRvIHR1cm4g
b2ZmIHdoaWxlIHRoZSBvdGhlciBvbmUNCj4gPiBzdGlsbA0KPiA+IG5lZWRzIHBvd2VyPyBUaGUg
cmVndWxhciByZWd1bGF0b3IgZGVwZW5kZW5jeSB0cmVlIHdvdWxkIG5pY2VseQ0KPiA+IG1ha2UN
Cj4gPiB0aGlzIGFsbCBjbGVhci4NCj4gDQo+IElmIHlvdSdyZSBpbnRyb2R1Y2luZyBhIHJlZ3Vs
YXRvciB0aGF0IGRvZXNuJ3QgZXhpc3QgaW4gcmVhbGl0eQ0KPiBqdXN0IHRvIGJlIGFibGUgdG8g
c2hhcmUgYSBHUElPIGxpbmUgdGhhdCBpcyB3aXJlZCB0byBzZXZlcmFsDQo+IHJlYWwgcmVndWxh
dG9ycywgdGhlbiBpdCBfaXNfIGZpY3RpY2lvdXMuICBZb3UncmUgbm90IGRlc2NyaWJpbmcNCj4g
dGhlIGhhcmR3YXJlLCB5b3UncmUgZGVzY3JpYmluZyBzb21ldGhpbmcgZWxzZSB0byB3b3JrIGFy
b3VuZCB0aGUNCj4gc2hvcnRjb21pbmdzIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiB0aGF0IGNhbid0
IGNvcGUgd2l0aCBob3cgc3R1ZmYNCj4gaXMgd2lyZWQgdXAgaW4gdGhlIHJlYWwgd29ybGQuICBZ
b3UncmUgbWFraW5nIHRoZSBEVCBkZXNjcmlwdGlvbg0KPiBmaXQgdGhlIHNvZnR3YXJlIGltcGxl
bWVudGF0aW9uLCByYXRoZXIgdGhhbiB0aGUgc29mdHdhcmUNCj4gaW1wbGVtZW50YXRpb24gZml0
IHRoZSByZWFsIHdvcmxkIGhhcmR3YXJlLg0KPiANCj4gSGF2aW5nIGEgc2luZ2xlIEdQSU8gdGhh
dCBjb250cm9scyBtdWx0aXBsZSBzZXBhcmF0ZSByZWd1bGF0b3JzDQo+IHdoaWNoIGhhdmUgZW50
aXJlbHkgc2VwYXJhdGUgc3VwcGxpZXMgb2YgdGhlaXIgb3duIGlzIHZlcnkgY29tbW9uDQo+IGlu
IGVsZWN0cm9uaWNzLg0KDQpTdXJlLCBmaW5lLiBJIHdpbGwgZHJvcCBpdC4gVGhhbmtzIQ==
