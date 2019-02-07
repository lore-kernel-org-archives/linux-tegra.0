From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 16:08:36 +0000
Message-ID: <BYAPR12MB3398D9CA36FCFF81BBC8E7B5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <32b0b694-f912-044e-1a50-55b9c355d0c3@gmail.com>
 <BYAPR12MB3398350797241F90AE347FB5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
 <0a7d62c4-9dcd-08dd-4e3f-877184848daa@gmail.com>
 <20190207160630.GB17445@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207160630.GB17445@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+ID4gPj4gSXQgYmVjYW1lIGFwcGFyZW50IHRvIG1lIHRoYXQgdGhlcmUgaXMgYSBwcm9ibGVt
IGhlcmUuIFRoZSBzaXplIG9mIGRtYV9idWYgaXMgNDA5NiBieXRlcyBhbmQgbWF4aW11bSBtZXNz
YWdlIGxlbmd0aCBpcyA0MDk2IHRvbywgd2UgaGF2ZSBwdXNoZWQgMTIgYnl0ZXMgcGFja2V0X2hl
YWRlciB0byB0aGUgYnVmZmVyID5hbmQgbm93IHRoZXJlIGFyZSA0MDg0IGJ5dGVzIGxlZnQgZm9y
IHRoZSBtZXNzYWdlIGluIHRoZSBidWZmZXIuIEhlbmNlIHRyYW5zZmVyIG9mIDRLQiB3aWxsIGNh
dXNlIGJ1ZmZlciBvdmVyZmxvdyBhbmQgZWl0aGVyIGNyYXNoIGtlcm5lbCBvciBjb3JydXB0IG1l
bW9yeS4gT25lIHNvbHV0aW9uIGlzIHRvIGp1c3QgYWx3YXlzID5wdXNoIHBhY2tldF9oZWFkZXIg
dXNpbmcgUElPLCBvdGhlciB0byByZWR1Y2UgbWF4X3dyaXRlX2xlbiBvciBpbmNyZWFzZSBkbWFf
YnVmIHNpemUuDQo+ID4gPiANCj4gPiA+IFllcywgVGhpcyBpcyBrbm93biB0byBtZSBhbmQgSSB3
aWxsIGFkZCBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhpcyB0byANCj4gPiA+IHVwZGF0ZSBxdWlya3Mg
dG8gdGFrZSBjYXJlIGZvciB0MTg2IGFuZCB0MTk0IHRvIGV4Y2x1ZGUgcGFja2V0IGhkciBsZW5n
dGhzIFRoZXJlIHdhcyBzZXBhcmF0ZSBwYXRjaCB3aGVuIHF1aXJrcyB3ZXJlIGFkZGVkIGFuZCBp
dCBnb3QgbWVyZ2VkIGFscmVhZHkgZnJvbSA1LjAtcmMxIGJ1dCBkb27igJl0IHdhbnQgdG8gc25l
YWsgdGhhdCBoZXJlLiBXaWxsIHNlbmQgc2VwYXJhdGUgcGF0Y2ggdG8gdGFrZSBjYXJlIG9mIHRo
aXMuDQo+ID4gPiBOZWVkIHRvIHVwZGF0ZSBxdWlyayB0byBleGNsdWRlIHBhY2tldCBoZWFkZXIN
Cj4gPiA+IA0KPiA+IA0KPiA+IE5vLiBUaGlzIGlzIGEgYnVnIG9mIHRoaXMgcGF0Y2gsIGl0IG11
c3QgYmUgZml4ZWQgaW4gdGhpcyBwYXRjaCBhcyB3ZWxsLiANCj4gPiANCj4NCj4NCj4gSSdtIG5v
dCBzdXJlIHdlIGFjdHVhbGx5IG5lZWQgdGhpcy4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0
J3MgcmVhbGx5IHRoZSBwYXlsb2FkIHNpemUgdGhhdCdzIDQgS2lCIGFuZCA2NCBLaUIsIHJlc3Bl
Y3RpdmVseS4gSSBkb24ndCB0aGluayB0aGF0IGluY2x1ZGVzIHRoZSBoZWFkZXIuDQo+DQo+IFRo
aWVycnkNCg0KQXMgcGVyIHRoZSBkZXNpZ24sIFllcyB0aGF04oCZcyBpbmNsdWRpbmcgdGhlIEhF
QURFUi4gSXRzIHRvdGFsIHRyYW5zZmVyIHBlciBwYWNrZXQgaW5jbHVkaW5nIGhlYWRlci4NCg==
