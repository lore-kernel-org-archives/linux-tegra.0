From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/12] gpu: host1x: Clean up debugfs on removal
Date: Mon, 28 Oct 2019 13:37:10 +0100
Message-ID: <20191028123718.3890217-5-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>, dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkZWJ1Z2ZzIGZp
bGVzIGNyZWF0ZWQgZm9yIGhvc3QxeCBhcmUgbmV2ZXIgcmVtb3ZlZCwgY2F1c2luZyB0aGVzZQpm
aWxlcyB0byBiZSBsZWZ0IGRhbmdsaW5nIGluIGRlYnVnZnMuIFRoaXMgcmVzdWx0cyBpbiBhIGNy
YXNoIHdoZW4gYW55Cm9mIHRoZXNlIGZpbGVzIGFyZSBhY2Nlc3NlZCBhZnRlciB0aGUgaG9zdDF4
IGRyaXZlciBoYXMgYmVlbiByZW1vdmVkLAphcyB3ZWxsIGFzIGEgZmFpbHVyZSB0byBjcmVhdGUg
dGhlIGRlYnVnZnMgZW50cmllcyB3aGVuIHRoZXkgYXJlIGFkZGVkCmFnYWluIG9uIGRyaXZlciBw
cm9iZS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMgYi9kcml2
ZXJzL2dwdS9ob3N0MXgvZGV2LmMKaW5kZXggNDUyZWU1ZDY0MDIxLi5mMzBiODQ0N2EzMTkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0
MXgvZGV2LmMKQEAgLTQwMiw2ICs0MDIsNyBAQCBzdGF0aWMgaW50IGhvc3QxeF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgaG9zdDF4ICpob3N0ID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7CiAKIAlob3N0MXhfdW5yZWdpc3Rlcihob3N0KTsKKwlob3N0
MXhfZGVidWdfZGVpbml0KGhvc3QpOwogCWhvc3QxeF9pbnRyX2RlaW5pdChob3N0KTsKIAlob3N0
MXhfc3luY3B0X2RlaW5pdChob3N0KTsKIAlyZXNldF9jb250cm9sX2Fzc2VydChob3N0LT5yc3Qp
OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
