From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH RESEND 07/14] drm/msm/hdmi: Provide ddc symlink in hdmi
 connector sysfs directory
Date: Wed, 6 Nov 2019 10:58:26 -0500
Message-ID: <CAMavQKJhC==nDFFqCXK-J-VLdDkZHUCoSLe6KgALLSYR7kFDfw@mail.gmail.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
 <1e343b02195757bfbf60ca8999cadeb376db204e.1566845537.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1e343b02195757bfbf60ca8999cadeb376db204e.1566845537.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Uma Shankar <uma.shankar@intel.com>, freedreno <freedreno@lists.freedesktop.org>, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>, LKML
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMzoyNyBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJv
dmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiBBY2tlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3Yg
PGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKQWNrZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29ubmVj
dG9yLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1p
X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29ubmVjdG9yLmMK
PiBpbmRleCAwN2I0Y2I4NzdkODIuLjFmMDMyNjJiOGE1MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5jCj4gQEAgLTQ1MCw4ICs0NTAsMTAgQEAgc3RydWN0
IGRybV9jb25uZWN0b3IgKm1zbV9oZG1pX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBoZG1pICpoZG1p
KQo+Cj4gICAgICAgICBjb25uZWN0b3IgPSAmaGRtaV9jb25uZWN0b3ItPmJhc2U7Cj4KPiAtICAg
ICAgIGRybV9jb25uZWN0b3JfaW5pdChoZG1pLT5kZXYsIGNvbm5lY3RvciwgJmhkbWlfY29ubmVj
dG9yX2Z1bmNzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9I
RE1JQSk7Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoaGRtaS0+ZGV2LCBj
b25uZWN0b3IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmhkbWlfY29u
bmVjdG9yX2Z1bmNzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBoZG1pLT5pMmMpOwo+ICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3Rv
ciwgJm1zbV9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+Cj4gICAgICAgICBjb25uZWN0
b3ItPnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9DT05ORUNUIHwKPiAtLQo+IDIuMTcuMQo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
