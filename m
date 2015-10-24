From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 5/9] drm/tegra: dc: add missing of_node_put
Date: Sat, 24 Oct 2015 16:42:31 +0200
Message-ID: <1445697755-26341-6-git-send-email-Julia.Lawall@lip6.fr>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, linux-tegra@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

Zm9yX2VhY2hfbWF0Y2hpbmdfbm9kZSBwZXJmb3JtcyBhbiBvZl9ub2RlX2dldCBvbiBlYWNoIGl0
ZXJhdGlvbiwgc28KYSBicmVhayBvdXQgb2YgdGhlIGxvb3AgcmVxdWlyZXMgYW4gb2Zfbm9kZV9w
dXQuCgpBIHNpbXBsaWZpZWQgdmVyc2lvbiBvZiB0aGUgc2VtYW50aWMgcGF0Y2ggdGhhdCBmaXhl
cyB0aGlzIHByb2JsZW0gaXMgYXMKZm9sbG93cyAoaHR0cDovL2NvY2NpbmVsbGUubGlwNi5mcik6
CgovLyA8c21wbD4KQEAKbG9jYWwgaWRleHByZXNzaW9uIG47CmV4cHJlc3Npb24gZTsKQEAKCiBm
b3JfZWFjaF9tYXRjaGluZ19ub2RlKG4sLi4uKSB7CiAgIC4uLgooCiAgIG9mX25vZGVfcHV0KG4p
Owp8CiAgIGUgPSBuCnwKKyAgb2Zfbm9kZV9wdXQobik7Cj8gIGJyZWFrOwopCiAgIC4uLgogfQou
Li4gd2hlbiAhPSBuCi8vIDwvc21wbD4KClNpZ25lZC1vZmYtYnk6IEp1bGlhIExhd2FsbCA8SnVs
aWEuTGF3YWxsQGxpcDYuZnI+CgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIHwgICAg
NCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYwppbmRleCBiNGFmNGFiLi5mMGU2ZjM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMTk0
NSw4ICsxOTQ1LDEwIEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfcGFyc2VfZHQoc3RydWN0IHRlZ3Jh
X2RjICpkYykKIAkJICogY2FzZXMgd2hlcmUgb25seSBhIHNpbmdsZSBkaXNwbGF5IGNvbnRyb2xs
ZXIgaXMgdXNlZC4KIAkJICovCiAJCWZvcl9lYWNoX21hdGNoaW5nX25vZGUobnAsIHRlZ3JhX2Rj
X29mX21hdGNoKSB7Ci0JCQlpZiAobnAgPT0gZGMtPmRldi0+b2Zfbm9kZSkKKwkJCWlmIChucCA9
PSBkYy0+ZGV2LT5vZl9ub2RlKSB7CisJCQkJb2Zfbm9kZV9wdXQobnApOwogCQkJCWJyZWFrOwor
CQkJfQogCiAJCQl2YWx1ZSsrOwogCQl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
