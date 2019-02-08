From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V16 4/6] i2c: tegra: Add DMA support
Date: Fri, 8 Feb 2019 17:06:24 +0000
Message-ID: <BYAPR12MB33987BF143F5903AE5DA196AC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549644314-1481-1-git-send-email-skomatineni@nvidia.com>
 <1549644314-1481-4-git-send-email-skomatineni@nvidia.com>
 <dd2899ab-1a5f-834c-ab97-1654845c7de2@gmail.com>
 <BYAPR12MB33980494FB2E5C439210124FC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33980494FB2E5C439210124FC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+IEknbSBzdGlsbCBhbHNvIHN1Z2dlc3RpbmcgdG8gc3F1YXNoICJmaXggbWF4aW11bSB0cmFu
c2ZlciBzaXplIiBpbnRvIHRoaXMgcGF0Y2ggYmVjYXVzZSBpdCBpcyByZWFsbHkgcGFydCBvZiBE
TUEtc3VwcG9ydCBlbmFibGluZy4NCg0KTWF4IHRyYW5zZmVyIGxlbmd0aCBsaW1pdHMgYXBwbHkg
dG8gUElPIGFsc28gYnV0IGZvciBETUEgaXRzIG1vcmUgbmVlZGVkIHRvIHByZXZlbnQgY3Jhc2gu
DQpTbyBoYWQgdGhpcyBhcyBwYXRjaCBiZWZvcmUgRE1BIGFzIGl0cyBhcHBsaWNhYmxlIGZvciBi
b3RoIERNQSAmIFBJTy4NCldlIGV4Y2hhbmdlZCBvbiB0aGlzIHllc3RlcmRheSwgc28gdGhvdWdo
dCB0aGUgcmVhc29uIHlvdSB3YW50IHRvIHNxdWFzaCBzZXBhcmF0ZSBwYXRjaCBhbmQgaW5jbHVk
ZSBpbiB0aGlzIGlzIGR1ZSB0byBtYXggbXNnIGxlbiBsaW1pdCBhbmQgd2hlbiBtb3ZlZCBpbnRv
IGh3IGZlYXR1cmUuDQoNClNvcnJ5IHNob3VsZCBoYXZlIHZlcmlmaWVkIGJlZm9yZSBzZW5kaW5n
LiBQbGVhc2UgY29uZmlybSBpZiBJIGxlYXZlIG1heCB0cmFuc2ZlciBhcyBzZXBhcmF0ZSBwYXRj
aCBvciBhZGQgdG8gdGhpcyBETUEgc3VwcG9ydC4gV2lsbCB1cGRhdGUgYWxvbmcgd2l0aCBkbWEg
YnVmIHNpemUgZml4Lg0KDQpCdXQgbWF4IHRyYW5zZmVyIGxpbWl0IGFwcGxpZWQgdG8gUElPIGFs
c28gYW5kIHRoYXTigJlzIHdoeSBhZGRlZCBpdCBiZWZvcmUgRE1BIHBhdGNoIHRvIHNob3cgaXRz
IGRlcGVuZGVuY3kNCg==
