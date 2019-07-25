From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Thu, 25 Jul 2019 15:12:44 +0000
Message-ID: <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <7a79be5d-7ba2-c457-36d3-1ccef6572181@nvidia.com>
 <BYAPR12MB3269927AB1F67D46E150ED6BD3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Robin Murphy <robin.murphy@arm.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMjUvMjAx
OSwgMTU6MjU6NTkgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMjUvMDcvMjAxOSAxNDoyNiwgSm9z
ZSBBYnJldSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gPiBXZWxsLCBJIHdhc24ndCBleHBlY3Rp
bmcgdGhhdCA6Lw0KPiA+IA0KPiA+IFBlciBkb2N1bWVudGF0aW9uIG9mIGJhcnJpZXJzIEkgdGhp
bmsgd2Ugc2hvdWxkIHNldCBkZXNjcmlwdG9yIGZpZWxkcyANCj4gPiBhbmQgdGhlbiBiYXJyaWVy
IGFuZCBmaW5hbGx5IG93bmVyc2hpcCB0byBIVyBzbyB0aGF0IHJlbWFpbmluZyBmaWVsZHMgDQo+
ID4gYXJlIGNvaGVyZW50IGJlZm9yZSBvd25lciBpcyBzZXQuDQo+ID4gDQo+ID4gQW55d2F5LCBj
YW4geW91IGFsc28gYWRkIGEgZG1hX3JtYigpIGFmdGVyIHRoZSBjYWxsIHRvIA0KPiA+IHN0bW1h
Y19yeF9zdGF0dXMoKSA/DQo+IA0KPiBZZXMuIEkgcmVtb3ZlZCB0aGUgZGVidWcgcHJpbnQgYWRk
ZWQgdGhlIGJhcnJpZXIsIGJ1dCB0aGF0IGRpZCBub3QgaGVscC4NCg0KU28sIEkgd2FzIGZpbmFs
bHkgYWJsZSB0byBzZXR1cCBORlMgdXNpbmcgeW91ciByZXBsaWNhdGVkIHNldHVwIGFuZCBJIA0K
Y2FuJ3Qgc2VlIHRoZSBpc3N1ZSA6KA0KDQpUaGUgb25seSBkaWZmZXJlbmNlIEkgaGF2ZSBmcm9t
IHlvdXJzIGlzIHRoYXQgSSdtIHVzaW5nIFRDUCBpbiBORlMgDQp3aGlsc3QgeW91IChJIGJlbGll
dmUgZnJvbSB0aGUgbG9ncyksIHVzZSBVRFAuDQoNCllvdSBkbyBoYXZlIGZsb3cgY29udHJvbCBh
Y3RpdmUgcmlnaHQgPyBBbmQgeW91ciBIVyBGSUZPIHNpemUgaXMgPj0gNGsgPw0KDQotLS0NClRo
YW5rcywNCkpvc2UgTWlndWVsIEFicmV1DQo=
