From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] GPU-host1x: Use a signed return type for do_relocs()
Date: Sat, 19 Dec 2015 12:56:54 +0100
Message-ID: <56754606.6060201@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDE5IERlYyAyMDE1IDEyOjQ4OjMxICswMTAwCgpUaGUgcmV0dXJuIHR5cGUgInVuc2ln
bmVkIGludCIgd2FzIHVzZWQgYnkgdGhlIGRvX3JlbG9jcygpIGZ1bmN0aW9uCmRlc3BpdGUgb2Yg
dGhlIGFzcGVjdCB0aGF0IGl0IHdpbGwgZXZlbnR1YWxseSByZXR1cm4gYSBuZWdhdGl2ZSBlcnJv
ciBjb2RlLgpJbXByb3ZlIHRoaXMgaW1wbGVtZW50YXRpb24gZGV0YWlsIGJ5IGRlbGV0aW9uIG9m
IHRoZSB0eXBlIHF1YWxpZmllciB0aGVuLgoKVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNp
bmcgdGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmlu
ZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4
L2pvYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2pvYi5jIGIvZHJpdmVycy9ncHUv
aG9zdDF4L2pvYi5jCmluZGV4IDYzYmQ2M2YuLjE5MTlhYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2hvc3QxeC9qb2IuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMKQEAgLTIyNSw3
ICsyMjUsNyBAQCB1bnBpbjoKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIHVuc2lnbmVkIGludCBk
b19yZWxvY3Moc3RydWN0IGhvc3QxeF9qb2IgKmpvYiwgc3RydWN0IGhvc3QxeF9ibyAqY21kYnVm
KQorc3RhdGljIGludCBkb19yZWxvY3Moc3RydWN0IGhvc3QxeF9qb2IgKmpvYiwgc3RydWN0IGhv
c3QxeF9ibyAqY21kYnVmKQogewogCWludCBpID0gMDsKIAl1MzIgbGFzdF9wYWdlID0gfjA7Ci0t
IAoyLjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
