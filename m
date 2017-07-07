From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: sor: add NULL check on of_match_device()
 return value
Date: Fri, 7 Jul 2017 08:42:09 +0100
Message-ID: <27ec9e14-f5da-4240-1158-e3c9af4d6f10@nvidia.com>
References: <20170707061119.GA12563@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170707061119.GA12563@embeddedgus>
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
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Ck9uIDA3LzA3LzE3IDA3OjExLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+IENoZWNrIHJl
dHVybiB2YWx1ZSBmcm9tIGNhbGwgdG8gb2ZfbWF0Y2hfZGV2aWNlKCkKPiBpbiBvcmRlciB0byBw
cmV2ZW50IGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgo+IAo+IEluIGNhc2Ugb2YgTlVMTCBw
cmludCBlcnJvciBtZXNzYWdlIGFuZCByZXR1cm4uCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2
byBBLiBSLiBTaWx2YSA8Z2Fyc2lsdmFAZW1iZWRkZWRvci5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+IGluZGV4IGE4ZjUyODkuLmNhM2Q5YjEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL3Nvci5jCj4gQEAgLTI1MzgsNiArMjUzOCwxMCBAQCBzdGF0aWMgaW50IHRlZ3Jh
X3Nvcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaW50IGVycjsKPiAg
Cj4gIAltYXRjaCA9IG9mX21hdGNoX2RldmljZSh0ZWdyYV9zb3Jfb2ZfbWF0Y2gsICZwZGV2LT5k
ZXYpOwo+ICsJaWYgKCFtYXRjaCkgewo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0
byBtYXRjaCBkZXZpY2VcbiIpOwo+ICsJCXJldHVybiAtRU5PREVWOwo+ICsJfQoKR2l2ZW4gdGhh
dCBUZWdyYSBhbHdheXMgdXNlcyBkZXZpY2UtdHJlZSwgSSBiZWxpZXZlIHRoYXQgdGhpcyBjYW5u
b3QKaGFwcGVuIGFuZCBzbyB0aGlzIGFkZGl0aW9uYWwgY2hlY2sgaXMgbm90IG5lZWRlZC4KCkpv
bgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
