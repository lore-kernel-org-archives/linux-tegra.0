From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 2/3] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Date: Wed, 1 Jul 2020 18:28:55 +0000
Message-ID: <BYAPR12MB28222D6ADEBA966AA27FA9ECB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-3-vdumpa@nvidia.com>
 <3e655881-bac4-f083-44ed-cfa0a61298d0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3e655881-bac4-f083-44ed-cfa0a61298d0-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE5WSURJQSBTb0NzIHRoYXQgdXNlIG1vcmUgdGhhbiBv
bmUgImFybSxtbXUtNTAwIg0KPiBIbW0sIHRoZXJlIG11c3QgYmUgYSBiZXR0ZXIgd2F5IHRvIHdv
cmQgdGhhdCB0byBleHByZXNzIHRoYXQgaXQgb25seSBhcHBsaWVzIHRvIHRoZSBzZXRzIG9mIFNN
TVVzIHRoYXQgbXVzdCBiZSBwcm9ncmFtbWVkIGlkZW50aWNhbGx5LCBhbmQgbm90IGFueSBvdGhl
ciBpbmRlcGVuZGVudCBNTVUtNTAwcyB0aGF0IG1pZ2h0IGFsc28gaGFwcGVuIHRvIGJlIGluIHRo
ZSBzYW1lIFNvQy4NCg0KTGV0IG1lIHJld29yZCBpdCB0byAiTlZJRElBIFNvQ3MgdGhhdCBtdXN0
IHByb2dyYW0gbXVsdGlwbGUgTU1VLTUwMHMgaWRlbnRpY2FsbHkiLg0KDQo+PiArICAgICAgICBp
dGVtczoNCj4+ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAgICAgLSBudmRpYSx0
ZWdyYTE5NC1zbW11DQo+PiArICAgICAgICAgIC0gY29uc3Q6IGFybSxtbXUtNTAwDQoNCj5JcyB0
aGUgZmFsbGJhY2sgY29tcGF0aWJsZSBhcHByb3ByaWF0ZSBoZXJlPyBJZiBzb2Z0d2FyZSB0cmVh
dHMgdGhpcyBhcyBhIHN0YW5kYXJkIE1NVS01MDAgaXQgd2lsbCBvbmx5IHByb2dyYW0gdGhlIGZp
cnN0IGluc3RhbmNlIChiZWNhdXNlIHRoZSBzZWNvbmQgaXNuJ3QgcHJlc2VudGVkIGFzIGEgc2Vw
YXJhdGUgTU1VLTUwMCkgLSBpcyB0aGVyZSBhbnkgd2F5IHRoYXQgaXNuJ3QgZ29pbmcgdG8gYmxv
dyB1cD8NCg0KV2hlbiBjb21wYXRpYmxlIGlzIHNldCB0byBib3RoIG52aWRpYSx0ZWdyYTE5NC1z
bW11IGFuZCBhcm0sbW11LTUwMCwgaW1wbGVtZW50YXRpb24gb3ZlcnJpZGUgZW5zdXJlIHRoYXQg
Ym90aCBpbnN0YW5jZXMgYXJlIHByb2dyYW1tZWQuIElzbid0IGl0PyBJIGFtIG5vdCBzdXJlIEkg
Zm9sbG93IHlvdXIgY29tbWVudCBmdWxseS4NCg0KLUtSDQoNCg==
