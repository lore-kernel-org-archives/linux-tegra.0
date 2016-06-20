From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFC PATCH 06/13] pinctrl: pinconf: Add generic helper function
 for freeing mappings
Date: Mon, 20 Jun 2016 10:26:54 +0100
Message-ID: <5767B6DE.6060808@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-7-git-send-email-jonathanh@nvidia.com>
 <CACRpkdYzHXL6S71QwEsKa_Y=rJHaNcRWjwRECtp=oQcfgNDObA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACRpkdYzHXL6S71QwEsKa_Y=rJHaNcRWjwRECtp=oQcfgNDObA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:DRM
 PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Ck9uIDE4LzA2LzE2IDEwOjA0LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIEZyaSwgSnVuIDE3
LCAyMDE2IGF0IDI6MDMgUE0sIEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPiB3cm90
ZToKPiAKPj4gVGhlIHBpbmNvbmYtZ2VuZXJpYy5oIGZpbGUgZXhwb3NlcyBmdW5jdGlvbnMgZm9y
IGNyZWF0aW5nIGdlbmVyaWMgbWFwcGluZ3MKPj4gYnV0IGl0IGRvZXMgbm90IGV4cG9zZSBhIGZ1
bmN0aW9uIGZvciBmcmVlaW5nIHRoZSBtYXBwaW5ncy4gQWRkIGEgZnVuY3Rpb24KPj4gZm9yIGZy
ZWVpbmcgZ2VuZXJpYyBtYXBwaW5ncy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9uIEh1bnRlciA8
am9uYXRoYW5oQG52aWRpYS5jb20+Cj4gCj4gTG9va3MgcmVhc29uYWJsZS4gQ2FuIEkgYXBwbHkg
aXQgaW4gaXNvbGF0aW9uIG9yIGRvIHlvdSBuZWVkIHRvIGtlZXAKPiBpdCBpbiB5b3VyIHNlcmll
cyB3aXRoIG15IEFDSz8KClRoZXJlIGlzIGRlZmluaXRlbHkgYSBidWlsZCBkZXBlbmRlbmN5IG9u
IHRoaXMgcGF0Y2ggZm9yIHRoZSBEUEFVWApkcml2ZXIuIFRoaWVycnkgd2FzIHN1Z2dlc3Rpbmcg
KGluIHJlc3BvbnNlIHRvIHBhdGNoIDAwLzEzKSB0aGF0IGhlIHRha2UKdGhpcyB0aHJvdWdoIHRo
ZSBkcm0vdGVncmEgYnJhbmNoIGlmIHlvdSBhcmUgb2sgd2l0aCB0aGF0PwoKPiBBY2tlZC1ieTog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmtzLgpKb24KCi0t
IApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
