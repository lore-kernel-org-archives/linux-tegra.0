From: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Subject: Re: Re: [PATCH] spi: tegra20-slink: Fix runtime PM imbalance on
 error
Date: Thu, 21 May 2020 16:24:53 +0800 (GMT+08:00)
Message-ID: <611a62f0.baefa.1723655d227.Coremail.dinghao.liu@zju.edu.cn>
References: <20200521074946.21799-1-dinghao.liu@zju.edu.cn>
 <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw@mail.gmail.com>
 <CAHp75Vf=a54jY+5ZoWG9Fkjf-0-TQWqNY6R4sPM7Y2oTyCNL6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Vf=a54jY+5ZoWG9Fkjf-0-TQWqNY6R4sPM7Y2oTyCNL6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

SGkgQW5keSwKClRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2UhIEkgd2lsbCBmaXggdGhlIHByb2Js
ZW0gaW4gdGhlIG5leHQgZWRpdGlvbgpvZiBwYXRjaC4gVGhlIGNvY2NpbmVsbGUgc2NyaXB0IHdp
bGwgYmUgdmVyeSBoZWxwZnVsIGFuZCBJJ20gbG9va2luZyAKZm9yd2FyZCB0byBpdC4KClJlZ2Fy
ZHMsCkRpbmdoYW8gCgomcXVvdDtBbmR5IFNoZXZjaGVua28mcXVvdDsgJmx0O2FuZHkuc2hldmNo
ZW5rb0BnbWFpbC5jb20mZ3Q75YaZ6YGT77yaCj4gT24gVGh1LCBNYXkgMjEsIDIwMjAgYXQgMTE6
MDQgQU0gQW5keSBTaGV2Y2hlbmtvDQo+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90
ZToNCj4gPiBPbiBUaHUsIE1heSAyMSwgMjAyMCBhdCAxMDo1MCBBTSBEaW5naGFvIExpdSA8ZGlu
Z2hhby5saXVAemp1LmVkdS5jbj4gd3JvdGU6DQo+IA0KPiBBbnkgSSBoYXZlIGNvY2NpbmVsbGUg
c2NyaXB0IGZvciB0aGlzLCBJIGNhbiBzaGFyZSB3aXRoIHlvdS4NCj4gDQo+IC0tIA0KPiBXaXRo
IEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo=
