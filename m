From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 15:23:11 +0000
Message-ID: <BYAPR12MB3398350797241F90AE347FB5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <32b0b694-f912-044e-1a50-55b9c355d0c3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32b0b694-f912-044e-1a50-55b9c355d0c3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

DQo+SXQgYmVjYW1lIGFwcGFyZW50IHRvIG1lIHRoYXQgdGhlcmUgaXMgYSBwcm9ibGVtIGhlcmUu
IFRoZSBzaXplIG9mIGRtYV9idWYgaXMgNDA5NiBieXRlcyBhbmQgbWF4aW11bSBtZXNzYWdlIGxl
bmd0aCBpcyA0MDk2IHRvbywgd2UgaGF2ZSBwdXNoZWQgMTIgYnl0ZXMgcGFja2V0X2hlYWRlciB0
byB0aGUgYnVmZmVyID5hbmQgbm93IHRoZXJlIGFyZSA0MDg0IGJ5dGVzIGxlZnQgZm9yIHRoZSBt
ZXNzYWdlIGluIHRoZSBidWZmZXIuIEhlbmNlIHRyYW5zZmVyIG9mIDRLQiB3aWxsIGNhdXNlIGJ1
ZmZlciBvdmVyZmxvdyBhbmQgZWl0aGVyIGNyYXNoIGtlcm5lbCBvciBjb3JydXB0IG1lbW9yeS4g
T25lIHNvbHV0aW9uIGlzIHRvIGp1c3QgYWx3YXlzID5wdXNoIHBhY2tldF9oZWFkZXIgdXNpbmcg
UElPLCBvdGhlciB0byByZWR1Y2UgbWF4X3dyaXRlX2xlbiBvciBpbmNyZWFzZSBkbWFfYnVmIHNp
emUuDQoNClllcywgVGhpcyBpcyBrbm93biB0byBtZSBhbmQgSSB3aWxsIGFkZCBzZXBhcmF0ZSBw
YXRjaCBmb3IgdGhpcyB0byB1cGRhdGUgcXVpcmtzIHRvIHRha2UgY2FyZSBmb3IgdDE4NiBhbmQg
dDE5NCB0byBleGNsdWRlIHBhY2tldCBoZHIgbGVuZ3Rocw0KVGhlcmUgd2FzIHNlcGFyYXRlIHBh
dGNoIHdoZW4gcXVpcmtzIHdlcmUgYWRkZWQgYW5kIGl0IGdvdCBtZXJnZWQgYWxyZWFkeSBmcm9t
IDUuMC1yYzEgYnV0IGRvbuKAmXQgd2FudCB0byBzbmVhayB0aGF0IGhlcmUuIFdpbGwgc2VuZCBz
ZXBhcmF0ZSBwYXRjaCB0byB0YWtlIGNhcmUgb2YgdGhpcy4NCk5lZWQgdG8gdXBkYXRlIHF1aXJr
IHRvIGV4Y2x1ZGUgcGFja2V0IGhlYWRlcg0KDQo=
