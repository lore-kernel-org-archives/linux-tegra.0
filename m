From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 7/9] gpu: host1x: add missing of_node_put
Date: Sat, 24 Oct 2015 16:42:33 +0200
Message-ID: <1445697755-26341-8-git-send-email-Julia.Lawall@lip6.fr>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Jason Cooper <jason@lakedaemon.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

Zm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSBwZXJmb3JtcyBhbiBvZl9ub2RlX2dldCBvbiBlYWNoIGl0
ZXJhdGlvbiwgc28KYSBicmVhayBvdXQgb2YgdGhlIGxvb3AgcmVxdWlyZXMgYW4gb2Zfbm9kZV9w
dXQuCgpBIHNpbXBsaWZpZWQgdmVyc2lvbiBvZiB0aGUgc2VtYW50aWMgcGF0Y2ggdGhhdCBmaXhl
cyB0aGlzIHByb2JsZW0gaXMgYXMKZm9sbG93cyAoaHR0cDovL2NvY2NpbmVsbGUubGlwNi5mcik6
CgovLyA8c21wbD4KQEAKZXhwcmVzc2lvbiByb290LGU7CmxvY2FsIGlkZXhwcmVzc2lvbiBjaGls
ZDsKQEAKCiBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKHJvb3QsIGNoaWxkKSB7CiAgIC4uLiB3aGVu
ICE9IG9mX25vZGVfcHV0KGNoaWxkKQogICAgICAgd2hlbiAhPSBlID0gY2hpbGQKKAogICByZXR1
cm4gY2hpbGQ7CnwKKyAgb2Zfbm9kZV9wdXQoY2hpbGQpOwo/ICByZXR1cm4gLi4uOwopCiAgIC4u
LgogfQovLyA8L3NtcGw+CgpTaWduZWQtb2ZmLWJ5OiBKdWxpYSBMYXdhbGwgPEp1bGlhLkxhd2Fs
bEBsaXA2LmZyPgoKLS0tCiBkcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMgfCAgICA0ICsrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMKaW5k
ZXggNGE5OWM2NC4uYzE3OTVhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwpAQCAtODIsOCArODIsMTAgQEAgc3RhdGlj
IGludCBob3N0MXhfZGV2aWNlX3BhcnNlX2R0KHN0cnVjdCBob3N0MXhfZGV2aWNlICpkZXZpY2Us
CiAJCWlmIChvZl9tYXRjaF9ub2RlKGRyaXZlci0+c3ViZGV2cywgbnApICYmCiAJCSAgICBvZl9k
ZXZpY2VfaXNfYXZhaWxhYmxlKG5wKSkgewogCQkJZXJyID0gaG9zdDF4X3N1YmRldl9hZGQoZGV2
aWNlLCBucCk7Ci0JCQlpZiAoZXJyIDwgMCkKKwkJCWlmIChlcnIgPCAwKSB7CisJCQkJb2Zfbm9k
ZV9wdXQobnApOwogCQkJCXJldHVybiBlcnI7CisJCQl9CiAJCX0KIAl9CiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
