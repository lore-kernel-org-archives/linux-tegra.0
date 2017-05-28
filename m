From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Sun, 28 May 2017 16:20:03 +0200
Message-ID: <376de2ec-c557-8541-9480-66472bd153a5@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
 <CACRpkdZbVv94hE9Gg+xiH2dxJANo-fPwLSek+BE4QwWWWWUixw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZbVv94hE9Gg+xiH2dxJANo-fPwLSek+BE4QwWWWWUixw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/OXNAS platform support" <linux-oxnas@lists.tuxfamily.org>, Patrice Chotard <patrice.chotard@st.com>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Ingo Molnar <mingo@kernel.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Alexander Shiyan <shc_work@mail.ru>, open list:ARM/Rockchip So
List-Id: linux-tegra@vger.kernel.org

T24gMjgvMDUvMjAxNyAxNTo0OCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBTYXQsIE1heSAy
NywgMjAxNyBhdCAxMTo1OCBBTSwgRGFuaWVsIExlemNhbm8KPiA8ZGFuaWVsLmxlemNhbm9AbGlu
YXJvLm9yZz4gd3JvdGU6Cj4gCj4+IFRoZSBDTE9DS1NPVUNFX09GX0RFQ0xBUkUgbWFjcm8gaXMg
dXNlZCB3aWRlbHkgZm9yIHRoZSB0aW1lcnMgdG8gZGVjbGFyZSB0aGUKPj4gY2xvY2tzb3VyY2Ug
YXQgZWFybHkgc3RhZ2UuIEhvd2V2ZXIsIHRoaXMgbWFjcm8gaXMgYWxzbyB1c2VkIHRvIGluaXRp
YWxpemUKPj4gdGhlIGNsb2NrZXZlbnQgaWYgYW55LCBvciB0aGUgY2xvY2tldmVudCBvbmx5Lgo+
Pgo+PiBJdCB3YXMgb3JpZ2luYWxseSBzdWdnZXN0ZWQgdG8gZGVjbGFyZSBhbm90aGVyIG1hY3Jv
IHRvIGluaXRpYWxpemUgYQo+PiBjbG9ja2V2ZW50LCBzbyBpbiBvcmRlciB0byBzZXBhcmF0ZSB0
aGUgdHdvIGVudGl0aWVzIGV2ZW4gdGhleSBiZWxvbmcgdG8gdGhlCj4+IHNhbWUgSVAuIFRoaXMg
d2FzIG5vdCBhY2NlcHRlZCBiZWNhdXNlIG9mIHRoZSBpbXBhY3Qgb24gdGhlIERUIHdoZXJlIHNw
bGl0dGluZwo+PiBhIGNsb2Nrc291cmNlL2Nsb2NrZXZlbnQgZGVmaW5pdGlvbiBkb2VzIG5vdCBt
YWtlIHNlbnNlIGFzIGl0IGlzIGEgTGludXgKPj4gY29uY2VwdCBub3QgYSBoYXJkd2FyZSBkZXNj
cmlwdGlvbi4KPj4KPj4gT24gdGhlIG90aGVyIHNpZGUsIHRoZSBjbG9ja3NvdXJjZSBoYXMgbm90
IGludGVycnVwdCBkZWNsYXJlZCB3aGlsZSB0aGUKPj4gY2xvY2tldmVudCBoYXMsIHNvIGl0IGlz
IGVhc3kgZnJvbSB0aGUgZHJpdmVyIHRvIGtub3cgaWYgdGhlIGRlc2NyaXB0aW9uIGlzCj4+IGZv
ciBhIGNsb2NrZXZlbnQgb3IgYSBjbG9ja3NvdXJjZSwgSU9XIGl0IGNvdWxkIGJlIGltcGxlbWVu
dGVkIGF0IHRoZSBkcml2ZXIKPj4gbGV2ZWwuCj4+Cj4+IFNvIGluc3RlYWQgb2YgZGVhbGluZyB3
aXRoIGEgbmFtZWQgY2xvY2tzb3VyY2UgbWFjcm8sIGxldCdzIHVzZSBhIG1vcmUgZ2VuZXJpYwo+
PiBvbmU6IFRJTUVSX09GX0RFQ0xBUkUuCj4+Cj4+IFRoZSBwYXRjaCBoYXMgbm90IGZ1bmN0aW9u
YWwgY2hhbmdlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExlemNhbm8gPGRhbmllbC5s
ZXpjYW5vQGxpbmFyby5vcmc+Jwo+IAo+IFRoaXMgbWFrZXMgdGhlIG1hY3JvIG1ha2Ugc2Vuc2Ug
YW5kIEkgaGFkIHRoaXMgaWRlYSBvbmUgdGltZSB0b28uCj4gQXdlc29tZS4KPiBSZXZpZXdlZC1i
eTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpUaGFua3MgTGludXMg
Zm9yIHJldmlld2luZyB0aGUgc2VyaWVzLgoKICAtLSBEYW5pZWwKCi0tIAogPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmM=
