From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 12/22] drm/tegra: Probe dpaux devices on demand
Date: Tue, 28 Jul 2015 15:19:43 +0200
Message-ID: <1438089593-7696-13-git-send-email-tomeu.vizoso@collabora.com>
References: <1438089593-7696-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1438089593-7696-1-git-send-email-tomeu.vizoso@collabora.com>
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, linux-acpi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

V2hlbiBsb29raW5nIHVwIGEgZHBhdXggZGV2aWNlIHRocm91Z2ggaXRzIGZpcm13YXJlIG5vZGUs
IHByb2JlIGl0IGlmIGl0Cmhhc24ndCBhbHJlYWR5LgoKVGhlIGdvYWwgaXMgdG8gcmVkdWNlIGRl
ZmVycmVkIHByb2JlcyB0byBhIG1pbmltdW0sIGFzIGl0IG1ha2VzIGl0IHZlcnkKY3VtYmVyc29t
ZSB0byBmaW5kIG91dCB3aHkgYSBkZXZpY2UgZmFpbGVkIHRvIHByb2JlLCBhbmQgY2FuIGludHJv
ZHVjZQp2ZXJ5IGJpZyBkZWxheXMgaW4gd2hlbiBhIGNyaXRpY2FsIGRldmljZSBpcyBwcm9iZWQu
CgpTaWduZWQtb2ZmLWJ5OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29t
PgotLS0KCkNoYW5nZXMgaW4gdjI6IE5vbmUKCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXgu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1
eC5jCmluZGV4IDA3YjI2OTcyZjQ4Ny4uOWE3OTMxNThhNTcxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvZHBhdXguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXgu
YwpAQCAtMzk0LDYgKzM5NCw4IEBAIHN0cnVjdCB0ZWdyYV9kcGF1eCAqdGVncmFfZHBhdXhfZmlu
ZF9ieV9vZl9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiB7CiAJc3RydWN0IHRlZ3JhX2Rw
YXV4ICpkcGF1eDsKIAorCWZ3bm9kZV9lbnN1cmVfZGV2aWNlKCZucC0+Zndub2RlKTsKKwogCW11
dGV4X2xvY2soJmRwYXV4X2xvY2spOwogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShkcGF1eCwgJmRw
YXV4X2xpc3QsIGxpc3QpCi0tIAoyLjQuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
