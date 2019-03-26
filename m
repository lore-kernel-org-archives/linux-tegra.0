From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 18/21] drm/tegra: Use drm_fb_helper_fill_info
Date: Tue, 26 Mar 2019 15:53:51 +0100
Message-ID: <8897355d-b144-7535-c11c-fc79fd2c1872@tronnes.org>
References: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
 <20190326132008.11781-18-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190326132008.11781-18-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

CgpEZW4gMjYuMDMuMjAxOSAxNC4yMCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBBbm90aGVyIGRy
aXZlciB0aGF0IGRpZG4ndCBzZXQgZmJpbmZvLT5maXguaWQgYmVmb3JlLgo+IAo+IHYyOiBGaXgg
c3ViamVjdCBhbmQgcmViYXNlCj4gCj4gQWNrZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5j
b20+Cj4gQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4gQ2M6IGxp
bnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZwo+IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4
bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
