From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/4] drm/tegra: dc: Free syncpoint on errors
Date: Fri, 4 May 2018 17:14:50 +0300
Message-ID: <16935efe-f171-52db-0079-ad97bd1845b6@gmail.com>
References: <20180504133707.22451-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504133707.22451-1-thierry.reding@gmail.com>
Content-Language: en-US
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

T24gMDQuMDUuMjAxOCAxNjozNywgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gRnJvbTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBJZiBhbiBlcnJvciBoYXBwZW5zIGR1
cmluZyBkaXNwbGF5IGNvbnRyb2xsZXIgaW5pdGlhbGl6YXRpb24sIHRoZSBob3N0MXgKPiBzeW5j
cG9pbnQgcHJldmlvdXNseSByZXF1ZXN0ZWQgd291bGQgYmUgbGVha2VkLiBQcm9wZXJseSBjbGVh
biB1cCB0aGUKPiBzeW5jcG9pbnQgYWxvbmcgd2l0aCB0aGUgb3RoZXIgcmVzb3VyY2VzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKPiBpbmRleCBmMjA2NDhmNThlNDkuLmM4
NDNmMTEwNDNkYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCj4gQEAgLTE5MjUsNiArMTkyNSw4IEBAIHN0
YXRpYyBpbnQgdGVncmFfZGNfaW5pdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQo+ICAJ
CWlvbW11X2dyb3VwX3B1dChkYy0+Z3JvdXApOwo+ICAJfQo+ICAKPiArCWhvc3QxeF9zeW5jcHRf
ZnJlZShkYy0+c3luY3B0KTsKPiArCj4gIAlyZXR1cm4gZXJyOwo+ICB9CgpSZXZpZXdlZC1ieTog
RG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
