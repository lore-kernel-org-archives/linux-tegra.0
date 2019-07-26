From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 00/24] Associate ddc adapters with connectors
Date: Fri, 26 Jul 2019 20:35:20 +0200
Message-ID: <20190726183520.GA22572@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Mamta Shukla <mamtashukla555@gmail.>
List-Id: linux-tegra@vger.kernel.org

SGkgQW5kZXplai4KCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDA3OjIyOjU0UE0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBJdCBpcyBkaWZmaWN1bHQgZm9yIGEgdXNlciB0
byBrbm93IHdoaWNoIG9mIHRoZSBpMmMgYWRhcHRlcnMgaXMgZm9yIHdoaWNoCj4gZHJtIGNvbm5l
Y3Rvci4gVGhpcyBzZXJpZXMgYWRkcmVzc2VzIHRoaXMgcHJvYmxlbS4KPiAKPiBUaGUgaWRlYSBp
cyB0byBoYXZlIGEgc3ltYm9saWMgbGluayBpbiBjb25uZWN0b3IncyBzeXNmcyBkaXJlY3Rvcnks
IGUuZy46Cj4gCj4gbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjCj4gbHJ3
eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1I
RE1JLUEtMS9kZGMgXAo+IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCj4g
Cj4gVGhlIHVzZXIgdGhlbiBrbm93cyB0aGF0IHRoZWlyIGNhcmQwLUhETUktQS0xIHVzZXMgaTJj
LTIgYW5kIGNhbiBlLmcuIHJ1bgo+IGRkY3V0aWw6Cj4gCj4gZGRjdXRpbCAtYiAyIGdldHZjcCAw
eDEwCj4gVkNQIGNvZGUgMHgxMCAoQnJpZ2h0bmVzcyk6IGN1cnJlbnQgdmFsdWUgPSAgICA5MCwg
bWF4IHZhbHVlID0gICAxMDAKPiAKPiBUaGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcyBhZGRz
IHN0cnVjdCBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdAo+IGRybV9jb25uZWN0b3IuIElm
IHRoZSBmaWVsZCBpcyB1c2VkIGJ5IGEgcGFydGljdWxhciBkcml2ZXIsIHRoZW4gYW4KPiBhcHBy
b3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgYnkgdGhlIGdlbmVyaWMgY29kZSwgd2hp
Y2ggaXMgYWxzbyBhZGRlZAo+IGJ5IHRoaXMgcGF0Y2guCj4gCj4gUGF0Y2ggMiBhZGRzIGEgbmV3
IHZhcmlhbnQgb2YgZHJtX2Nvbm5lY3Rvcl9pbml0KCksIHNlZSB0aGUgY2hhbmdlbG9nCj4gYmVs
b3cuCj4gCj4gUGF0Y2hlcyAzLi4yNCBhcmUgZXhhbXBsZXMgb2YgaG93IHRvIGNvbnZlcnQgYSBk
cml2ZXIgdG8gdGhpcyBuZXcgc2NoZW1lLgo+IAouLi4KPiAKPiB2NS4udjY6Cj4gCj4gLSBpbXBy
b3ZlZCBzdWJqZWN0IGxpbmUgb2YgcGF0Y2ggMQo+IC0gYWRkZWQga2VybmVsLWRvYyBmb3IgZHJt
X2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkKPiAtIGltcHJvdmVkIGtlcm5lbC1kb2MgZm9yIHRo
ZSBkZGMgZmllbGQgb2Ygc3RydWN0IGRybV9jb25uZWN0b3IKPiAtIGFkZGVkIFJldmlld2VkLWJ5
IGluIHBhdGNoZXMgMTcgYW5kIDE4Cj4gLSBhZGRlZCBBY2tlZC1ieSBpbiBwYXRjaCAyCj4gLSBt
YWRlIHRoZSBvd25lcnNoaXAgb2YgZGRjIGkyY19hZGFwdGVyIGV4cGxpY2l0IGluIGFsbCBwYXRj
aGVzLAo+IHRoaXMgbWFkZSB0aGUgYWZmZWN0ZWQgcGF0Y2hlcyBtdWNoIHNpbXBsZXIKCkxvb2tz
IGdvb2Qgbm93LgpQYXRjaCAxIGFuZCAyIGFyZToKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KClRoZSByZW1haW5pbmcgcGF0Y2hlcyBhcmU6CkFja2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoJU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
