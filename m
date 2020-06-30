From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 17:16:09 +0000
Message-ID: <BYAPR12MB2822B43B0218F6E55C97451BB36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <e6da9661-4e62-6e34-ac21-63ff993ca8bc@nvidia.com>
 <BYAPR12MB282210677459B8D62623C642B36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <4037efc7-fbed-e8cf-dac7-212c65014e4e@nvidia.com>
 <eb0ffc7e-f41b-d17c-6a90-049335098cd2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eb0ffc7e-f41b-d17c-6a90-049335098cd2@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>, Bryan Huntsman <bhuntsman@nvidia.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail>
List-Id: linux-tegra@vger.kernel.org

Pk9LLCB3ZWxsIEkgc2VlIHdoYXQgeW91IGFyZSBzYXlpbmcsIGJ1dCBpZiB3ZSBpbnRlbmRlZCB0
byBzdXBwb3J0IGFsbCAzIGZvciBUZWdyYTE5NCwgdGhlbiB3ZSBzaG91bGQgZW5zdXJlIGFsbCAz
IGFyZSBpbml0aWFsaXNlZCBjb3JyZWN0bHkuDQoNClRoZSBkcml2ZXIgaW50ZW5kIHRvIHN1cHBv
cnQgdXAgdG8gMyBpbnN0YW5jZXMuIEl0IGRvZXNuJ3QgcmVhbGx5IG1hbmRhdGUgdGhhdCBhbGwg
dGhyZWUgaW5zdGFuY2VzIGJlIHByZXNlbnQgaW4gc2FtZSBEVCBub2RlLg0KRWFjaCBtbWlvIGFw
ZXJ0dXJlIGluICJyZWciIHByb3BlcnR5IGlzIGFuIGluc3RhbmNlIGhlcmUuIHJlZyA9IDxpbnN0
MF9iYXNlLCBzaXplPiwgPGluc3QxX2Jhc2UsIHNpemU+LCA8aW5zdDJfYmFzZSwgc2l6ZT47DQpU
aGUgcmVnIGNhbiBoYXZlIGFsbCB0aHJlZSBvciBsZXNzIGFuZCBkcml2ZXIganVzdCBjb25maWd1
cmVzIGJhc2VkIG9uIHJlZyBhbmQgaXQgd29ya3MgZmluZS4NCg0KPkl0IHdvdWxkIGJlIGJldHRl
ciB0byBxdWVyeSB0aGUgbnVtYmVyIG9mIFNNTVVzIHBvcHVsYXRlZCBpbiBkZXZpY2UtdHJlZSBh
bmQgdGhlbiBlbnN1cmUgdGhhdCBhbGwgYXJlIGluaXRpYWxpc2VkIGNvcnJlY3RseS4NCg0KR2V0
dGluZyB0aGUgSU9SRVNPVVJDRV9NRU0gaXMgdGhlIHdheSB0byBjb3VudCB0aGUgaW5zdGFuY2Vz
IGRyaXZlciBuZWVkIHRvIHN1cHBvcnQuICANCkluIGEgd2F5LCBJdCBpcyBhbHJlYWR5IHF1ZXJ5
aW5nIHRocm91Z2ggSU9SRVNPVVJDRV9NRU0gaGVyZS4gDQoNCg0KLUtSDQoNCg==
