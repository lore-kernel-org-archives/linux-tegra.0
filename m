From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] pinctrl: make pinctrl_register() return proper error code
Date: Tue, 9 Jun 2015 08:48:21 -0700
Message-ID: <20150609154821.GW8863@xsjsorenbubuntu>
References: <1433822476-26531-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433822476-26531-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mi
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCAyMDE1LTA2LTA5IGF0IDAxOjAxUE0gKzA5MDAsIE1hc2FoaXJvIFlhbWFkYSB3cm90
ZToKPiBDdXJyZW50bHksIHBpbmN0cmxfcmVnaXN0ZXIoKSBqdXN0IHJldHVybnMgTlVMTCBvbiBl
cnJvciwgc28gdGhlCj4gY2FsbGVycyBjYW4gbm90IGtub3cgdGhlIGV4YWN0IHJlYXNvbiBvZiB0
aGUgZmFpbHVyZS4KPiAKPiBTb21lIG9mIHRoZSBwaW5jdHJsIGRyaXZlcnMgcmV0dXJuIC1FSU5W
QUwsIHNvbWUgLUVOT0RFViwgYW5kIHNvbWUKPiAtRU5PTUVNIG9uIGVycm9yIG9mIHBpbmN0cmxf
cmVnaXN0ZXIoKSwgYWx0aG91Z2ggdGhlIGVycm9yIGNvZGUKPiBtaWdodCBiZSBkaWZmZXJlbnQg
ZnJvbSB0aGUgcmVhbCBjYXVzZSBvZiB0aGUgZXJyb3IuCj4gCj4gVGhpcyBjb21taXQgcmV3b3Jr
cyBwaW5jdHJsX3JlZ2lzdGVyKCkgdG8gcmV0dXJuIHRoZSBhcHByb3ByaWF0ZQo+IGVycm9yIGNv
ZGUgYW5kIG1vZGlmaWVzIGFsbCBvZiB0aGUgcGluY3RybCBkcml2ZXJzIHRvIHVzZSBJU19FUlIo
KQo+IGZvciB0aGUgZXJyb3IgY2hlY2tpbmcgYW5kIFBUUl9FUlIoKSBmb3IgZ2V0dGluZyB0aGUg
ZXJyb3IgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IC0tLQo+IAo+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24g
bGludXgtcGluY3RybC9kZXZlbAo+IChDb21taXQgNzE2NDg3M2U3YzY5ZDZiYWI3NDcyNmRlYmMz
YjQ5NWE4NjMzMmIxZikuCj4gCj4gSSB0aGluayBJIGNvbnZlcnRlZCBhbGwgb2YgdGhlIHBpbmN0
cmwgZHJpdmVycywgYnV0IGp1c3QgaW4gY2FzZSwKPiBJJ2QgbGlrZSB0aGUgZHJpdmVyIG1haW50
YWluZXJzIHRvIGNoZWNrIHRoaXMgcGF0Y2ggb3V0Lgo+IAoKRm9yCj4gIGRyaXZlcnMvcGluY3Ry
bC9waW5jdHJsLXp5bnEuYyAgICAgICAgICAgICAgICB8ICA0ICsrLS0KCkFja2VkLWJ5OiBTw7Zy
ZW4gQnJpbmttYW5uIDxzb3Jlbi5icmlua21hbm5AeGlsaW54LmNvbT4KCglTw7ZyZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
