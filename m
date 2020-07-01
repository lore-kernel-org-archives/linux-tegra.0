From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Wed, 1 Jul 2020 19:12:58 +0000
Message-ID: <BYAPR12MB282210175D43BF649E2C5F87B36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2@nvidia.com>
 <d59b7220-168c-419f-db16-194307e11065@arm.com>
 <BYAPR12MB2822FC263456303302EF30BEB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <9ae6b6e6-bd64-9c89-49ca-1f5785ef3f0c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ae6b6e6-bd64-9c89-49ca-1f5785ef3f0c-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PlllYWgsIEkgcmVhbGlzZWQgbGF0ZXIgbGFzdCBuaWdodCB0aGF0IHRoaXMgcHJvYmFibHkgb3Jp
Z2luYXRlZCBmcm9tIGZvcmtpbmcgdGhlIHdob2xlIGRyaXZlciBkb3duc3RyZWFtLiBCdXQgZXZl
biB0aGVuIHlvdSBjb3VsZCBoYXZlIHRyZWF0ZWQgdGhlIG90aGVyIG9uZSBhcyBhIHNlcGFyYXRl
IG5zbW11IHdpdGggYSBzaW5nbGUgaW5zdGFuY2UgOykNCg0KVHJ1ZSwgQnV0IHRoZSBpbml0aWFs
IG52aWRpYSBpbXBsZW1lbnRhdGlvbiBoYWQgbGltaXRhdGlvbiB0aGF0IGl0IGNhbiBvbmx5IGhh
bmRsZSBvbmUgaW5zdGFuY2Ugb2YgdXNhZ2UuIFdpdGggeW91ciBpbXBsZW1lbnRhdGlvbiBob29r
cyBkZXNpZ24sIGl0IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBtdWx0aXBsZSBpbnN0YW5jZXMg
b2YgdXNhZ2Ugbm93Lg0KDQo+U2luY2UgaXQgZG9lcyBhZGQgYSBiaXQgb2YgY29uZnVzaW9uIHRv
IHRoZSBjb2RlIGFuZCBjb21tZW50cywgbGV0J3MganVzdCBrZWVwIHRoaW5ncyBzaW1wbGUuIEkg
ZG8gbGlrZSBKb24ncyBzdWdnZXN0aW9uIG9mIGFjdHVhbGx5IGVuZm9yY2luZyB0aGF0IHRoZSBu
dW1iZXIgb2YgInJlZyIgcmVnaW9ucyBleGFjdGx5IG1hdGNoZXMgdGhlIG51bWJlciBleHBlY3Rl
ZCBmb3IgdGhlIGdpdmVuIGNvbXBhdGlibGUgLSBJIGd1ZXNzIGZvciBub3cgdGhhdCBtZWFucyBq
dXN0IGhhcmQtY29kaW5nIDIgYW5kIGhvcGluZyB0aGUgaGFyZHdhcmUgZm9sa3MgZG9uJ3QgY29v
ayB1cCBhbnkgbW9yZSBvZiB0aGVzZS4uLg0KDQpGb3IgVDE5NCwgcmVnIGNhbiBqdXN0IGJlIGZv
cmNlZCB0byAyLiBObyBmdXR1cmUgcGxhbiB0byB1c2UgbW9yZSB0aGFuIHR3byBNTVUtNTAwcyB0
b2dldGhlciBhcyBvZiBub3cuIA0KDQotS1IgDQo=
