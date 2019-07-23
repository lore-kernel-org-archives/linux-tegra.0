From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Tue, 23 Jul 2019 10:49:49 +0000
Message-ID: <BYAPR12MB3269D050556BD51030DCDDFCD3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
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
 <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <2ad7bf21-1f1f-db0f-2358-4901b7988b7d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <2ad7bf21-1f1f-db0f-2358-4901b7988b7d@nvidia.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMjMvMjAx
OSwgMTE6Mzg6MzMgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMjMvMDcvMjAxOSAxMTowNywgSm9z
ZSBBYnJldSB3cm90ZToNCj4gPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4NCj4gPiBEYXRlOiBKdWwvMjMvMjAxOSwgMTE6MDE6MjQgKFVUQyswMDowMCkNCj4gPiANCj4g
Pj4gVGhpcyBhcHBlYXJzIHRvIGJlIGEgd2lubmVyIGFuZCBieSBkaXNhYmxpbmcgdGhlIFNNTVUg
Zm9yIHRoZSBldGhlcm5ldA0KPiA+PiBjb250cm9sbGVyIGFuZCByZXZlcnRpbmcgY29tbWl0IDk1
NGEwM2JlMDMzYzdjZWY4MGRkYzIzMmU3Y2JkYjE3ZGY3MzU2NjMNCj4gPj4gdGhpcyB3b3JrZWQh
IFNvIHllcyBhcHBlYXJzIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIFNNTVUgYmVpbmcgZW5hYmxlZC4g
V2UNCj4gPj4gaGFkIHRvIGVuYWJsZSB0aGUgU01NVSBmb3IgZXRoZXJuZXQgcmVjZW50bHkgZHVl
IHRvIGNvbW1pdA0KPiA+PiA5NTRhMDNiZTAzM2M3Y2VmODBkZGMyMzJlN2NiZGIxN2RmNzM1NjYz
Lg0KPiA+IA0KPiA+IEZpbmFsbHkgOikNCj4gPiANCj4gPiBIb3dldmVyLCBmcm9tICJnaXQgc2hv
dyA5NTRhMDNiZTAzM2M3Y2VmODBkZGMyMzJlN2NiZGIxN2RmNzM1NjYzIjoNCj4gPiANCj4gPiAr
ICAgICAgICAgVGhlcmUgYXJlIGZldyByZWFzb25zIHRvIGFsbG93IHVubWF0Y2hlZCBzdHJlYW0g
YnlwYXNzLCBhbmQNCj4gPiArICAgICAgICAgZXZlbiBmZXdlciBnb29kIG9uZXMuICBJZiBzYXlp
bmcgWUVTIGhlcmUgYnJlYWtzIHlvdXIgYm9hcmQNCj4gPiArICAgICAgICAgeW91IHNob3VsZCB3
b3JrIG9uIGZpeGluZyB5b3VyIGJvYXJkLg0KPiA+IA0KPiA+IFNvLCBob3cgY2FuIHdlIGZpeCB0
aGlzID8gSXMgeW91ciBldGhlcm5ldCBEVCBub2RlIG1hcmtlZCBhcyANCj4gPiAiZG1hLWNvaGVy
ZW50OyIgPw0KPiANCj4gVEJIIEkgaGF2ZSBubyBpZGVhLiBJIGNhbid0IHNheSBJIGZ1bGx5IHVu
ZGVyc3RhbmQgeW91ciBjaGFuZ2Ugb3IgaG93IGl0DQo+IGlzIGJyZWFraW5nIHRoaW5ncyBmb3Ig
dXMuDQo+IA0KPiBDdXJyZW50bHksIHRoZSBUZWdyYSBEVCBiaW5kaW5nIGRvZXMgbm90IGhhdmUg
J2RtYS1jb2hlcmVudCcgc2V0LiBJIHNlZQ0KPiB0aGlzIGlzIG9wdGlvbmFsLCBidXQgSSBhbSBu
b3Qgc3VyZSBob3cgeW91IGRldGVybWluZSB3aGV0aGVyIG9yIG5vdA0KPiB0aGlzIHNob3VsZCBi
ZSBzZXQuDQoNCkZyb20gbXkgdW5kZXJzdGFuZGluZyBpdCBtZWFucyB0aGF0IHlvdXIgZGV2aWNl
IC8gSVAgRE1BIGFjY2Vzc2VzIGFyZSBjb2hlcmVudCByZWdhcmRpbmcgdGhlIENQVSBwb2ludCBv
ZiB2aWV3LiBJIHRoaW5rIGl0IHdpbGwgYmUgdGhlIGNhc2UgaWYgR01BQyBpcyBub3QgYmVoaW5k
IGFueSBraW5kIG9mIElPTU1VIGluIHRoZSBIVyBhcmNoLg0KDQpJIGRvbid0IGtub3cgYWJvdXQg
dGhpcyBTTU1VIGJ1dCB0aGUgc291cmNlIGRvZXMgaGF2ZSBzb21lIHNwZWNpYWwgDQpjb25kaXRp
b25zIHdoZW4gZGV2aWNlIGlzIGRtYS1jb2hlcmVudC4NCg0KLS0tDQpUaGFua3MsDQpKb3NlIE1p
Z3VlbCBBYnJldQ0K
