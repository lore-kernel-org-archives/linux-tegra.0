From: Dave Airlie <airlied@gmail.com>
Subject: Re: [Intel-gfx] [PATCH libdrm] drm: Remove create_handle()
 drm_framebuffer "virtual".
Date: Wed, 9 Aug 2017 09:50:05 +1000
Message-ID: <CAPM=9tzQuont4B9ybMXEDpqP583V_G64ypCR4E+zGvxLGdTULw@mail.gmail.com>
References: <20170808234237.62051-1-djmk@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170808234237.62051-1-djmk@google.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joe Kniss <djmk@chromium.org>
Cc: Edward O'Callaghan <funfunctor@folklore1984.net>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>, baoyou.xie@linaro.org, Alex Xie <AlexBin.Xie@amd.com>, "StDenis, Tom" <tom.stdenis@amd.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, krzk@kernel.org, jonathanh@nvidia.com, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Alexandre Demers <alexandre.f.demers@gmai>
List-Id: linux-tegra@vger.kernel.org

T24gOSBBdWd1c3QgMjAxNyBhdCAwOTo0MiwgSm9lIEtuaXNzIDxkam1rQGNocm9taXVtLm9yZz4g
d3JvdGU6Cj4gQmVjYXVzZSBhbGwgZHJpdmVycyBjdXJyZW50bHkgdXNlIGdlbSBvYmplY3RzIGZv
ciBmcmFtZWJ1ZmZlciBwbGFuZXMsCj4gdGhlIHZpcnR1YWwgY3JlYXRlX2hhbmRsZSgpIGlzIG5v
dCByZXF1aXJlZC4gIFRoaXMgY2hhbmdlIGFkZHMgYQo+IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
Z2Vtc1s0XSBmaWVsZCB0byBkcm1fZnJhbWVidWZmZXIgYW5kIHJlbW92ZXMKPiBjcmVhdGVfaGFu
ZGxlKCkgZnVuY3Rpb24gcG9pbnRlciBmcm9tIGRybV9mcmFtZWJ1ZmZlcl9mdW5jcy4gIFRoZQo+
IGNvcnJlc3BvbmRpbmcgKl9jcmVhdGVfaGFuZGxlKCkgZnVuY3Rpb24gaXMgcmVtb3ZlZCBmcm9t
IGVhY2ggZHJpdmVyLgo+Cj4gSW4gbWFueSBjYXNlcyB0aGlzIGNoYW5nZSBlbGltaW5hdGVzIGEg
c3RydWN0ICpfZnJhbWVidWZmZXIgb2JqZWN0LAo+IGFzIHRoZSBvbmx5IG5lZWQgZm9yIHRoZSBk
ZXJpdmVkIHN0cnVjdCBpcyB0aGUgYWRkaXRpb24gb2YgdGhlIGdlbQo+IG9iamVjdCBwb2ludGVy
LgoKV2h5IHRoZSBsaWJkcm0gaW4gdGhlIHRhZz8gdGhpcyBpc24ndCBmb3IgbGliZHJtLgoKVGhp
cyB3aWxsIGJyZWFrIGRyaXZlcnMgdGhhdCBkb24ndCBjdXJyZW50IGltcGxlbWVudCB0aGUgdmly
dHVhbCBhdCBhbGwuCgpJIHRoaW5rIHZ3bWdmeC4KClRoZSBjdXJyZW50IGNvZGUgY2hlY2tzIGlm
IHRoZSB2aXJ0dWFsIGlzIHRoZXJlIGJlZm9yZSBjYWxsbmcgaXQsIHRoaXMgY29kZQpqdXN0IGNh
bGxzIHRoZSBnZW0gY29kZSBhbHdheXMuCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
