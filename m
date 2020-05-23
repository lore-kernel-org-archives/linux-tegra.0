From: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Subject: Re: Re: Re: Re: [PATCH] spi: tegra20-slink: Fix runtime PM
 imbalance on error
Date: Sat, 23 May 2020 20:04:29 +0800 (GMT+08:00)
Message-ID: <ee08a95.c20fb.172416b96e4.Coremail.dinghao.liu@zju.edu.cn>
References: <20200521074946.21799-1-dinghao.liu@zju.edu.cn>
 <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw@mail.gmail.com>
 <5a8a6e7b.bef25.1723b588c7f.Coremail.dinghao.liu@zju.edu.cn>
 <CAHp75Vem1kQviLrobJ65aVOb_VCmLkAv=5U_iXAdWPNe7n0+Ng@mail.gmail.com>
 <CAHp75VexCBc6iCrd_VLj5jXE8cxxdzUUf6pMG6O8LjtNj0J1Aw@mail.gmail.com>
 <53722a45.c204d.172414e8ed8.Coremail.dinghao.liu@zju.edu.cn>
 <CAHp75VcfcE63KHbyokoBuBKDdTHiB8QiauL8XU=rRo0-=NL-Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VcfcE63KHbyokoBuBKDdTHiB8QiauL8XU=rRo0-=NL-Kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PiBPbiBTYXQsIE1heSAyMywgMjAyMCBhdCAyOjMyIFBNIDxkaW5naGFvLmxpdUB6anUuZWR1LmNu
PiB3cm90ZToKPiA+Cj4gPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDY6MjAgUE0gQW5keSBT
aGV2Y2hlbmtvCj4gPiA+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiA+ID4g
PiBPbiBGcmksIE1heSAyMiwgMjAyMCBhdCAxMDo0NiBBTSA8ZGluZ2hhby5saXVAemp1LmVkdS5j
bj4gd3JvdGU6Cj4gCj4gLi4uCj4gCj4gPiBJIGFsc28gY2hlY2tlZCBtYW55IG90aGVyIGltcGxl
bWVudGF0aW9uIG9mIHByb2JlIGluIGRyaXZlcnMuCj4gPiBJdCBzZWVtcyB0aGF0IHVzaW5nIHBt
X3J1bnRpbWVfcHV0KCkgaXMgb2suCj4gCj4gSW4gKmVycm9yIHBhdGgqIG9yIG5vcm1hbCBwYXRo
Pwo+IAoKRXJyb3IgcGF0aCAoZS5nLiwgc3lzY19wcm9iZSwgZXh5bm9zX3RybmdfcHJvYmUsIApt
YXBfcm5nX3Byb2JlLCB0aV9lcWVwX3Byb2JlKS4KCj4gPiBJZiBJIG1pc3VuZGVyc3Rvb2QKPiA+
IHlvdXIgb3BpbmlvbiwgcGxlYXNlIHBvaW50IGl0IG91dCwgdGhhbmtzLgo+IAo+IEJvdHRvbSBs
aW5lIGlzIChmb3IgdGhlICplcnJvciBwYXRoKiBjYXNlKToKPiBwbV9ydW50aW1lX3B1dF9ub2lk
bGUoKSBoYXMgbm8gc2lkZSBlZmZlY3RzCj4gcG1fcnVudGltZV9wdXQoKSAocG90ZW50aWFsbHkp
IG1pZ2h0IGhhdmUgc2lkZSBlZmZlY3RzLgo+IAo+IFlvdSBzaG91bGQgY2hvb3NlIG9uZSB3aGlj
aCBpcyBjbGVhcmVyIGFib3V0IHdoYXQgaXQgZG9lcy4KPiAKPiAtLSAKPiBXaXRoIEJlc3QgUmVn
YXJkcywKPiBBbmR5IFNoZXZjaGVua28KCkFncmVlLCBmb3IgdGhpcyBidWcgdXNpbmcgX25vaWRs
ZSgpIGlzIGNsZWFyZXIuIEkgd2lsbCAKc2VuZCBhIG5ldyBwYXRoIHRvIGZpeCB0aGlzLgoKUmVn
YXJkcywKRGluZ2hhbwoK
