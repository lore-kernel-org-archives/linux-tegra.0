From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Tue, 23 Jul 2019 10:07:51 +0000
Message-ID: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
 <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
 <BN8PR12MB326661846D53AAEE315A7434D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <11557fe0-0cba-cb49-0fb6-ad24792d4a53@nvidia.com>
 <BN8PR12MB3266664ECA192E02C06061EED3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <BYAPR12MB3269A725AFDDA21E92946558D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <ab14f31f-2045-b1be-d31f-2a81b8527dac@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ab14f31f-2045-b1be-d31f-2a81b8527dac@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMjMvMjAx
OSwgMTE6MDE6MjQgKFVUQyswMDowMCkNCg0KPiBUaGlzIGFwcGVhcnMgdG8gYmUgYSB3aW5uZXIg
YW5kIGJ5IGRpc2FibGluZyB0aGUgU01NVSBmb3IgdGhlIGV0aGVybmV0DQo+IGNvbnRyb2xsZXIg
YW5kIHJldmVydGluZyBjb21taXQgOTU0YTAzYmUwMzNjN2NlZjgwZGRjMjMyZTdjYmRiMTdkZjcz
NTY2Mw0KPiB0aGlzIHdvcmtlZCEgU28geWVzIGFwcGVhcnMgdG8gYmUgcmVsYXRlZCB0byB0aGUg
U01NVSBiZWluZyBlbmFibGVkLiBXZQ0KPiBoYWQgdG8gZW5hYmxlIHRoZSBTTU1VIGZvciBldGhl
cm5ldCByZWNlbnRseSBkdWUgdG8gY29tbWl0DQo+IDk1NGEwM2JlMDMzYzdjZWY4MGRkYzIzMmU3
Y2JkYjE3ZGY3MzU2NjMuDQoNCkZpbmFsbHkgOikNCg0KSG93ZXZlciwgZnJvbSAiZ2l0IHNob3cg
OTU0YTAzYmUwMzNjN2NlZjgwZGRjMjMyZTdjYmRiMTdkZjczNTY2MyI6DQoNCisgICAgICAgICBU
aGVyZSBhcmUgZmV3IHJlYXNvbnMgdG8gYWxsb3cgdW5tYXRjaGVkIHN0cmVhbSBieXBhc3MsIGFu
ZA0KKyAgICAgICAgIGV2ZW4gZmV3ZXIgZ29vZCBvbmVzLiAgSWYgc2F5aW5nIFlFUyBoZXJlIGJy
ZWFrcyB5b3VyIGJvYXJkDQorICAgICAgICAgeW91IHNob3VsZCB3b3JrIG9uIGZpeGluZyB5b3Vy
IGJvYXJkLg0KDQpTbywgaG93IGNhbiB3ZSBmaXggdGhpcyA/IElzIHlvdXIgZXRoZXJuZXQgRFQg
bm9kZSBtYXJrZWQgYXMgDQoiZG1hLWNvaGVyZW50OyIgPw0KDQotLS0NClRoYW5rcywNCkpvc2Ug
TWlndWVsIEFicmV1DQo=
