From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH -next] drm/tegra: sor: Fix invalid kfree of devm_kzalloc
 allocated data
Date: Thu, 7 Jul 2016 13:24:04 +0900
Message-ID: <CAAVeFuKwWy3F-4oizsATCRtT+XMqWAgzy-CTagAXUX7b69n9ww@mail.gmail.com>
References: <1467616759-14502-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467616759-14502-1-git-send-email-weiyj_lk@163.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: weiyj_lk@163.com
Cc: Stephen Warren <swarren@wwwdotorg.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBKdWwgNCwgMjAxNiBhdCA0OjE5IFBNLCAgPHdlaXlqX2xrQDE2My5jb20+IHdyb3Rl
Ogo+IEZyb206IFdlaSBZb25nanVuIDx5b25nanVuX3dlaUB0cmVuZG1pY3JvLmNvbS5jbj4KPgo+
IGRhdGEgYWxsb2NhdGVkIHdpdGggZGV2bV9remFsbG9jIHNob3VsZCBub3QgYmUgZnJlZWQgdXNp
bmcga2ZyZWUsCj4gYmVjYXVzZSBkb2luZyBzbyBjYXVzZXMgYSBkYW5nbGluZyBwb2ludGVyLCBh
bmQgYSBzdWJzZXF1ZW50Cj4gZG91YmxlIGZyZWUsIHVzZSBkZXZtX2tmcmVlIGluc3RlYWQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8eW9uZ2p1bl93ZWlAdHJlbmRtaWNyby5jb20u
Y24+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5j
Cj4gaW5kZXggODQyNWVkYS4uYWY5ODU4NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvc29yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKPiBAQCAtMzYz
LDcgKzM2Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrICp0ZWdyYV9jbGtfc29yX2JyaWNrX3JlZ2lz
dGVyKHN0cnVjdCB0ZWdyYV9zb3IgKnNvciwKPgo+ICAgICAgICAgY2xrID0gZGV2bV9jbGtfcmVn
aXN0ZXIoc29yLT5kZXYsICZicmljay0+aHcpOwo+ICAgICAgICAgaWYgKElTX0VSUihjbGspKQo+
IC0gICAgICAgICAgICAgICBrZnJlZShicmljayk7Cj4gKyAgICAgICAgICAgICAgIGRldm1fa2Zy
ZWUoc29yLT5kZXYsIGJyaWNrKTsKPgo+ICAgICAgICAgcmV0dXJuIGNsazsKPiAgfQoKRGFuIHNl
bnQgYW5vdGhlciBmaXggZm9yIHRoaXM6CgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNi83LzQv
ODMKCkkgdGVuZCB0byBwcmVmZXIgaGlzIHNvbHV0aW9uIHNpbmNlIGl0IGhhcyBhIG5lZ2F0aXZl
IGxpbmUgY291bnQgYW5kCmFsc28gZG9lc24ndCBkbyB0aGUgKHVubmVlZGVkKSBleHBsaWNpdCBk
ZXZtX2tmcmVlKCkuCgpUaGFua3MgdGhvdWdoIQpBbGV4LgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
