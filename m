From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/4] drm/tegra: gr2d: Properly clean up resources
Date: Mon, 7 May 2018 23:57:35 +0300
Message-ID: <e8ec9684-43f1-81cb-614b-76f1d756d9c0@gmail.com>
References: <20180504133707.22451-1-thierry.reding@gmail.com>
 <20180504133707.22451-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504133707.22451-2-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

T24gMDQuMDUuMjAxOCAxNjozNywgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gRnJvbTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBGYWlsdXJlIHRvIHJlZ2lzdGVyIHRo
ZSBUZWdyYSBEUk0gY2xpZW50IHdvdWxkIGxlYWsgdGhlIHJlc291cmNlcy4gTW92ZQo+IGNsZWFu
dXAgY29kZSB0byBlcnJvciB1bndpbmRpbmcgZ290b3MgdG8gZml4IHRoYXQgYW5kIHNoYXJlIHRo
ZSBjbGVhbnVwCj4gY29kZSB3aXRoIHRoZSBvdGhlciBlcnJvciBwYXRocy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZ3IyZC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dyMmQuYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9ncjJkLmMKPiBpbmRleCA4ZWI1MzBhODVkZDAuLjBiNDJlOTlkYThhZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ3IyZC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2dyMmQuYwo+IEBAIC00Miw4ICs0Miw5IEBAIHN0YXRpYyBpbnQgZ3IyZF9p
bml0KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCj4gIAo+ICAJY2xpZW50LT5zeW5jcHRz
WzBdID0gaG9zdDF4X3N5bmNwdF9yZXF1ZXN0KGNsaWVudCwgZmxhZ3MpOwo+ICAJaWYgKCFjbGll
bnQtPnN5bmNwdHNbMF0pIHsKPiAtCQlob3N0MXhfY2hhbm5lbF9wdXQoZ3IyZC0+Y2hhbm5lbCk7
Cj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gKwkJZXJyID0gLUVOT01FTTsKPiArCQlkZXZfZXJyKGNs
aWVudC0+ZGV2LCAiZmFpbGVkIHRvIHJlcXVlc3Qgc3luY3BvaW50OiAlZFxuIiwgZXJyKTsKCk5p
dDogWW91IGNvdWxkIGFkZCB0aGUgc2FtZSBlcnJvciBtZXNzYWdlIHRvIHRoZSBncjNkIHBhdGNo
IGZvciBjb25zaXN0ZW5jeS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
