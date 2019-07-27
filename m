From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Sat, 27 Jul 2019 15:56:36 +0000
Message-ID: <BYAPR12MB326922CDCB1D4B3D4A780CFDD3C30@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <7a79be5d-7ba2-c457-36d3-1ccef6572181@nvidia.com>
 <BYAPR12MB3269927AB1F67D46E150ED6BD3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
 <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <1e2ea942-28fe-15b9-f675-8d6585f9a33f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e2ea942-28fe-15b9-f675-8d6585f9a33f@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+DQpEYXRlOiBKdWwvMjYvMjAx
OSwgMTU6MTE6MDAgKFVUQyswMDowMCkNCg0KPiANCj4gT24gMjUvMDcvMjAxOSAxNjoxMiwgSm9z
ZSBBYnJldSB3cm90ZToNCj4gPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4NCj4gPiBEYXRlOiBKdWwvMjUvMjAxOSwgMTU6MjU6NTkgKFVUQyswMDowMCkNCj4gPiANCj4g
Pj4NCj4gPj4gT24gMjUvMDcvMjAxOSAxNDoyNiwgSm9zZSBBYnJldSB3cm90ZToNCj4gPj4NCj4g
Pj4gLi4uDQo+ID4+DQo+ID4+PiBXZWxsLCBJIHdhc24ndCBleHBlY3RpbmcgdGhhdCA6Lw0KPiA+
Pj4NCj4gPj4+IFBlciBkb2N1bWVudGF0aW9uIG9mIGJhcnJpZXJzIEkgdGhpbmsgd2Ugc2hvdWxk
IHNldCBkZXNjcmlwdG9yIGZpZWxkcyANCj4gPj4+IGFuZCB0aGVuIGJhcnJpZXIgYW5kIGZpbmFs
bHkgb3duZXJzaGlwIHRvIEhXIHNvIHRoYXQgcmVtYWluaW5nIGZpZWxkcyANCj4gPj4+IGFyZSBj
b2hlcmVudCBiZWZvcmUgb3duZXIgaXMgc2V0Lg0KPiA+Pj4NCj4gPj4+IEFueXdheSwgY2FuIHlv
dSBhbHNvIGFkZCBhIGRtYV9ybWIoKSBhZnRlciB0aGUgY2FsbCB0byANCj4gPj4+IHN0bW1hY19y
eF9zdGF0dXMoKSA/DQo+ID4+DQo+ID4+IFllcy4gSSByZW1vdmVkIHRoZSBkZWJ1ZyBwcmludCBh
ZGRlZCB0aGUgYmFycmllciwgYnV0IHRoYXQgZGlkIG5vdCBoZWxwLg0KPiA+IA0KPiA+IFNvLCBJ
IHdhcyBmaW5hbGx5IGFibGUgdG8gc2V0dXAgTkZTIHVzaW5nIHlvdXIgcmVwbGljYXRlZCBzZXR1
cCBhbmQgSSANCj4gPiBjYW4ndCBzZWUgdGhlIGlzc3VlIDooDQo+ID4gDQo+ID4gVGhlIG9ubHkg
ZGlmZmVyZW5jZSBJIGhhdmUgZnJvbSB5b3VycyBpcyB0aGF0IEknbSB1c2luZyBUQ1AgaW4gTkZT
IA0KPiA+IHdoaWxzdCB5b3UgKEkgYmVsaWV2ZSBmcm9tIHRoZSBsb2dzKSwgdXNlIFVEUC4NCj4g
DQo+IFNvIEkgdHJpZWQgVENQIGJ5IHNldHRpbmcgdGhlIGtlcm5lbCBib290IHBhcmFtcyB0byAn
bmZzdmVycz0zJyBhbmQNCj4gJ3Byb3RvPXRjcCcgYW5kIHRoaXMgZG9lcyBhcHBlYXIgdG8gYmUg
bW9yZSBzdGFibGUsIGJ1dCBub3QgMTAwJSBzdGFibGUuDQo+IEl0IHN0aWxsIGFwcGVhcnMgdG8g
ZmFpbCBpbiB0aGUgc2FtZSBwbGFjZSBhYm91dCA1MCUgb2YgdGhlIHRpbWUuDQo+IA0KPiA+IFlv
dSBkbyBoYXZlIGZsb3cgY29udHJvbCBhY3RpdmUgcmlnaHQgPyBBbmQgeW91ciBIVyBGSUZPIHNp
emUgaXMgPj0gNGsgPw0KPiANCj4gSG93IGNhbiBJIHZlcmlmeSBpZiBmbG93IGNvbnRyb2wgaXMg
YWN0aXZlPw0KDQpZb3UgY2FuIGNoZWNrIGl0IGJ5IGR1bXBpbmcgcmVnaXN0ZXIgTVRMX1J4UV9P
cGVyYXRpb25fTW9kZSAoMHhkMzApLg0KDQpDYW4geW91IGFsc28gYWRkIElPTU1VIGRlYnVnIGlu
IGZpbGUgImRyaXZlcnMvaW9tbXUvaW9tbXUuYyIgPw0KDQotLS0NClRoYW5rcywNCkpvc2UgTWln
dWVsIEFicmV1DQo=
