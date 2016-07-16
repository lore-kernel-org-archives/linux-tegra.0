From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] drm/tegra: Delete an unnecessary check before the function
 call "vunmap"
Date: Sat, 16 Jul 2016 07:30:33 +0200
Message-ID: <b3fbdcaf-1bda-7ce9-935b-2d716727ec39@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D335FA.6020101@users.sourceforge.net>
 <559D6E90.1040005@users.sourceforge.net>
 <CAAVeFu+7cF-b0zneA7BTmNcanH9tnbzV32XOFiCbxnK4kz8buw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFu+7cF-b0zneA7BTmNcanH9tnbzV32XOFiCbxnK4kz8buw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Alexandre Courbot <gnurou@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDE2IEp1bCAyMDE2IDA3OjIzOjQyICswMjAwCgpUaGUgdnVubWFwKCkgZnVuY3Rpb24g
cGVyZm9ybXMgYWxzbyBpbnB1dCBwYXJhbWV0ZXIgdmFsaWRhdGlvbi4KVGh1cyB0aGUgdGVzdCBh
cm91bmQgdGhlIGNhbGwgaXMgbm90IG5lZWRlZC4KClRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5
IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2lnbmVkLW9mZi1ieTogTWFya3VzIEVs
ZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9mYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZmIuYwppbmRleCAxYjEyYWE3Li5lNmQ3MWZhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZmIuYwpAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9mYl9kZXN0cm95KHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZyYW1lYnVmZmVyKQogCQlzdHJ1Y3QgdGVncmFfYm8gKmJvID0g
ZmItPnBsYW5lc1tpXTsKIAogCQlpZiAoYm8pIHsKLQkJCWlmIChiby0+cGFnZXMgJiYgYm8tPnZh
ZGRyKQorCQkJaWYgKGJvLT5wYWdlcykKIAkJCQl2dW5tYXAoYm8tPnZhZGRyKTsKIAogCQkJZHJt
X2dlbV9vYmplY3RfdW5yZWZlcmVuY2VfdW5sb2NrZWQoJmJvLT5nZW0pOwotLSAKMi45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
