From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 03/13] drm/exynos: Provide ddc symlink in connector's sysfs
Date: Fri, 8 Nov 2019 09:22:17 +0900
Message-ID: <79da80ba-aa5b-7c09-c702-df78a22a968c@samsung.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
 <CGME20190731165921epcas3p4cdba522c2fc78c188075427c064fea5e@epcas3p4.samsung.com>
 <613c1c09ff7db5be60ef86f930b45b3f56b4838d.1564591626.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <613c1c09ff7db5be60ef86f930b45b3f56b4838d.1564591626.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ramalingam C <ramalingam.c-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mamta Shukla <mamtashukla555-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Anthony Koo <Anthony.Koo-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "David
 (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Francis <David.Francis-5C7GfCeVMHo@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan
List-Id: linux-tegra@vger.kernel.org

CgoxOS4gOC4gMS4g7Jik7KCEIDE6NTjsl5AgQW5kcnplaiBQaWV0cmFzaWV3aWN6IOydtCjqsIAp
IOyTtCDquIA6Cj4gU3dpdGNoIHRvIHVzaW5nIHRoZSBkZGMgcHJvdmlkZWQgYnkgdGhlIGdlbmVy
aWMgY29ubmVjdG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8
YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29s
bGFib3JhLmNvbT4KCkFja2VkLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CgpU
aGFua3MsCklua2kgRGFlCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19o
ZG1pLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiBpbmRleCBi
YzE1NjVmMTgyMmEuLmQ0YTljOWUxNzQzNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19oZG1pLmMKPiBAQCAtOTQwLDggKzk0MCwxMCBAQCBzdGF0aWMgaW50IGhkbWlfY3JlYXRlX2Nv
bm5lY3RvcihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gIAljb25uZWN0b3ItPmludGVy
bGFjZV9hbGxvd2VkID0gdHJ1ZTsKPiAgCWNvbm5lY3Rvci0+cG9sbGVkID0gRFJNX0NPTk5FQ1RP
Ul9QT0xMX0hQRDsKPiAgCj4gLQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoaGRhdGEtPmRybV9k
ZXYsIGNvbm5lY3RvciwKPiAtCQkJJmhkbWlfY29ubmVjdG9yX2Z1bmNzLCBEUk1fTU9ERV9DT05O
RUNUT1JfSERNSUEpOwo+ICsJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGhkYXRh
LT5kcm1fZGV2LCBjb25uZWN0b3IsCj4gKwkJCQkJICAmaGRtaV9jb25uZWN0b3JfZnVuY3MsCj4g
KwkJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCj4gKwkJCQkJICBoZGF0YS0+ZGRjX2Fk
cHQpOwo+ICAJaWYgKHJldCkgewo+ICAJCURSTV9ERVZfRVJST1IoaGRhdGEtPmRldiwKPiAgCQkJ
ICAgICAgIkZhaWxlZCB0byBpbml0aWFsaXplIGNvbm5lY3RvciB3aXRoIGRybVxuIik7Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1yb2Nr
Y2hpcCBtYWlsaW5nIGxpc3QKTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCg==
