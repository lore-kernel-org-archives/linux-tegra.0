From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Tue, 23 Jul 2019 12:51:13 +0000
Message-ID: <BYAPR12MB3269EC45ABAF8F279288B003D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
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
 <BYAPR12MB3269D050556BD51030DCDDFCD3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <8093e352-d992-e17f-7168-5afbd9d3fb3f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8093e352-d992-e17f-7168-5afbd9d3fb3f@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMjMvMjAx
OSwgMTI6NTg6NTUgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMjMvMDcvMjAxOSAxMTo0OSwgSm9z
ZSBBYnJldSB3cm90ZToNCj4gPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4NCj4gPiBEYXRlOiBKdWwvMjMvMjAxOSwgMTE6Mzg6MzMgKFVUQyswMDowMCkNCj4gPiANCj4g
Pj4NCj4gPj4gT24gMjMvMDcvMjAxOSAxMTowNywgSm9zZSBBYnJldSB3cm90ZToNCj4gPj4+IEZy
b206IEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPg0KPiA+Pj4gRGF0ZTogSnVsLzIz
LzIwMTksIDExOjAxOjI0IChVVEMrMDA6MDApDQo+ID4+Pg0KPiA+Pj4+IFRoaXMgYXBwZWFycyB0
byBiZSBhIHdpbm5lciBhbmQgYnkgZGlzYWJsaW5nIHRoZSBTTU1VIGZvciB0aGUgZXRoZXJuZXQN
Cj4gPj4+PiBjb250cm9sbGVyIGFuZCByZXZlcnRpbmcgY29tbWl0IDk1NGEwM2JlMDMzYzdjZWY4
MGRkYzIzMmU3Y2JkYjE3ZGY3MzU2NjMNCj4gPj4+PiB0aGlzIHdvcmtlZCEgU28geWVzIGFwcGVh
cnMgdG8gYmUgcmVsYXRlZCB0byB0aGUgU01NVSBiZWluZyBlbmFibGVkLiBXZQ0KPiA+Pj4+IGhh
ZCB0byBlbmFibGUgdGhlIFNNTVUgZm9yIGV0aGVybmV0IHJlY2VudGx5IGR1ZSB0byBjb21taXQN
Cj4gPj4+PiA5NTRhMDNiZTAzM2M3Y2VmODBkZGMyMzJlN2NiZGIxN2RmNzM1NjYzLg0KPiA+Pj4N
Cj4gPj4+IEZpbmFsbHkgOikNCj4gPj4+DQo+ID4+PiBIb3dldmVyLCBmcm9tICJnaXQgc2hvdyA5
NTRhMDNiZTAzM2M3Y2VmODBkZGMyMzJlN2NiZGIxN2RmNzM1NjYzIjoNCj4gPj4+DQo+ID4+PiAr
ICAgICAgICAgVGhlcmUgYXJlIGZldyByZWFzb25zIHRvIGFsbG93IHVubWF0Y2hlZCBzdHJlYW0g
YnlwYXNzLCBhbmQNCj4gPj4+ICsgICAgICAgICBldmVuIGZld2VyIGdvb2Qgb25lcy4gIElmIHNh
eWluZyBZRVMgaGVyZSBicmVha3MgeW91ciBib2FyZA0KPiA+Pj4gKyAgICAgICAgIHlvdSBzaG91
bGQgd29yayBvbiBmaXhpbmcgeW91ciBib2FyZC4NCj4gPj4+DQo+ID4+PiBTbywgaG93IGNhbiB3
ZSBmaXggdGhpcyA/IElzIHlvdXIgZXRoZXJuZXQgRFQgbm9kZSBtYXJrZWQgYXMgDQo+ID4+PiAi
ZG1hLWNvaGVyZW50OyIgPw0KPiA+Pg0KPiA+PiBUQkggSSBoYXZlIG5vIGlkZWEuIEkgY2FuJ3Qg
c2F5IEkgZnVsbHkgdW5kZXJzdGFuZCB5b3VyIGNoYW5nZSBvciBob3cgaXQNCj4gPj4gaXMgYnJl
YWtpbmcgdGhpbmdzIGZvciB1cy4NCj4gPj4NCj4gPj4gQ3VycmVudGx5LCB0aGUgVGVncmEgRFQg
YmluZGluZyBkb2VzIG5vdCBoYXZlICdkbWEtY29oZXJlbnQnIHNldC4gSSBzZWUNCj4gPj4gdGhp
cyBpcyBvcHRpb25hbCwgYnV0IEkgYW0gbm90IHN1cmUgaG93IHlvdSBkZXRlcm1pbmUgd2hldGhl
ciBvciBub3QNCj4gPj4gdGhpcyBzaG91bGQgYmUgc2V0Lg0KPiA+IA0KPiA+IEZyb20gbXkgdW5k
ZXJzdGFuZGluZyBpdCBtZWFucyB0aGF0IHlvdXIgZGV2aWNlIC8gSVAgRE1BIGFjY2Vzc2VzIGFy
ZSBjb2hlcmVudCByZWdhcmRpbmcgdGhlIENQVSBwb2ludCBvZiB2aWV3LiBJIHRoaW5rIGl0IHdp
bGwgYmUgdGhlIGNhc2UgaWYgR01BQyBpcyBub3QgYmVoaW5kIGFueSBraW5kIG9mIElPTU1VIGlu
IHRoZSBIVyBhcmNoLg0KPiANCj4gSSB1bmRlcnN0YW5kIHdoYXQgY29oZXJlbmN5IGlzLCBJIGp1
c3QgZG9uJ3Qga25vdyBob3cgeW91IHRlbGwgaWYgdGhpcw0KPiBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgZXRoZXJuZXQgY29udHJvbGxlciBpcyBjb2hlcmVudCBvciBub3QuDQoNCkRvIHlvdSBoYXZl
IGFueSBkZXRhaWxlZCBkaWFncmFtIG9mIHlvdXIgSFcgPyBTdWNoIGFzIGJsb2NrcyAvIElQcyAN
CmNvbm5lY3Rpb24sIGFkZHJlc3Mgc3BhY2Ugd2lyaW5nICwgLi4uDQoNCi0tLQ0KVGhhbmtzLA0K
Sm9zZSBNaWd1ZWwgQWJyZXUNCg==
