From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 20:21:44 +0000
Message-ID: <BYAPR12MB282290F6E270DB90040379A0B36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <e6da9661-4e62-6e34-ac21-63ff993ca8bc@nvidia.com>
 <BYAPR12MB282210677459B8D62623C642B36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <4037efc7-fbed-e8cf-dac7-212c65014e4e@nvidia.com>
 <eb0ffc7e-f41b-d17c-6a90-049335098cd2@nvidia.com>
 <BYAPR12MB2822B43B0218F6E55C97451BB36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <64ffa84f-a8cf-ae81-6306-b5d8b1ff0618@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64ffa84f-a8cf-ae81-6306-b5d8b1ff0618-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka@gmail>
List-Id: linux-tegra@vger.kernel.org

Pj4gVGhlIGRyaXZlciBpbnRlbmQgdG8gc3VwcG9ydCB1cCB0byAzIGluc3RhbmNlcy4gSXQgZG9l
c24ndCByZWFsbHkgbWFuZGF0ZSB0aGF0IGFsbCB0aHJlZSBpbnN0YW5jZXMgYmUgcHJlc2VudCBp
biBzYW1lIERUIG5vZGUuDQo+PiBFYWNoIG1taW8gYXBlcnR1cmUgaW4gInJlZyIgcHJvcGVydHkg
aXMgYW4gaW5zdGFuY2UgaGVyZS4gcmVnID0gDQo+PiA8aW5zdDBfYmFzZSwgc2l6ZT4sIDxpbnN0
MV9iYXNlLCBzaXplPiwgPGluc3QyX2Jhc2UsIHNpemU+OyBUaGUgcmVnIGNhbiBoYXZlIGFsbCB0
aHJlZSBvciBsZXNzIGFuZCBkcml2ZXIganVzdCBjb25maWd1cmVzIGJhc2VkIG9uIHJlZyBhbmQg
aXQgd29ya3MgZmluZS4NCg0KPlNvIGl0IHNvdW5kcyBsaWtlIHdlIG5lZWQgYXQgbGVhc3QgMiBT
TU1VcyAoZm9yIG5vbi1pc28gYW5kIGlzbykgYnV0IHdlIGhhdmUgdXAgdG8gMyAoZm9yIFRlZ3Jh
MTk0KS4gU28gdGhlIHF1ZXN0aW9uIGlzIGRvIHdlIGhhdmUgYSB1c2UtY2FzZSB3aGVyZSB3ZSBv
bmx5IHVzZSAyIGFuZCBub3QgMz8gSWYgbm90LCB0aGVuIGl0IHN0aWxsIHNlZW1zIHRoYXQgd2Ug
c2hvdWxkIHJlcXVpcmUgdGhhdCBhbGwgMyBhcmUgcHJlc2VudC4NCg0KSXQgY2FuIGJlIGVpdGhl
ciAyIFNNTVVzIChmb3Igbm9uLWlzbykgb3IgMyBTTU1VcyAoZm9yIG5vbi1pc28gYW5kIGlzbyku
ICBMZXQgbWUgZmFpbCB0aGUgb25lIGluc3RhbmNlIGNhc2UgYXMgaXQgY2FuIHVzZSByZWd1bGFy
IGFybSBzbW11IGltcGxlbWVudGF0aW9uIGFuZCBkb24ndCAgbmVlZCBudmlkaWEgaW1wbGVtZW50
YXRpb24gZXhwbGljaXRseS4NCiANCj5UaGUgb3RoZXIgcHJvYmxlbSBJIHNlZSBoZXJlIGlzIHRo
YXQgY3VycmVudGx5IHRoZSBhcm0tc21tdSBiaW5kaW5nIGRlZmluZXMgdGhlICdyZWcnIHdpdGgg
YSAnbWF4SXRlbXMnIG9mIDEsIHdoZXJlYXMgd2UgaGF2ZSAzLiBJIGJlbGlldmUgdGhhdCB0aGlz
IHdpbGwgZ2V0IGNhdWdodCBieSB0aGUgJ2R0X2JpbmRpbmdfY2hlY2snIHdoZW4gd2UgdHJ5IHRv
IHBvcHVsYXRlIHRoZSBiaW5kaW5nLg0KDQpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dCEgV2ls
bCB1cGRhdGUgdGhlIGJpbmRpbmcgZG9jLg0KDQotS1INCg0KLS0NCm52cHVibGljDQo=
