From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] drm/core: Remove drm_dev_unref() and it's
 uses
Date: Thu, 26 Apr 2018 14:15:59 +0200
Message-ID: <20180426141559.6811127b@bbrezillon>
References: <20180426102819.6985-1-vthakkar1994@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20180426102819.6985-1-vthakkar1994@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, alexandre.belloni@bootlin.com, heiko@sntech.de, airlied@linux.ie, linus.walleij@linaro.org, stefan@agner.ch, hjc@rock-chips.com, kraxel@redhat.com, benjamin.gaignard@linaro.org, nouveau@lists.freedesktop.org, marex@denx.de, David1.Zhou@amd.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com, linux@armlinux.org.uk, krzk@kernel.org, jonathanh@nvidia.com, z.liuxinliang@hisilicon.com, maxime.ripard@bootlin.com, kong.kongxinwei@hisilicon.com, kgene@kernel.org, bskeggs@redhat.com, linux-arm-msm@vger.kernel.org, ck.hu@mediatek.com, airlied@redhat.com, virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org, puck.chen@hisilicon.com, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, brodkin@synopsys.com, zourongrong@gmail.com, dri-devel@lists.free
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyNiBBcHIgMjAxOCAxNTo1ODoxOSArMDUzMApWYWlzaGFsaSBUaGFra2FyIDx2dGhh
a2thcjE5OTRAZ21haWwuY29tPiB3cm90ZToKCj4gSXQncyBiZWVuIGEgd2hpbGUgc2luY2Ugd2Ug
aW50cm9kdWNlZCBkcm1fZGV2e2dldC9wdXR9IGZ1bmN0aW9ucwo+IHRvIHJlcGxhY2UgcmVmZXJl
bmNlL3VucmVmZXJlbmNlIGluIGRybSBzdWJzeXN0ZW0gZm9yIHRoZQo+IGNvbnNpc3RlbmN5IHB1
cnBvc2UuIFNvLCB3aXRoIHRoaXMgcGF0Y2gsIGxldCdzIGp1c3QgcmVwbGFjZQo+IGFsbCBjdXJy
ZW50IHVzZSBjYXNlcyBvZiBkcm1fZGV2X3VucmVmKCkgd2l0aCBkcm1fZGV2X3B1dCBhbmQgcmVt
b3ZlCj4gdGhlIGZ1bmN0aW9uIGl0c2VsZi4KPiAKPiBDb2NjaW5lbGxlIHdhcyB1c2VkIGZvciBt
YXNzLXBhdGNoaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZhaXNoYWxpIFRoYWtrYXIgPHZ0aGFr
a2FyMTk5NEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJjL2Fy
Y3BndV9kcnYuYyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FybWFkYS9hcm1hZGFfZHJ2LmMgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgICAgICAgfCAgNCArKy0tCgpG
b3IgYXRtZWwtaGxjZGM6CgpBY2tlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AYm9vdGxpbi5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
