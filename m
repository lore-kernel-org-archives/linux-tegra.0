From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Wed, 1 Jul 2020 18:18:22 +0000
Message-ID: <BYAPR12MB2822FC263456303302EF30BEB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2@nvidia.com>
 <d59b7220-168c-419f-db16-194307e11065@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d59b7220-168c-419f-db16-194307e11065-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Pj4gKyAqIFdoZW4gTGludXgga2VybmVsIHN1cHBvcnRzIG11bHRpcGxlIFNNTVUgZGV2aWNlcywg
dGhlIFNNTVUgZGV2aWNlIA0KPj4gK3VzZWQgZm9yDQo+PiArICogaXNvY2hvcm5vdXMgSFcgZGV2
aWNlcyBzaG91bGQgYmUgYWRkZWQgYXMgYSBzZXBhcmF0ZSBBUk0gTU1VLTUwMCANCj4+ICtkZXZp
Y2UNCj4+ICsgKiBpbiBEVCBhbmQgYmUgcHJvZ3JhbW1lZCBpbmRlcGVuZGVudGx5IGZvciBlZmZp
Y2llbnQgVExCIGludmFsaWRhdGVzLg0KDQo+SSBkb24ndCB1bmRlcnN0YW5kIHRoZSAiV2hlbiIg
dGhlcmUgLSB0aGUgZHJpdmVyIGhhcyBhbHdheXMgc3VwcG9ydGVkIG11bHRpcGxlIGluZGVwZW5k
ZW50IFNNTVVzLCBhbmQgaXQncyBub3Qgc29tZXRoaW5nIHRoYXQgY291bGQgYmUgY29uZmlndXJl
ZCBvdXQgb3Igb3RoZXJ3aXNlIGRpc2FibGVkLiBQbHVzIEkgcmVhbGx5IGRvbid0IHNlZSB3aHkg
eW91IHdvdWxkIGV2ZXIgd2FudCB0byBmb3JjZSB1bnJlbGF0ZWQgU01NVXMgdG8gYmUgPnByb2dy
YW1tZWQgdG9nZXRoZXIgLSBiZXlvbmQgdGhlIFRMQiB0aGluZyBtZW50aW9uZWQgaXQgd291bGQg
YWxzbyB3YXN0ZSBwcmVjaW91cyBjb250ZXh0IGJhbmsgcmVzb3VyY2VzIGFuZCBtaWdodCBsZWFk
IHRvIHdlaXJkIGRldmljZSBncm91cGluZyB2aWEgZmFsc2Ugc3RyZWFtIElEIGFsaWFzaW5nLCB3
aXRoIG5vIG9idmlvdXMgdXBzaWRlIGF0IGFsbC4NCg0KU29ycnksIEkgbWlzc2VkIHRoaXMgY29t
bWVudC4NCkR1cmluZyB0aGUgaW5pdGlhbCBwYXRjaGVzLCB3aGVuIHRoZSBpb21tdV9vcHMgd2Vy
ZSBkaWZmZXJlbnQgYmV0d2Vlbiwgc3VwcG9ydCBtdWx0aXBsZSBTTU1VIGRyaXZlcnMgYXQgdGhl
IHNhbWUgaXMgbm90IHBvc3NpYmxlIGFzIG9uZSBvZiB0aGVtKHRoYXQgZ2V0cyBwcm9iZWQgbGFz
dCkgb3ZlcndyaXRlcyB0aGUgcGxhdGZvcm0gYnVzIG9wcy4gDQpPbiByZXZpc2l0aW5nIHRoZSBv
cmlnaW5hbCBpc3N1ZSwgVGhpcyBwcm9ibGVtIGlzIG5vIGxvbmdlciByZWxldmFudC4gQXQgdGhp
cyBwb2ludCwgSXQgbWFrZXMgbW9yZSBzZW5zZSB0byBqdXN0IGdldCByaWQgb2YgM3JkIGluc3Rh
bmNlIHByb2dyYW1taW5nIGluIGFybS1zbW11LW52aWRpYS5jIGFuZCBqdXN0IGxpbWl0IGl0IHRv
IHRoZSBTTU1VIGluc3RhbmNlcyB0aGF0IG5lZWQgaWRlbnRpY2FsIHByb2dyYW1taW5nLg0KDQot
S1INCg0KDQoNCg==
