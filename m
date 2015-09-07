From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v4 10/22] drm/tegra: Probe dpaux devices on demand
Date: Mon,  7 Sep 2015 14:23:35 +0200
Message-ID: <1441628627-5143-11-git-send-email-tomeu.vizoso@collabora.com>
References: <1441628627-5143-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1441628627-5143-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, linux-acpi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

V2hlbiBsb29raW5nIHVwIGEgZHBhdXggZGV2aWNlIHRocm91Z2ggaXRzIE9GIG5vZGUsIHByb2Jl
IGl0IGlmIGl0Cmhhc24ndCBhbHJlYWR5LgoKVGhlIGdvYWwgaXMgdG8gcmVkdWNlIGRlZmVycmVk
IHByb2JlcyB0byBhIG1pbmltdW0sIGFzIGl0IG1ha2VzIGl0IHZlcnkKY3VtYmVyc29tZSB0byBm
aW5kIG91dCB3aHkgYSBkZXZpY2UgZmFpbGVkIHRvIHByb2JlLCBhbmQgY2FuIGludHJvZHVjZQp2
ZXJ5IGJpZyBkZWxheXMgaW4gd2hlbiBhIGNyaXRpY2FsIGRldmljZSBpcyBwcm9iZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgotLS0K
CkNoYW5nZXMgaW4gdjQ6IE5vbmUKQ2hhbmdlcyBpbiB2MzogTm9uZQpDaGFuZ2VzIGluIHYyOiBO
b25lCgogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMgfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
cGF1eC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmMKaW5kZXggMjI0YTdkYzhlNGVk
Li45NmEyZWVjN2UwMjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jCkBAIC0xMiw2ICsxMiw3IEBACiAj
aW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4KICNpbmNs
dWRlIDxsaW51eC9vZl9ncGlvLmg+CisjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CiAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4K
ICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KQEAgLTQzOSw2ICs0NDAsOCBA
QCBzdHJ1Y3QgdGVncmFfZHBhdXggKnRlZ3JhX2RwYXV4X2ZpbmRfYnlfb2Zfbm9kZShzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wKQogewogCXN0cnVjdCB0ZWdyYV9kcGF1eCAqZHBhdXg7CiAKKwlvZl9k
ZXZpY2VfcHJvYmUobnApOworCiAJbXV0ZXhfbG9jaygmZHBhdXhfbG9jayk7CiAKIAlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGRwYXV4LCAmZHBhdXhfbGlzdCwgbGlzdCkKLS0gCjIuNC4zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
