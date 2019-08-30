From: Krishna Reddy <vdumpa@nvidia.com>
Subject: RE: [PATCH 3/7] iommu/arm-smmu: Add tlb_sync implementation hook
Date: Fri, 30 Aug 2019 18:05:19 +0000
Message-ID: <BYAPR12MB2710AF5DDCB687C7E78362E5B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-4-git-send-email-vdumpa@nvidia.com>
 <554f8de1-1638-4eb9-59ae-8e1f0d786c44@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554f8de1-1638-4eb9-59ae-8e1f0d786c44@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sachin Nikam <Snikam@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timo Alho <talho@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8bytes.org>
List-Id: linux-tegra@vger.kernel.org

Pj4gKwlmb3IgKGkgPSAwOyBpIDwgdG9fbnNtbXUoc21tdSktPm51bV9pbnN0OyBpKyspDQoNCj5J
dCBtaWdodCBtYWtlIG1vcmUgc2Vuc2UgdG8gbWFrZSB0aGlzIHRoZSBpbm5lcm1vc3QgbG9vcCwg
aS5lLjoNCglmb3IgKGkgPSAwOyBpIDwgbnNtbXUtPm51bV9pbnN0OyBpKyspDQoJCXJlZyAmPSBy
ZWFkbF9yZWxheGVkKG5zbW11X3BhZ2Uoc21tdSwgaSwgcGFnZSkuLi4NCj5zaW5jZSBwb2xsaW5n
IHRoZSBpbnN0YW5jZXMgaW4gcGFyYWxsZWwgcmF0aGVyIHRoYW4gaW4gc2VyaWVzIHNlZW1zIGxp
a2UgaXQgbWlnaHQgYmUgYSBiaXQgbW9yZSBlZmZpY2llbnQuDQoNClN5bmMgcmVnaXN0ZXIgaXMg
cHJvZ3JhbW1lZCBhdCB0aGUgc2FtZSB0aW1lIGZvciBib3RoIGluc3RhbmNlcy4gVGhlIHN0YXR1
cyBjaGVjayBpcyBzZXJpYWxpemVkLg0KSSBjYW4gdXBkYXRlIGl0IHRvIGNoZWNrIHN0YXR1cyBv
ZiBib3RoIGF0IHRoZSBzYW1lIHRpbWUuDQoNCj4+ICsJaWYgKHNtbXUtPmltcGwtPnRsYl9zeW5j
KSB7DQo+PiArCQlzbW11LT5pbXBsLT50bGJfc3luYyhzbW11LCBwYWdlLCBzeW5jLCBzdGF0dXMp
Ow0KDQo+V2hhdCBJJ2QgaG9wZWQgaXMgdGhhdCByYXRoZXIgdGhhbiBuZWVkaW5nIGEgaG9vayBm
b3IgdGhpcywgeW91IGNvdWxkIGp1c3Qgb3ZlcnJpZGUgc21tdV9kb21haW4tPnRsYl9vcHMgZnJv
bSAuaW5pdF9jb250ZXh0IHRvIHdpcmUgdXAgdGhlIGFsdGVybmF0ZSAuc3luYyBtZXRob2QgZGly
ZWN0bHkuIFRoYXQgd291bGQgc2F2ZSB0aGlzIGV4dHJhIGxldmVsIG9mIGluZGlyZWN0aW9uLg0K
DQpXaXRoIGFybV9zbW11X2RvbWFpbiBub3cgYXZhaWxhYmxlIGluIGFybS1zbW11LmgsICBhcm0t
c21tdS1udmlkaWEuYyBjYW4gZGlyZWN0bHkgdXBkYXRlIHRoZSB0bGJfb3BzLT50bGJfc3luYyBh
bmQgYXZvaWQgaW5kaXJlY3Rpb24uDQpXaWxsIHVwZGF0ZSBpbiBuZXh0IHZlcnNpb24uDQoNCi1L
UiANCg==
