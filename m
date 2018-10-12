From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 11:43:13 +0000
Message-ID: <1539344591.30485.28.camel@toradex.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
         <20180906122436.25610-1-linus.walleij@linaro.org>
         <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
         <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
         <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
         <1539272073.18645.12.camel@toradex.com>
         <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
         <1539337415.30485.21.camel@toradex.com>
         <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
         <20181012104338.GS30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012104338.GS30658@n2100.armlinux.org.uk>
Content-Language: en-US
Content-ID: <7BD4B64D1813F245BE7182715121AD89@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "jacopo@jmondi.org" <jacopo@jmondi.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, "shc_work@mail.ru" <shc_work@mail.ru>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>, "zonque@gmail.com" <zonque@gmail.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jmkrzyszt@gmail.com" <jmkrzy>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCAyMDE4LTEwLTEyIGF0IDExOjQzICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggd3JvdGU6DQo+IE9uIEZyaSwgT2N0IDEyLCAyMDE4IGF0IDExOjM5OjE1QU0gKzAxMDAsIEpv
biBIdW50ZXIgd3JvdGU6DQo+ID4gV2UgaGFkIHRoZSBzYW1lIHNpdHVhdGlvbiBmb3IgVGVncmEx
MjQgSmV0c29uIFRLMSBidXQgSSBkb24ndCB0aGluaw0KPiA+IHRoYXQNCj4gPiBhZGRpbmcgYSBw
c2V1ZG8gaW50ZXJtZWRpYXRlIHJlZ3VsYXRvciBpcyBjbGVhbmVyLiBJZiB0aGUgR1BJTw0KPiA+
IGNvbnRyb2xzDQo+ID4gbW9yZSB0aGFuIG9uZSByZWd1bGF0b3IsIEkgZG9uJ3Qgc2VlIHdoeSBp
cyBpdCBuZWNlc3NhcnkgdG8gY2hhbmdlDQo+ID4gdGhlDQo+ID4gRFQuIFRoZXJlIGFyZSBzZXZl
cmFsIG90aGVyIHBlb3BsZSByZXBvcnRpbmcgdGhlIHNhbWUgcHJvYmxlbSB3aXRoDQo+ID4gdmFy
aW91cyBkaWZmZXJlbnQgYm9hcmRzLiBTbyB0aGlzIGRvZXMgc2VlbSB0byBiZSBhIGNvbW1vbiB1
c2FnZS4NCj4gDQo+IEdpdmVuIHRoYXQgRFQgZGVzY3JpYmVzIHRoZSBoYXJkd2FyZSwgbm90IHRo
ZSBzb2Z0d2FyZQ0KPiBpbXBsZW1lbnRhdGlvbiwNCj4gaXQgbXVzdCBub3QgY2hhbmdlIGp1c3Qg
YmVjYXVzZSB3ZSBtb3ZlIGZyb20gR1BJTyBudW1iZXJzIHRvIEdQSU8NCj4gZGVzY3JpcHRvcnMu
DQoNClllcywgdGhhdCBJIGRvIGFncmVlLiBIb3dldmVyLCBsaWtlIG1lbnRpb25lZCBiZWZvcmUg
b24gcXVpY2sgZ2xhbmNlIEkNCnJlYWxseSBjb3VsZCBub3QgZmluZCBhbnkgZG9jdW1lbnRhdGlv
biBhYm91dCB0aGlzICJHUElPIHNoYXJpbmciIGJlaW5nDQphbGxvd2VkIG9yIG5vdC4NCg0KPiBU
aGUgZXhpc3RpbmcgRFQgZGVzY3JpcHRpb24gaXMgcmVhc29uYWJsZSwgYW5kIGludHJvZHVjaW5n
IGZpY3RpY2lvdXMNCj4gcmVndWxhdG9ycyBpbiBEVCB0byB3b3JrIGFyb3VuZCB0aGUgaW1wbGVt
ZW50YXRpb24gaXMgbm90IHJlYXNvbmFibGUuDQoNCkkgZG9uJ3QgdGhpbmsgaXQgaXMgdGhhdCBm
aWN0aXRpb3VzIGFzIGl0IG1ha2VzIGl0IGNyeXN0YWwgY2xlYXIgdGhhdA0KdGhlcmUgaXMgc29t
ZXRoaW5nIHNoYXJlZCB3aXRoIGFsbCBpdHMgcHJvcyBhbmQgY29ucy4gRS5nLiB3aGF0IGhhcHBl
bnMNCmlmIG9uZSBvZiB0aGVtIHJlZ3VsYXRvcnMgd2FudHMgdG8gdHVybiBvZmYgd2hpbGUgdGhl
IG90aGVyIG9uZSBzdGlsbA0KbmVlZHMgcG93ZXI/IFRoZSByZWd1bGFyIHJlZ3VsYXRvciBkZXBl
bmRlbmN5IHRyZWUgd291bGQgbmljZWx5IG1ha2UNCnRoaXMgYWxsIGNsZWFyLg==
