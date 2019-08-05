From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v1 0/16] drm: panel related updates
Date: Mon, 5 Aug 2019 14:18:50 +0100
Message-ID: <20190805131850.GB5005@arch-x1c3>
References: <20190804201637.1240-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.
List-Id: linux-tegra@vger.kernel.org

T24gMjAxOS8wOC8wNCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFRoZSBmaXJzdCA5IHBhdGNoZXMg
cmVwbGFjZXMgZGlyZWN0IHVzZSBvZiB0aGUgZHJtX3BhbmVsCj4gZnVuY3Rpb24gcG9pbnRlcnMg
d2l0aCB0aGVpciBkcm1fcGFuZWxfKiBjb3VudGVycGFydHMuCj4gVGhlIGZ1bmN0aW9uIHBvaW50
ZXJzIGFyZSBvbmx5IHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkKPiB0aGUgZHJtX3BhbmVsIGluZnJh
c3RydWN0dXJlIGFuZCBkaXJlY3QgdXNlIGFyZSBkaXNjb3VyYWdlZC4KPiAKPiBpbGk5MzIyIGlz
IHVwZGF0ZWQgdG8gaGFuZGxlIGJ1c19mbGFncyBpbiBnZXRfbW9kZXMgbGlrZSBldmVyeW9uZSBl
bHNlLgo+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIGEgbGF0ZXIgcGF0Y2ggc2VyaWVzIHdo
ZXJlIGNvbnRyb2xsZXIKPiBiZWNvbWVzIGFuIGFydWd1bWVudCB0byBnZXRfbW9kZXMoKSBhbmQg
bm90IGxpa2UgdG9kYXkgd2hlcmUgZHJtX3BhbmVsCj4gaXMgYXR0YWNoZWQgdG8gYSBjb250cm9s
bGVyLgo+IAo+IFRoZSByZW1haW5pbmcgcGF0Y2hlcyBtb3ZlIGZ1bmN0aW9uYWxpdHkgdG8gdGhl
IGRybV9wYW5lbCBjb3JlIHRoYXQKPiB0b2RheSBhcmUgcmVwZWF0ZWQgaW4gbWFueSBkcml2ZXJz
Lgo+IEFzIHByZXBhcmF0aW9uIGZvciB0aGlzIHRoZSBpbmxpbmUgZnVuY3Rpb25zIGFyZSBtb3Zl
ZCB0byBkcm1fcGFuZWwuYwo+IGFuZCBrZXJuZWwtZG9jIGlzIG1hZGUgaW5saW5lLgo+IHBhbmVs
LXNpbXBsZSBpcyB1cGRhdGVkIHRvIGJlbmVmaXQgZnJvbSB0aGUgYWRkaXRpb25hbCBpbmZyYXN0
cnVjdHVyZQo+IGFuZCBpcyBhbiBleGFtcGxlIGZvciB0aGUgc2ltcGxpZmljYXRpb25zIHRoYXQg
Y2FuIGJlIGRvbmUuCj4gCj4gVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3RlZCBvbiBteSBlbWJl
ZGRlZCB0YXJnZXQsCj4gYW5kIGJ1aWxkIHRlc3RlZC4KPiAKPiBGZWVkYmFjayB3ZWxjb21lIQo+
IAo+IFRoZSAiZml4IG9wZW5jb2RlZCIgcGF0Y2hlcyBhcmUgYWxsIGluZGVwZW5kZW50IGFuZCBj
YW4gYmUgYXBwbGllZAo+IG91dCBvZiBvcmRlci4gVGhleSB3ZXJlIGtlcHQgaGVyZSB0byBrZWVw
IHBhbmVsIHJlbGF0ZWQgcGF0Y2hlcyBpbiBvbmUgc2VyaWVzLgo+IAo+IAlTYW0KPiAKVGhhbmtz
IGZvciB3b3JraW5nIG9uIHRoaXMgU2FtLgoKUGF0Y2hlcyAxLTEzIGFyZToKUmV2aWV3ZWQtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
