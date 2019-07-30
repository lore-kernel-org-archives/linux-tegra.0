From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Tue, 30 Jul 2019 13:58:18 +0000
Message-ID: <BN8PR12MB32664C177C9356CE8C15FC65D3DC0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <7a79be5d-7ba2-c457-36d3-1ccef6572181@nvidia.com>
 <BYAPR12MB3269927AB1F67D46E150ED6BD3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
 <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <1e2ea942-28fe-15b9-f675-8d6585f9a33f@nvidia.com>
 <BYAPR12MB326922CDCB1D4B3D4A780CFDD3C30@BYAPR12MB3269.namprd12.prod.outlook.com>
 <MN2PR12MB327907D4A6FB378AC989571AD3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
 <b99b1e49-0cbc-2c66-6325-50fa6f263d91@nvidia.com>
 <MN2PR12MB327997BDF2EA5CEE00F45AC3D3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
 <fcf648d2-70cc-d734-871a-ca7f745791b7@arm.com>
 <MN2PR12MB3279ABF628C52883021123C5D3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
 <8a60361f-b914-93ef-0d80-92ae4ad8b808@nvidia.com>
 <BN8PR12MB32664E23137805984F6FB2DAD3DC0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <8cb2ac13-3009-2117-d55f-6f1126b690e4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8cb2ac13-3009-2117-d55f-6f1126b690e4@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Robin Murphy <robin.murphy@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMzAvMjAx
OSwgMTQ6MzY6MzkgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMzAvMDcvMjAxOSAxMDozOSwgSm9z
ZSBBYnJldSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gPiBJIGxvb2tlZCBhdCBuZXRzZWMgaW1w
bGVtZW50YXRpb24gYW5kIEkgbm90aWNlZCB0aGF0IHdlIGFyZSBzeW5jaW5nIHRoZSANCj4gPiBv
bGQgYnVmZmVyIGZvciBkZXZpY2UgaW5zdGVhZCBvZiB0aGUgbmV3IG9uZS4gbmV0c2VjIHN5bmNz
IHRoZSBidWZmZXIgDQo+ID4gZm9yIGRldmljZSBpbW1lZGlhdGVseSBhZnRlciB0aGUgYWxsb2Nh
dGlvbiB3aGljaCBtYXkgYmUgd2hhdCB3ZSBoYXZlIHRvIA0KPiA+IGRvLiBNYXliZSB0aGUgYXR0
YWNoZWQgcGF0Y2ggY2FuIG1ha2UgdGhpbmdzIHdvcmsgZm9yIHlvdSA/DQo+IA0KPiBHcmVhdCEg
VGhpcyBvbmUgd29ya3MuIEkgaGF2ZSBib290ZWQgdGhpcyBzZXZlcmFsIHRpbWVzIGFuZCBJIGFt
IG5vDQo+IGxvbmdlciBzZWVpbmcgYW55IGlzc3Vlcy4gVGhhbmtzIGZvciBmaWd1cmluZyB0aGlz
IG91dCENCj4gDQo+IEZlZWwgZnJlZSB0byBhZGQgbXkgLi4uDQo+IA0KPiBUZXN0ZWQtYnk6IEpv
biBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPg0KDQpUaGlzIG9uZSB3YXMgaGFyZCB0byBm
aW5kIDopIFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSBpbiB0ZXN0aW5nIA0KdGhpcyENCg0K
LS0tDQpUaGFua3MsDQpKb3NlIE1pZ3VlbCBBYnJldQ0K
