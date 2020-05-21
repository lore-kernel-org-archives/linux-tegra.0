From: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Subject: Re: Re: Re: [PATCH] [v2] media: staging: tegra-vde: fix runtime pm
 imbalance on error
Date: Thu, 21 May 2020 20:21:38 +0800 (GMT+08:00)
Message-ID: <10fd55e1.bbe50.172372e9216.Coremail.dinghao.liu@zju.edu.cn>
References: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
 <20200521112131.GG30374@kadam>
 <4b400526.bbc83.172370b23a0.Coremail.dinghao.liu@zju.edu.cn>
 <20200521120344.GH30374@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200521120344.GH30374@kadam>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, kjlu-OJFnDUYgAso@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

U29ycnksIEkgbWlzdW5kZXJzdG9vZCB5b3VyIGlkZWEgYmVmb3JlLiBBIG5ldyBmdW5jdGlvbiBp
cyAKdGhlIGJlc3Qgc29sdXRpb24gZm9yIHRoaXMgcHJvYmxlbS4KClJlZ2FyZHMsCkRpbmdoYW8K
CiZxdW90O0RhbiBDYXJwZW50ZXImcXVvdDsgJmx0O2Rhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbSZn
dDvlhpnpgZPvvJoKPiBPbiBUaHUsIE1heSAyMSwgMjAyMCBhdCAwNzo0Mjo1NlBNICswODAwLCBk
aW5naGFvLmxpdUB6anUuZWR1LmNuIHdyb3RlOg0KPiA+IFdlIG5lZWQgdG8gbWFrZSBzdXJlIGlm
IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBpcyBkZXNpZ25lZCB3aXRoDQo+ID4gc3VjaCBiZWhhdmlv
ciBiZWZvcmUgbW9kaWZ5aW5nIGl0LiAgDQo+ID4gDQo+ID4gSSByZWNlaXZlZCBhIHJlc3BvbnNl
IGZyb20gUmFmYWVsIHdoZW4gSSBjb21taXRlZCBhIHNpbWlsYXIgcGF0Y2g6DQo+ID4gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMjAvNS8yMC8xMTAwDQo+ID4gSXQgc2VlbXMgdGhhdCB0aGlzIGJl
aGF2aW9yIGlzIGludGVudGlvbmFsIGFuZCBuZWVkcyB0byBiZSBrZXB0Lg0KPiANCj4gWWVzLiAg
VGhpcyBpcyB3aHkgSSBoYXZlIHNhaWQgdHdpY2Ugb3IgdGhyZWUgdGltZXMgdG8gbm90IGNoYW5n
ZQ0KPiBwbV9ydW50aW1lX2dldF9zeW5jKCkgYnV0IGluc3RlYWQgdG8gd3JpdGUgYSByZXBsYWNl
bWVudC4NCj4gDQo+IEEgbGFyZ2UgcGVyY2VudCBvZiB0aGUgY2FsbGVycyBhcmUgYnVnZ3kuICBU
aGUgcG1fcnVudGltZV9nZXRfc3luYygpIGlzDQo+IGEgLTQgb24gUnVzdHkncyBBUEkgc2NhbGUu
DQo+IGh0dHA6Ly9zd2VuZy50aGUtZGF2aWVzLm5ldC9Ib21lL3J1c3R5cy1hcGktZGVzaWduLW1h
bmlmZXN0bw0KPiBPbmUgY291bGQgYXJndWUgdGhhdCBhbnl0aGluZyBhYm92ZSBhIC00IGlzIHJl
YWxseSBhIDIgaWYgeW91IHJlYWQNCj4gdGhlIGltcGxlbWVudGF0aW9uIHRob3Vyb3VnaGx5IGVu
b3VnaC4uLg0KPiANCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KPiANCg==
