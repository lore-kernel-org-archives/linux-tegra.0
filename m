From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH 3/7] iommu/arm-smmu: Add tlb_sync implementation hook
Date: Fri, 30 Aug 2019 22:49:21 +0000
Message-ID: <BYAPR12MB271010C629D8DD7AEC0123D4B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
 <554f8de1-1638-4eb9-59ae-8e1f0d786c44@arm.com>
 <BYAPR12MB2710AF5DDCB687C7E78362E5B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB2710AF5DDCB687C7E78362E5B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sachin Nikam <Snikam@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timo Alho <talho@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8bytes.org>
List-Id: linux-tegra@vger.kernel.org

Pj4gKwlpZiAoc21tdS0+aW1wbC0+dGxiX3N5bmMpIHsNCj4+ICsJCXNtbXUtPmltcGwtPnRsYl9z
eW5jKHNtbXUsIHBhZ2UsIHN5bmMsIHN0YXR1cyk7DQoNCj5XaGF0IEknZCBob3BlZCBpcyB0aGF0
IHJhdGhlciB0aGFuIG5lZWRpbmcgYSBob29rIGZvciB0aGlzLCB5b3UgY291bGQganVzdCBvdmVy
cmlkZSBzbW11X2RvbWFpbi0+dGxiX29wcyBmcm9tIC5pbml0X2NvbnRleHQgdG8gd2lyZSB1cCB0
aGUgYWx0ZXJuYXRlIC5zeW5jIG1ldGhvZCBkaXJlY3RseS4gVGhhdCB3b3VsZCBzYXZlIHRoaXMg
ZXh0cmEgbGV2ZWwgb2YgaW5kaXJlY3Rpb24uDQoNCkhpIFJvYmluLCAgb3ZlcnJpZGluZyB0bGJf
b3BzLT50bGJfc3luYyBmdW5jdGlvbiBpcyBub3QgZW5vdWdoIGhlcmUuDQpUaGVyZSBhcmUgZGly
ZWN0IHJlZmVyZW5jZXMgdG8gYXJtX3NtbXVfdGxiX3N5bmNfY29udGV4dCgpLCAgYXJtX3NtbXVf
dGxiX3N5bmNfZ2xvYmFsKCkgZnVuY3Rpb25zLg0KSW4gYXJtLXNtbXUuYy4gIHdlIGNhbiByZXBs
YWNlIHRoZXNlIGRpcmVjdCByZWZlcmVuY2VzIHdpdGggdGxiX29wcy0+dGxiX3N5bmMoKSBmdW5j
dGlvbiBleGNlcHQgaW4gb25lIGZ1bmN0aW9uIGFybV9zbW11X2RldmljZV9yZXNldCgpLiAgDQpX
aGVuIGFybV9zbW11X2RldmljZV9yZXNldCgpIGdldHMgY2FsbGVkLCBkb21haW5zIGFyZSBub3Qg
aW5pdGlhbGl6ZWQgYW5kIHRsYl9vcHMgaXMgbm90IGF2YWlsYWJsZS4gDQpTaG91bGQgd2UgYWRk
IGEgbmV3IGhvb2sgZm9yIGFybV9zbW11X3RsYl9zeW5jX2dsb2JhbCgpIG9yIG1ha2UgdGhpcyBh
cyBhIHJlc3BvbnNpYmlsaXR5IG9mIGltcGwtPnJlc2V0KCkgaG9vayBhcyBpdCBnZXRzDQpjYWxs
ZWQgYXQgdGhlIHNhbWUgcGxhY2U/DQoNCi1LUiANCg==
