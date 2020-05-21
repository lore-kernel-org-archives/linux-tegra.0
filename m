From: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Subject: Re: Re: [PATCH] [v2] media: staging: tegra-vde: fix runtime pm
 imbalance on error
Date: Thu, 21 May 2020 19:42:56 +0800 (GMT+08:00)
Message-ID: <4b400526.bbc83.172370b23a0.Coremail.dinghao.liu@zju.edu.cn>
References: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
 <20200521112131.GG30374@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200521112131.GG30374@kadam>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: kjlu-OJFnDUYgAso@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

V2UgbmVlZCB0byBtYWtlIHN1cmUgaWYgcG1fcnVudGltZV9nZXRfc3luYygpIGlzIGRlc2lnbmVk
IHdpdGgKc3VjaCBiZWhhdmlvciBiZWZvcmUgbW9kaWZ5aW5nIGl0LiAgCgpJIHJlY2VpdmVkIGEg
cmVzcG9uc2UgZnJvbSBSYWZhZWwgd2hlbiBJIGNvbW1pdGVkIGEgc2ltaWxhciBwYXRjaDoKaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNS8yMC8xMTAwCkl0IHNlZW1zIHRoYXQgdGhpcyBiZWhh
dmlvciBpcyBpbnRlbnRpb25hbCBhbmQgbmVlZHMgdG8gYmUga2VwdC4KClJlZ2FyZHMsCkRpbmdo
YW8KCiZxdW90O0RhbiBDYXJwZW50ZXImcXVvdDsgJmx0O2Rhbi5jYXJwZW50ZXJAb3JhY2xlLmNv
bSZndDvlhpnpgZPvvJoKPiBPbiBUaHUsIE1heSAyMSwgMjAyMCBhdCAwMjoyNzo0NVBNICswODAw
LCBEaW5naGFvIExpdSB3cm90ZToNCj4gPiBwbV9ydW50aW1lX2dldF9zeW5jKCkgaW5jcmVtZW50
cyB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudGVyIGV2ZW4NCj4gPiB0aGUgY2FsbCByZXR1cm5z
IGFuIGVycm9yIGNvZGUuIFRodXMgYSBwYWlyaW5nIGRlY3JlbWVudCBpcyBuZWVkZWQNCj4gPiBv
biB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCB0byBrZWVwIHRoZSBjb3VudGVyIGJhbGFuY2VkLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1
LmNuPg0KPiANCj4gTGV0J3Mgc3RvcCB3b3JraW5nIGFyb3VuZCB0aGUgYnVnIGluIHBtX3J1bnRp
bWVfZ2V0X3N5bmMoKSBhbmQgd3JpdGUNCj4gYSByZXBsYWNlbWVudCBmb3IgaXQgaW5zdGVhZC4N
Cj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCg==
