From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Mon, 22 Jul 2019 07:23:08 +0000
Message-ID: <BN8PR12MB32665C1A106D3DCBF89CEA54D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <6a6bac84-1d29-2740-1636-d3adb26b6bcc@nvidia.com>
 <BN8PR12MB3266960A104A7CDBB4E59192D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <bc9ab3c5-b1b9-26d4-7b73-01474328eafa@nvidia.com>
 <BN8PR12MB3266989D15E017A789E14282D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <4db855e4-1d59-d30b-154c-e7a2aa1c9047@nvidia.com>
 <BN8PR12MB3266FD9CF18691EDEF05A4B8D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <64e37224-6661-ddb0-4394-83a16e1ccb61@nvidia.com>
 <BN8PR12MB3266E1FAC5B7874EFA69DD7BD3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <25512348-5b98-aeb7-a6fb-f90376e66a84@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <25512348-5b98-aeb7-a6fb-f90376e66a84@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMTkvMjAx
OSwgMTQ6MzU6NTIgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMTkvMDcvMjAxOSAxMzozMiwgSm9z
ZSBBYnJldSB3cm90ZToNCj4gPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4NCj4gPiBEYXRlOiBKdWwvMTkvMjAxOSwgMTM6MzA6MTAgKFVUQyswMDowMCkNCj4gPiANCj4g
Pj4gSSBib290ZWQgdGhlIGJvYXJkIHdpdGhvdXQgdXNpbmcgTkZTIGFuZCB0aGVuIHN0YXJ0ZWQg
dXNlZCBkaGNsaWVudCB0bw0KPiA+PiBicmluZyB1cCB0aGUgbmV0d29yayBpbnRlcmZhY2UgYW5k
IGl0IGFwcGVhcnMgdG8gYmUgd29ya2luZyBmaW5lLiBJIGNhbg0KPiA+PiBldmVuIG1vdW50IHRo
ZSBORlMgc2hhcmUgZmluZS4gU28gaXQgZG9lcyBhcHBlYXIgdG8gYmUgcGFydGljdWxhciB0bw0K
PiA+PiB1c2luZyBORlMgdG8gbW91bnQgdGhlIHJvb3Rmcy4NCj4gPiANCj4gPiBEYW1uLiBDYW4g
eW91IHNlbmQgbWUgeW91ciAuY29uZmlnID8NCj4gDQo+IFllcyBubyBwcm9ibGVtLiBBdHRhY2hl
ZC4NCg0KQ2FuIHlvdSBjb21waWxlIHlvdXIgaW1hZ2Ugd2l0aG91dCBtb2R1bGVzIChpLmUuIGFs
bCBidWlsdC1pbikgYW5kIGxldCANCm1lIGtub3cgaWYgdGhlIGVycm9yIHN0aWxsIGhhcHBlbnMg
Pw0KDQotLS0NClRoYW5rcywNCkpvc2UgTWlndWVsIEFicmV1DQo=
