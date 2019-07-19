From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Fri, 19 Jul 2019 08:44:23 +0000
Message-ID: <BN8PR12MB3266989D15E017A789E14282D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <6a6bac84-1d29-2740-1636-d3adb26b6bcc@nvidia.com>
 <BN8PR12MB3266960A104A7CDBB4E59192D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <bc9ab3c5-b1b9-26d4-7b73-01474328eafa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <bc9ab3c5-b1b9-26d4-7b73-01474328eafa@nvidia.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMTkvMjAx
OSwgMDk6Mzc6NDkgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMTkvMDcvMjAxOSAwODo1MSwgSm9z
ZSBBYnJldSB3cm90ZToNCj4gPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4NCj4gPiBEYXRlOiBKdWwvMTgvMjAxOSwgMTA6MTY6MjAgKFVUQyswMDowMCkNCj4gPiANCj4g
Pj4gSGF2ZSB5b3UgdHJpZWQgdXNpbmcgTkZTIG9uIGEgYm9hcmQgd2l0aCB0aGlzIGV0aGVybmV0
IGNvbnRyb2xsZXI/DQo+ID4gDQo+ID4gSSdtIGhhdmluZyBzb21lIGlzc3VlcyBzZXR0aW5nIHVw
IHRoZSBORlMgc2VydmVyIGluIG9yZGVyIHRvIHJlcGxpY2F0ZSANCj4gPiBzbyB0aGlzIG1heSB0
YWtlIHNvbWUgdGltZS4NCj4gDQo+IElmIHRoYXQncyB0aGUgY2FzZSwgd2UgbWF5IHdpc2ggdG8g
Y29uc2lkZXIgcmV2ZXJ0aW5nIHRoaXMgZm9yIG5vdyBhcyBpdA0KPiBpcyBwcmV2ZW50aW5nIG91
ciBib2FyZCBmcm9tIGJvb3RpbmcuIEFwcGVhcnMgdG8gcmV2ZXJ0IGNsZWFubHkgb24gdG9wDQo+
IG9mIG1haW5saW5lLg0KPiANCj4gPiBBcmUgeW91IGFibGUgdG8gYWRkIHNvbWUgZGVidWcgaW4g
c3RtbWFjX2luaXRfcnhfYnVmZmVycygpIHRvIHNlZSB3aGF0J3MgDQo+ID4gdGhlIGJ1ZmZlciBh
ZGRyZXNzID8NCj4gDQo+IElmIHlvdSBoYXZlIGEgZGVidWcgcGF0Y2ggeW91IHdvdWxkIGxpa2Ug
bWUgdG8gYXBwbHkgYW5kIHRlc3Qgd2l0aCBJDQo+IGNhbi4gSG93ZXZlciwgaXQgaXMgYmVzdCB5
b3UgcHJlcGFyZSB0aGUgcGF0Y2ggYXMgbWF5YmUgSSB3aWxsIG5vdCBkdW1wDQo+IHRoZSBhcHBy
b3ByaWF0ZSBhZGRyZXNzZXMuDQo+IA0KPiBDaGVlcnMNCj4gSm9uDQo+IA0KPiAtLSANCj4gbnZw
dWJsaWMNCg0KU2VuZCBtZSBmdWxsIGJvb3QgbG9nIHBsZWFzZS4NCg0KLS0tDQpUaGFua3MsDQpK
b3NlIE1pZ3VlbCBBYnJldQ0K
