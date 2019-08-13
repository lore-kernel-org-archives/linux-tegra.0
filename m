From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 19/24] drm/bridge: dumb-vga-dac: Provide
 ddc symlink in connector sysfs directory
Date: Tue, 13 Aug 2019 11:33:32 +0200
Message-ID: <CAMuHMdXyGtogEfyFP1RnG2kM504WZ=nzfN_3z6rk4wJZqHaJQw@mail.gmail.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <ebb75e71b8b7c8d65d54a947a03fd21b8969fb3a.1564161140.git.andrzej.p@collabora.com>
 <20190808034208.GA31284@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190808034208.GA31284@roeck-us.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, DRI Development <dri-devel@lists.freedesktop.org>, Douglas Anderson <dianders@chromium.org>, linux-tegra <linux-tegra@vger.kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

SGkgR8O8bnRlciwKCk9uIFRodSwgQXVnIDgsIDIwMTkgYXQgNTo0MiBBTSBHdWVudGVyIFJvZWNr
IDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDA3
OjIzOjEzUE0gKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+IFVzZSB0aGUg
ZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+Cj4gVGhpcyBwYXRjaCByZXN1bHRzIGluIGEgY3Jhc2ggd2hlbiBydW5uaW5nIHFlbXU6
dmVyc2F0aWxlcGIuCj4KPiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMGM1Cj4gcGdkID0gKHB0cnZhbCkKPiBb
MDAwMDAwYzVdICpwZ2Q9MDAwMDAwMDAKPiBJbnRlcm5hbCBlcnJvcjogT29wczogNSBbIzFdIEFS
TQo+IE1vZHVsZXMgbGlua2VkIGluOgo+IENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlciBOb3Qg
dGFpbnRlZCA1LjMuMC1yYzErICMxCj4gSGFyZHdhcmUgbmFtZTogQVJNLVZlcnNhdGlsZSAoRGV2
aWNlIFRyZWUgU3VwcG9ydCkKPiBQQyBpcyBhdCBzeXNmc19kb19jcmVhdGVfbGlua19zZCsweDM4
LzB4ZDgKPiBMUiBpcyBhdCBzeXNmc19kb19jcmVhdGVfbGlua19zZCsweDM4LzB4ZDgKCj4gWzxj
MDFhYzk0Yz5dIChzeXNmc19kb19jcmVhdGVfbGlua19zZCkgZnJvbSBbPGMwNGM3ZmMwPl0gKGRy
bV9jb25uZWN0b3JfcmVnaXN0ZXIucGFydC4xKzB4NDAvMHhhMCkKPiBbPGMwNGM3ZmMwPl0gKGRy
bV9jb25uZWN0b3JfcmVnaXN0ZXIucGFydC4xKSBmcm9tIFs8YzA0Yzg3ZTA+XSAoZHJtX2Nvbm5l
Y3Rvcl9yZWdpc3Rlcl9hbGwrMHg5MC8weGI4KQo+IFs8YzA0Yzg3ZTA+XSAoZHJtX2Nvbm5lY3Rv
cl9yZWdpc3Rlcl9hbGwpIGZyb20gWzxjMDRjZWZjYz5dIChkcm1fbW9kZXNldF9yZWdpc3Rlcl9h
bGwrMHg0NC8weDZjKQo+IFs8YzA0Y2VmY2M+XSAoZHJtX21vZGVzZXRfcmVnaXN0ZXJfYWxsKSBm
cm9tIFs8YzA0YjRlYmM+XSAoZHJtX2Rldl9yZWdpc3RlcisweDE1Yy8weDFjMCkKPiBbPGMwNGI0
ZWJjPl0gKGRybV9kZXZfcmVnaXN0ZXIpIGZyb20gWzxjMDRkZjJmOD5dIChwbDExMV9hbWJhX3By
b2JlKzB4MmUwLzB4NGFjKQo+IFs8YzA0ZGYyZjg+XSAocGwxMTFfYW1iYV9wcm9iZSkgZnJvbSBb
PGMwNDVlOGQ4Pl0gKGFtYmFfcHJvYmUrMHg5Yy8weDExOCkKClNlZWluZyB0aGUgc2FtZSB0aGlu
ZyBvbiBTYWx2YXRvci1YUywgZHVlIHRvIHZnYS0+ZGRjIGJlaW5nIC1FTk9ERVYuCgo+ICMgZmly
c3QgYmFkIGNvbW1pdDogW2E0ZjkwODdlODVkZTE0MWU0ZTZkMjFhYzJjNTgzYWUwOTZjYzlhYmFd
IGRybS9icmlkZ2U6IGR1bWItdmdhLWRhYzogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0
b3Igc3lzZnMgZGlyZWN0b3J5CgpGaXggc2VudApodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTkwODEzMDkzMDQ2LjQ5NzYtMS1nZWVydCtyZW5lc2FzQGdsaWRlci5iZS8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
