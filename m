From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Wed, 1 Jul 2020 19:22:46 +0000
Message-ID: <BYAPR12MB2822911461ABAAC205E76DE7B36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-4-vdumpa@nvidia.com>
 <4b4b20af-7baa-0987-e40d-af74235153f6@nvidia.com>
 <6c2ce909-c71b-351f-79f5-b1a4b4c0e4ac@arm.com>
 <BYAPR12MB282244D2B008E1C8CA57916BB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <446ffe79-3a44-5d41-459f-b698a1cc361b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <446ffe79-3a44-5d41-459f-b698a1cc361b-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Pj4gV2l0aCBzaGFyZWQgaXJxIGxpbmUsIHRoZSBjb250ZXh0IGZhdWx0IGlkZW50aWZpY2F0aW9u
IGlzIG5vdCBvcHRpbWFsIGFscmVhZHkuICBSZWFkaW5nIGFsbCB0aGUgY29udGV4dCBiYW5rcyBh
bGwgdGhlIHRpbWUgY2FuIGJlIGFkZGl0aW9uYWwgbW1pbyByZWFkIG92ZXJoZWFkLiBCdXQsIGl0
IG1heSBub3QgaHVydCB0aGUgcmVhbCB1c2UgY2FzZXMgYXMgdGhlc2UgaGFwcGVuIG9ubHkgd2hl
biB0aGVyZSBhcmUgYnVncy4NCg0KPlJpZ2h0LCBJIGRpZCBwb25kZXIgdGhlIGlkZWEgb2YgYSB3
aG9sZSBwcm9ncmFtbWF0aWMgInJlcXVlc3RfY29udGV4dF9pcnEiIGhvb2sgdGhhdCB3b3VsZCBh
bGxvdyByZWdpc3RlcmluZyB0aGUgaGFuZGxlciBmb3IgYm90aCBpbnRlcnJ1cHRzIHdpdGggdGhl
IGFwcHJvcHJpYXRlIGNvbnRleHQgYmFuayBhbmQgaW5zdGFuY2UgZGF0YSwgYnV0IHNpbmNlIGFs
bCBpbnRlcnJ1cHRzIGFyZSBjdXJyZW50bHkgdW5leHBlY3RlZCBpdCBzZWVtcyBzb21ld2hhdCBo
YXJkIHRvIGp1c3RpZnkgdGhlIGV4dHJhIGNvbXBsZXhpdHkuIE9idmlvdXNseSB3ZSBjYW4gcmV2
aXNpdCB0aGlzIGluIGZ1dHVyZSBpZiB5b3Ugd2FudCB0byBzdGFydCBhY3R1YWxseSBkb2luZyBz
b21ldGhpbmcgd2l0aCBmYXVsdHMgbGlrZSB0aGUgcWNvbSBHUFUgZm9sa3MgZG8uDQoNClRoYW5r
cywgSSB3b3VsZCBqdXN0IGF2b2lkIG1ha2luZyBjaGFuZ2VzIHRvIGludGVycnVwdCBoYW5kbGVy
cyB0aWxsIGl0IGlzIHJlYWxseSBuZWNlc3NhcnkgaW4gZnV0dXJlLiBUaGUgY3VycmVudCBjb2Rl
IHdvdWxkIGp1c3QgYmUgc2ltcGxlIGFuZCBmdW5jdGlvbmFsIHdpdGggbW9yZSBpbnRlcnJ1cHRz
IHdoZW4gdGhlcmUgYXJlIG11bHRpcGxlIGZhdWx0cy4NCg0KLUtSDQo=
