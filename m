From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 2/3] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Date: Wed, 1 Jul 2020 19:00:21 +0000
Message-ID: <BYAPR12MB282245DD6BB50ECA700AC69EB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-3-vdumpa@nvidia.com>
 <3e655881-bac4-f083-44ed-cfa0a61298d0@arm.com>
 <BYAPR12MB28222D6ADEBA966AA27FA9ECB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
 <0d4f46d6-6a4e-bca0-bcf3-0e22a950e57b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0d4f46d6-6a4e-bca0-bcf3-0e22a950e57b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Pj4+PiArICAgICAgICBpdGVtczoNCj4+Pj4gKyAgICAgICAgICAtIGVudW06DQo+Pj4+ICsgICAg
ICAgICAgICAgIC0gbnZkaWEsdGVncmExOTQtc21tdQ0KPj4+PiArICAgICAgICAgIC0gY29uc3Q6
IGFybSxtbXUtNTAwDQo+ID4NCj4+PiBJcyB0aGUgZmFsbGJhY2sgY29tcGF0aWJsZSBhcHByb3By
aWF0ZSBoZXJlPyBJZiBzb2Z0d2FyZSB0cmVhdHMgdGhpcyBhcyBhIHN0YW5kYXJkIE1NVS01MDAg
aXQgd2lsbCBvbmx5IHByb2dyYW0gdGhlIGZpcnN0IGluc3RhbmNlIChiZWNhdXNlIHRoZSBzZWNv
bmQgaXNuJ3QgcHJlc2VudGVkIGFzIGEgc2VwYXJhdGUgTU1VLTUwMCkgLSBpcyB0aGVyZSBhbnkg
d2F5IHRoYXQgaXNuJ3QgZ29pbmcgdG8gYmxvdyB1cD8NCj4gPg0KPj4gV2hlbiBjb21wYXRpYmxl
IGlzIHNldCB0byBib3RoIG52aWRpYSx0ZWdyYTE5NC1zbW11IGFuZCBhcm0sbW11LTUwMCwgaW1w
bGVtZW50YXRpb24gb3ZlcnJpZGUgZW5zdXJlIHRoYXQgYm90aCBpbnN0YW5jZXMgYXJlIHByb2dy
YW1tZWQuIElzbid0IGl0PyBJIGFtIG5vdCBzdXJlIEkgZm9sbG93IHlvdXIgY29tbWVudCBmdWxs
eS4NCg0KPlRoZSBwcm9ibGVtIGlzLCBpZiBmb3Igc29tZSByZWFzb24gc29tZW9uZSBoYWQgYSBU
ZWdyYTE5NCwgYnV0IG9ubHkgc2V0IHRoZSBjb21wYXRpYmxlIHN0cmluZyB0byAnYXJtLG1tdS01
MDAnIGl0IHdvdWxkIGFzc3VtZSB0aGF0IGl0IHdhcyBhIG5vcm1hbCBhcm0sbW11LTUwMCBhbmQg
b25seSBvbmUgaW5zdGFuY2Ugd291bGQgYmUgcHJvZ3JhbW1lZC4gV2UgYWx3YXlzIHdhbnQgYXQg
bGVhc3QgMiBvZiB0aGUgMyBpbnN0YW5jZXMgPnByb2dyYW1tZWQgYW5kIHNvIHdlIHNob3VsZCBv
bmx5IG1hdGNoICdudmlkaWEsdGVncmExOTQtc21tdScuIEluIGZhY3QsIEkgdGhpbmsgdGhhdCB3
ZSBhbHNvIG5lZWQgdG8gdXBkYXRlIHRoZSBhcm1fc21tdV9vZl9tYXRjaCB0YWJsZSB0byBhZGQg
J252aWRpYSx0ZWdyYTE5NC1zbW11JyB3aXRoIHRoZSBkYXRhIHNldCB0byAmYXJtX21tdTUwMC4N
Cg0KSW4gdGhhdCBjYXNlLCBuZXcgYmluZGluZyAibnZpZGlhLHNtbXUtdjIiIGNhbiBiZSBhZGRl
ZCB3aXRoIGRhdGEgc2V0IHRvICZhcm1fbW11NTAwIGFuZCBlbnVtZXJhdGlvbiB3b3VsZCBoYXZl
IG52aWRpYSx0ZWdyYTE5NC1zbW11IGFuZCBhbm90aGVyIHZhcmlhbnQgZm9yIG5leHQgZ2VuZXJh
dGlvbiBTb0MgaW4gZnV0dXJlLiANCg0KLUtSDQotLQ0KbnZwdWJsaWMNCg==
