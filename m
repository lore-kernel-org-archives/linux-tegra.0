From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 26/26] drm/<drivers>: Don't set
 FBINFO_(FLAG_)DEFAULT
Date: Tue, 29 Jan 2019 10:58:34 +0100
Message-ID: <20190129095834.GP3271@phenom.ffwll.local>
References: <20190124165831.16427-1-daniel.vetter@ffwll.ch>
 <20190124165831.16427-27-daniel.vetter@ffwll.ch>
 <CACvgo52YJ0kSBVJryELvZn70--4rbPr7R=TJdRgbVr1fEVr2yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CACvgo52YJ0kSBVJryELvZn70--4rbPr7R=TJdRgbVr1fEVr2yw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip <linux-rockchip@lists.infradead.org>, Kukjin Kim <kgene@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-tegra@vger.kernel.org, LAKML <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDM6MDI6NDZQTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIFRodSwgMjQgSmFuIDIwMTkgYXQgMTc6MDAsIERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IEl0J3MgMC4KPiA+Cj4gSSdkIGFkZCBh
IGJpdCBtb3JlIGluZm9ybWF0aW9uIGhlcmUuIEZlZWwgZnJlZSB0byByZXVzZSBhcyBtdWNoL2xp
dHRsZQo+IG9mIHRoZSBmb2xsb3dpbmc6Cj4gCj4gQm90aCBtYWNyb3MgZXZhbHVhdGUgdG8gMC4g
QXQgdGhlIHNhbWUgdGltZSBmbGFnIGlzIGFscmVhZHkgc2V0IHRvCj4gemVybyBzaW5jZSB0aGUg
c3RydWN0IGlzIGt6YWxsb2MnZCBpbiBmcmFtZWJ1ZmZlcl9hbGxvYygpLgo+IEFzIGNhbGxlZCBi
eSBkcm1fZmJfaGVscGVyX2FsbG9jX2ZiaSgpIGluIHRoZSBEUk0gZHJpdmVycy4KCkFkZGVkJm1l
cmdlZCwgdGhhbmtzIGZvciB5b3VyIHJldmlldy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
