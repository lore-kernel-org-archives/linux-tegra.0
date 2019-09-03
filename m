From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH 1/7] iommu/arm-smmu: add Nvidia SMMUv2 implementation
Date: Tue, 3 Sep 2019 01:07:46 +0000
Message-ID: <BYAPR12MB2710D40B168C7029758C5481B3B90@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-2-git-send-email-vdumpa@nvidia.com>
 <2ae9e0c4-6916-b005-f4bd-29e06d2056c6@arm.com>
 <BYAPR12MB2710D045303BE89A7D3FF2C1B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
 <3f2cbbe2-f6d7-07e3-3fef-18af518dedef@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3f2cbbe2-f6d7-07e3-3fef-18af518dedef@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sachin Nikam <Snikam@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timo Alho <talho@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8bytes.org>
List-Id: linux-tegra@vger.kernel.org

Pj4+ICtBUk1fU01NVV9NQVRDSF9EQVRBKG52aWRpYV9zbW11djIsIEFSTV9TTU1VX1YyLCBOVklE
SUFfU01NVVYyKTsNCiANCj4+IFRoZSBBUk0gTU1VLTUwMCBpbXBsZW1lbnRhdGlvbiBpcyB1bm1v
ZGlmaWVkLiAgSXQgaXMgdGhlIHdheSB0aGUgYXJlIGludGVncmF0ZWQgYW5kIHVzZWQgdG9nZXRo
ZXIoZm9yIGludGVybGVhdmVkIGFjY2Vzc2VzKSBpcyBkaWZmZXJlbnQgZnJvbSByZWd1bGFyIEFS
TSBNTVUtNTAwLg0KPj4gSSBoYXZlIGFkZGVkIGl0IHRvIGdldCB0aGUgbW9kZWwgbnVtYmVyIGFu
ZCB0byBiZSBhYmxlIGRpZmZlcmVudGlhdGUgdGhlIFNNTVUgaW1wbGVtZW50YXRpb24gaW4gYXJt
LXNtbXUtaW1wbC5jLg0KDQo+SW4gdGhhdCBjYXNlLCBJIHdvdWxkIHJhdGhlciBrZWVwIHNtbXUt
Pm1vZGVsIHJlcHJlc2VudGluZyB0aGUgTU1VLTUwMCBtaWNyb2FyY2hpdGVjdHVyZSAtIA0KPnNp
bmNlIHlvdSdsbCBzdGlsbCB3YW50IHRvIHBpY2sgdXAgZXJyYXRhIHdvcmthcm91bmRzIGV0Yy4g
Zm9yIHRoYXQgLSBhbmQgZGV0ZWN0IHRoZSBUZWdyYSBpbnRlZ3JhdGlvbiB2aWEgYW4gZXhwbGlj
aXQgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoKQ0KPiBjaGVjayBpbiBhcm1fc21tdV9pbXBsX2lu
aXQoKS4NCg0KTG9va3MgZ29vZCB0byBtZS4gDQoNCj5Gb3IgY29tcGFyaXNvbiwgdW5kZXIgQUNQ
SSB3ZSdkIHByb2JhYmx5IGhhdmUgdG8gZGV0ZWN0IGludGVncmF0aW9uIGRldGFpbHMgYnkgbG9v
a2luZyBhdCB0YWJsZSBoZWFkZXJzLCBzZXBhcmF0ZWx5DQo+IGZyb20gdGhlIElPUlQgIk1vZGVs
IiBmaWVsZCwgc28gSSdkIHByZWZlciBpZiB0aGUgRFQgdnMuIEFDUEkgaGFuZGxpbmcgZGlkbid0
IGRpdmVyZ2UgbW9yZSB0aGFuIG5lY2Vzc2FyeS4NCg0KQUNQSSBzdXBwb3J0IGZvciBUMTk0IGNh
biBiZSBhZGRlZCBiYXNlZCBvbiBuZWVkIGluIHN1YnNlcXVlbnQgcGF0Y2hlcy4gRm9yIG5vdywg
SSBhbSB1cGRhdGluZyBpdCBmb3IgRFQgc3VwcG9ydC4NCg0KLUtSDQo=
