From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/tegra: bad irqsave/restore in tegra_dc_finish_page_flip()
Date: Wed, 7 Jan 2015 14:01:26 +0300
Message-ID: <20150107110126.GA14864@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-tegra@vger.kernel.org

V2UgY2FuJ3Qgc2F2ZSB0d28gdmFsdWVzIHRvIHRoZSBJUlEgZmxhZ3MgYXQgdGhlIHNhbWUgdGlt
ZSBzbyB0aGUgSVJRcwphcmUgbm90IGVuYWJsZWQgYXQgdGhlIGVuZC4gIFRoaXMga2luZCBvZiBi
dWcgaXMgZWFzeSB0byBtaXNzIGluIHRlc3RpbmcKaWYgdGhlIGZ1bmN0aW9uIGlzIG5vcm1hbGx5
IGNhbGxlZCB3aXRoIElSUXMgZGlzYWJsZWQgc28gd2Ugd291bGRuJ3QKZW5hYmxlIElSUXMgYW55
d2F5LgoKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RjLmMKaW5kZXggYWUyNmNjMC4uYzc0NjE2MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMK
QEAgLTgzOCw3ICs4MzgsNyBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9kY19maW5pc2hfcGFnZV9mbGlw
KHN0cnVjdCB0ZWdyYV9kYyAqZGMpCiAKIAlibyA9IHRlZ3JhX2ZiX2dldF9wbGFuZShjcnRjLT5w
cmltYXJ5LT5mYiwgMCk7CiAKLQlzcGluX2xvY2tfaXJxc2F2ZSgmZGMtPmxvY2ssIGZsYWdzKTsK
KwlzcGluX2xvY2soJmRjLT5sb2NrKTsKIAogCS8qIGNoZWNrIGlmIG5ldyBzdGFydCBhZGRyZXNz
IGhhcyBiZWVuIGxhdGNoZWQgKi8KIAl0ZWdyYV9kY193cml0ZWwoZGMsIFdJTkRPV19BX1NFTEVD
VCwgRENfQ01EX0RJU1BMQVlfV0lORE9XX0hFQURFUik7CkBAIC04NDYsNyArODQ2LDcgQEAgc3Rh
dGljIHZvaWQgdGVncmFfZGNfZmluaXNoX3BhZ2VfZmxpcChzdHJ1Y3QgdGVncmFfZGMgKmRjKQog
CWJhc2UgPSB0ZWdyYV9kY19yZWFkbChkYywgRENfV0lOQlVGX1NUQVJUX0FERFIpOwogCXRlZ3Jh
X2RjX3dyaXRlbChkYywgMCwgRENfQ01EX1NUQVRFX0FDQ0VTUyk7CiAKLQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZkYy0+bG9jaywgZmxhZ3MpOworCXNwaW5fdW5sb2NrKCZkYy0+bG9jayk7CiAK
IAlpZiAoYmFzZSA9PSBiby0+cGFkZHIgKyBjcnRjLT5wcmltYXJ5LT5mYi0+b2Zmc2V0c1swXSkg
ewogCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBkYy0+ZXZlbnQpOwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
