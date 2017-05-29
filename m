From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Mon, 29 May 2017 10:48:09 +0200
Message-ID: <20170529084809.GA2192@mai>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a3QACHYqtCO1z_FpW0nXEtx356wCDha_=SNXU872=q1UQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, "moderated list:ARM/OXNAS platform support" <linux-oxnas-Xt5XgHjqiBU06sgRBLv0+0B+6BGkLq7r@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/STI ARCHITECTURE" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Alexander Shiyan <shc>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBNYXkgMjksIDIwMTcgYXQgMTA6NDE6NTJBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTYXQsIE1heSAyNywgMjAxNyBhdCAxMTo1OCBBTSwgRGFuaWVsIExlemNhbm8K
PiA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBUaGUgQ0xPQ0tTT1VDRV9P
Rl9ERUNMQVJFIG1hY3JvIGlzIHVzZWQgd2lkZWx5IGZvciB0aGUgdGltZXJzIHRvIGRlY2xhcmUg
dGhlCj4gPiBjbG9ja3NvdXJjZSBhdCBlYXJseSBzdGFnZS4gSG93ZXZlciwgdGhpcyBtYWNybyBp
cyBhbHNvIHVzZWQgdG8gaW5pdGlhbGl6ZQo+ID4gdGhlIGNsb2NrZXZlbnQgaWYgYW55LCBvciB0
aGUgY2xvY2tldmVudCBvbmx5Lgo+ID4KPiA+IEl0IHdhcyBvcmlnaW5hbGx5IHN1Z2dlc3RlZCB0
byBkZWNsYXJlIGFub3RoZXIgbWFjcm8gdG8gaW5pdGlhbGl6ZSBhCj4gPiBjbG9ja2V2ZW50LCBz
byBpbiBvcmRlciB0byBzZXBhcmF0ZSB0aGUgdHdvIGVudGl0aWVzIGV2ZW4gdGhleSBiZWxvbmcg
dG8gdGhlCj4gPiBzYW1lIElQLiBUaGlzIHdhcyBub3QgYWNjZXB0ZWQgYmVjYXVzZSBvZiB0aGUg
aW1wYWN0IG9uIHRoZSBEVCB3aGVyZSBzcGxpdHRpbmcKPiA+IGEgY2xvY2tzb3VyY2UvY2xvY2tl
dmVudCBkZWZpbml0aW9uIGRvZXMgbm90IG1ha2Ugc2Vuc2UgYXMgaXQgaXMgYSBMaW51eAo+ID4g
Y29uY2VwdCBub3QgYSBoYXJkd2FyZSBkZXNjcmlwdGlvbi4KPiA+Cj4gPiBPbiB0aGUgb3RoZXIg
c2lkZSwgdGhlIGNsb2Nrc291cmNlIGhhcyBub3QgaW50ZXJydXB0IGRlY2xhcmVkIHdoaWxlIHRo
ZQo+ID4gY2xvY2tldmVudCBoYXMsIHNvIGl0IGlzIGVhc3kgZnJvbSB0aGUgZHJpdmVyIHRvIGtu
b3cgaWYgdGhlIGRlc2NyaXB0aW9uIGlzCj4gPiBmb3IgYSBjbG9ja2V2ZW50IG9yIGEgY2xvY2tz
b3VyY2UsIElPVyBpdCBjb3VsZCBiZSBpbXBsZW1lbnRlZCBhdCB0aGUgZHJpdmVyCj4gPiBsZXZl
bC4KPiA+Cj4gPiBTbyBpbnN0ZWFkIG9mIGRlYWxpbmcgd2l0aCBhIG5hbWVkIGNsb2Nrc291cmNl
IG1hY3JvLCBsZXQncyB1c2UgYSBtb3JlIGdlbmVyaWMKPiA+IG9uZTogVElNRVJfT0ZfREVDTEFS
RS4KPiA+Cj4gPiBUaGUgcGF0Y2ggaGFzIG5vdCBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+
Cj4gCj4gQ291bGQgeW91IGVpdGhlciBsZWF2ZSB0aGUgb2xkIG5hbWUgYXMgYW4gYWxpYXMgZm9y
IG9uZSByZWxlYXNlLCBvciBpbnRyb2R1Y2UKPiB0aGUgbmV3IG5hbWUgYXMgYW4gYWxpYXMgbm93
IGZvciA0LjEzPwo+IAo+IEkgdGhpbmsgdGhhdCB0aGF0IHdvdWxkIG1ha2UgaXQgZWFzaWVyIHRv
IG1lcmdlIG5ldyBkcml2ZXJzLiBPdGhlcndpc2UgdGhpcwo+IGxvb2tzIGdvb2QgdG8gbWUsCgoK
TmV3IGRyaXZlcnMgc2hvdWxkIGdvIHRocm91Z2ggbXkgdHJlZSwgc28gSSBjYW4gY2F0Y2ggdGhl
bSB3aXRoIHRoZSBvbGQgbWFjcm8KbmFtZSBhbmQgZG8gdGhlIGNoYW5nZS4KCj4gQWNrZWQtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgot
LSAKCiA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJv
b2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xp
bmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBC
bG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tj
aGlwCg==
