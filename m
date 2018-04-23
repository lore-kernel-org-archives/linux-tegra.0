From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Acquire a reference to the IOVA cache
Date: Mon, 23 Apr 2018 11:41:17 +0300
Message-ID: <ae552ade-e4e7-669c-ee85-820a92490871@gmail.com>
References: <20180423065745.26102-1-thierry.reding@gmail.com>
 <20180423065745.26102-2-thierry.reding@gmail.com>
 <98ffd7c2-1184-a667-39e5-68d011e516a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <98ffd7c2-1184-a667-39e5-68d011e516a4@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

T24gMjMuMDQuMjAxOCAxMTozNCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IE9uIDIzLjA0LjIw
MTggMDk6NTcsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8
dHJlZGluZ0BudmlkaWEuY29tPgo+Pgo+PiBUaGUgSU9WQSBBUEkgdXNlcyBhIG1lbW9yeSBjYWNo
ZSB0byBhbGxvY2F0ZSBJT1ZBIG5vZGVzIGZyb20uIFRvIG1ha2UKPj4gc3VyZSB0aGF0IHRoaXMg
Y2FjaGUgaXMgYXZhaWxhYmxlLCBvYnRhaW4gYSByZWZlcmVuY2UgdG8gaXQgYW5kIHJlbGVhc2UK
Pj4gdGhlIHJlZmVyZW5jZSB3aGVuIHRoZSBjYWNoZSBpcyBubyBsb25nZXIgbmVlZGVkLgo+Pgo+
PiBPbiA2NC1iaXQgQVJNIHRoaXMgaXMgaGlkZGVuIGJ5IHRoZSBmYWN0IHRoYXQgdGhlIERNQSBt
YXBwaW5nIEFQSSBnZXRzCj4+IHRoYXQgcmVmZXJlbmNlIGFuZCBuZXZlciByZWxlYXNlcyBpdC4g
T24gMzItYml0IEFSTSwgaG93ZXZlciwgdGhlIERNQQo+PiBtYXBwaW5nIEFQSSBkb2Vzbid0IGRv
IHRoYXQsIHNvIGFsbG9jYXRpb24gb2YgSU9WQSBub2RlcyBmYWlscy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4gLS0tCj4gCj4gUmV2
aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6
IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAKPiBDT05GSUdfVEVHUkFfSU9N
TVVfU01NVSBpcyBlbmFibGVkIGluIHRoZSBkZWZhdWx0IGtlcm5lbCBjb25maWdzIGFuZCBoZW5j
ZSBEUk0KPiBzaG91bGQgZmFpbCB0byBwcm9iZSBvbiB0MTI0IHNpbmNlIDQuMTEuIFdoYXQgYWJv
dXQgdG8gYWRkIHN0YWJsZSB0YWcgZm9yIHY0LjExKwo+IGhlcmUgdG8gdW5icmVhayBzdGFibGUg
a2VybmVscyBhcyB3ZWxsPwoKSU9NTVUgbm9kZSBmb3IgaG9zdDF4IHdhcyBhZGRlZCB0byB0MTI0
IERUIGluIGtlcm5lbCB2NC4xNCwgc28gcy80LjExLzQuMTQvLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
