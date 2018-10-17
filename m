From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v2 9/9] ASoC: tegra_sgtl5000: fix platform name vs.
 of_node assignement
Date: Wed, 17 Oct 2018 21:33:00 +0000
Message-ID: <1539811978.6233.63.camel@toradex.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
         <20181016104730.4598-10-marcel@ziswiler.com>
         <35848cb7-36ee-6698-ff17-7f0e73567914@nvidia.com>
         <1539786500.6233.58.camel@toradex.com>
         <20181017191633.GL24097@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017191633.GL24097@sirena.org.uk>
Content-Language: en-US
Content-ID: <06250A4EB448944599C40A443B9B117D@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCAyMDE4LTEwLTE3IGF0IDIwOjE2ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIE9jdCAxNywgMjAxOCBhdCAwMjoyODoyMlBNICswMDAwLCBNYXJjZWwgWmlzd2lsZXIg
d3JvdGU6DQo+IA0KPiA+IFNvbWUgcXVlc3Rpb25zOg0KPiA+IC0gSG93IGV4YWN0bHkgYXJlIGRl
dm0gYWxsb2NhdGlvbnMgc3VwcG9zZWQgdG8gd29yayBjb25jZXJuaW5nDQo+ID4gcHJvYmUNCj4g
PiBkZWZlcnJhbHM/DQo+IA0KPiBQcm9iZSBkZWZlcnJhbHMgYXJlIGp1c3Qgbm9ybWFsIHByb2Jl
IGVycm9ycywgYW55IGRldm1fIGFsbG9jYXRlZA0KPiBzdHVmZg0KPiBnZXRzIHVud291bmQuDQoN
Ck9LLCB0aGF0IGlzIHdoZXJlIG15IHVuZGVyc3RhbmRpbmcgd2FzIHdlYXJ5LiBTbyB5b3UgYXJl
IHNheWluZw0KYW55dGhpbmcgc2hvdWxkIHJlYWxseSBnZXQgYWxsb2NhdGVkIGFnYWluIHVwb24g
dGhlIHNlY29uZCB0aW1lLg0KDQo+ID4gLSBEb2VzIG9yIHNob3VsZCB0aGUgcGxhdGZvcm0gZ2V0
IGNsZWFyZWQgZHVyaW5nIGEgcHJvYmUgZGVmZXJyYWwNCj4gPiBjeWNsZT8NCj4gPiAtIElmIHNv
LCB3aHkgZG9lcyB0aGF0IG5vdCB3b3JrPw0KPiANCj4gSXMgc29tZXRoaW5nIHdyaXRpbmcgdG8g
c3RhdGljIGRhdGEgd2hlbiBpdCBzaG91bGQgYmUgd3JpdGluZyB0bw0KPiBkeW5hbWljYWxseSBh
bGxvY2F0ZWQgZGF0YT8gIFRoYXQncyB3aGF0IHRoaXMgc291bmRzIGxpa2UsIHdlDQo+IHNob3Vs
ZG4ndA0KPiBiZSBtb2RpZnlpbmcgYW55IHN0YXRpYyBkYXRhIGFuZCBhbnkgZGF0YSBkeW5hbWlj
YWxseSBhbGxvY2F0ZWQNCj4gZHVyaW5nDQo+IHByb2JlIG91Z2h0IHRvIGJlIGJlaW5nIGRpc2Nh
cmRlZC4NCg0KT0ssIEkgYmVsaWV2ZSBJIHN0YXJ0IHRvIHNlZSB3aGF0IHlvdSBhcmUgc2F5aW5n
LiBJIGd1ZXNzIHRoZSBidWcgbGF5cw0KaW4gc29jLWNvcmUgdGhlbiBub3QgcHJvcGVybHkgZGlz
Y2FyZGluZyB0aGUgcGxhdGZvcm0gYW5kIHRoZSBzZWNvbmQNCnRpbWUgYXJvdW5kIGl0IGlzIHVz
aW5nIGEgc3RhbGUgcG9pbnRlciB0byB0aGF0IHdoaWNoIG5vdyBvZiBjb3Vyc2UNCnBvaW50cyB0
byB3aGF0ZXZlciBoYXBwZW5zIHRvIGJlIHRoZXJlISBMZXQgbWUgdHJ5IGEgZmV3IG1vcmUgdGhp
bmdzDQphbmQgSSB3aWxsIGNvb2sgdXAgYSBwcm9wZXIgcGF0Y2ggdG8gZml4IHRoYXQuLi4NCg0K
PiA+IC0gT3IgaXMgc29tZSBzcGVjaWFsIGltcGxpY2l0IHByb2JlIGRlZmVycmFsIGhhbmRsaW5n
IG1pc3NpbmcgaW4NCj4gPiBzb2MtDQo+ID4gY29yZT8NCj4gDQo+IExpa2UgSSBzYXkgYSBwcm9i
ZSBkZWZlcnJhbCBpcyBqdXN0IGEgbm9ybWFsIGVycm9yLg0KDQpZZWFoLCByaWdodC4gVGhhbmtz
IQ==
