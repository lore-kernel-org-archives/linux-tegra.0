From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] host1x: debugfs_create_dir() can never return NULL
Date: Thu, 13 Jun 2019 13:45:22 +0200
Message-ID: <20190613114522.GB13119@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
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

U28gdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayBmb3IgYSB2YWx1ZSB0aGF0IGNhbiBuZXZlciBo
YXBwZW4uICBObyBuZWVkCnRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgYWxsIGFueXdheSwgYXMg
YW55IGRlYnVnZnMgY2FsbCBjYW4gdGFrZSB0aGUKcmVzdWx0IG9mIHRoaXMgZnVuY3Rpb24gYXMg
YW4gb3B0aW9uIGp1c3QgZmluZS4KCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgt
dGVncmFAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVn
LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYwpp
bmRleCAzMjllNGEzZDhhZTcuLjZjNWVlM2UzOWRjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
aG9zdDF4L2RlYnVnLmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMKQEAgLTE3MSw5
ICsxNzEsNiBAQCBzdGF0aWMgdm9pZCBob3N0MXhfZGVidWdmc19pbml0KHN0cnVjdCBob3N0MXgg
Kmhvc3QxeCkKIHsKIAlzdHJ1Y3QgZGVudHJ5ICpkZSA9IGRlYnVnZnNfY3JlYXRlX2RpcigidGVn
cmEtaG9zdDF4IiwgTlVMTCk7CiAKLQlpZiAoIWRlKQotCQlyZXR1cm47Ci0KIAkvKiBTdG9yZSB0
aGUgY3JlYXRlZCBlbnRyeSAqLwogCWhvc3QxeC0+ZGVidWdmcyA9IGRlOwogCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
