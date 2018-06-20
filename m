From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] drm/tegra: Fix comparison operator for buffer size
Date: Wed, 20 Jun 2018 18:11:44 +0300
Message-ID: <5366696.aeeooRCe44@dimapc>
References: <20180620130358.26247-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180620130358.26247-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

T24gV2VkbmVzZGF5LCAyMCBKdW5lIDIwMTggMTY6MDM6NTggTVNLIE1pa2tvIFBlcnR0dW5lbiB3
cm90ZToKPiBIZXJlIHdlIGFyZSBjaGVja2luZyBmb3IgdGhlIGJ1ZmZlciBsZW5ndGgsIG5vdCBh
biBvZmZzZXQgZm9yIHdyaXRpbmcKPiB0bywgc28gdXNpbmcgPiBpcyBjb3JyZWN0LiBUaGUgY3Vy
cmVudCBjb2RlIGluY29ycmVjdGx5IHJlamVjdHMgYQo+IGNvbW1hbmQgYnVmZmVyIGVuZGluZyBh
dCB0aGUgbWVtb3J5IGJ1ZmZlcidzIGVuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBQZXJ0
dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RybS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCj4gaW5kZXggNzc2YzE1MTNlNTgyLi5hMmJkNTg3
NmM2MzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCj4gQEAgLTM5OCw3ICszOTgsNyBAQCBpbnQgdGVn
cmFfZHJtX3N1Ym1pdChzdHJ1Y3QgdGVncmFfZHJtX2NvbnRleHQgKmNvbnRleHQsCj4gIAkJICog
dW5hbGlnbmVkIG9mZnNldCBpcyBtYWxmb3JtZWQgYW5kIGNhdXNlIGNvbW1hbmRzIHN0cmVhbQo+
ICAJCSAqIGNvcnJ1cHRpb24gb24gdGhlIGJ1ZmZlciBhZGRyZXNzIHJlbG9jYXRpb24uCj4gIAkJ
ICovCj4gLQkJaWYgKG9mZnNldCAmIDMgfHwgb2Zmc2V0ID49IG9iai0+Z2VtLnNpemUpIHsKPiAr
CQlpZiAob2Zmc2V0ICYgMyB8fCBvZmZzZXQgPiBvYmotPmdlbS5zaXplKSB7Cj4gIAkJCWVyciA9
IC1FSU5WQUw7Cj4gIAkJCWdvdG8gZmFpbDsKPiAgCQl9CgpSZXZpZXdlZC1ieTogRG1pdHJ5IE9z
aXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
