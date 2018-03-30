From: Daniel Stone <daniels@collabora.com>
Subject: [PATCH 00/24] drm_framebuffer boilerplate removal
Date: Fri, 30 Mar 2018 15:11:10 +0100
Message-ID: <CAPj87rPKDwBK7qoOoY2zXoS6T02toATPRsk=39m_OBr=s1kXTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Russell King <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Lechner <david@lechnology.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>, linux-tegra@vger.kernel.org, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: linux-tegra@vger.kernel.org

SGksCkkndmUgYmVlbiB3b3JraW5nIG9uIGEgZ2V0ZmIyWzBdIGlvY3RsLCB3aGljaCBhbW9uZ3N0
IG90aGVyIHRoaW5ncwpzdXBwb3J0cyBtdWx0aS1wbGFuYXIgZnJhbWVidWZmZXJzIGFzIHdlbGwg
YXMgbW9kaWZpZXJzLiBnZXRmYgpjdXJyZW50bHkgY2FsbHMgdGhlIGZyYW1lYnVmZmVyJ3MgaGFu
ZGxlX2NyZWF0ZSBob29rLCB3aGljaCBkb2Vzbid0CnN1cHBvcnQgbXVsdGlwbGUgcGxhbmVzLgoK
VGhhbmtzIHRvIE5vcmFsZidzIHJlY2VudCB3b3JrLCBkcml2ZXJzIGNhbiBqdXN0IHN0b3JlIEdF
TSBvYmplY3RzCmRpcmVjdGx5IGluIGRybV9mcmFtZWJ1ZmZlci4gSSB1c2UgdGhpcyBkaXJlY3Rs
eSBpbiBnZXRmYjI6IHdlIG5lZWQKZGlyZWN0IGFjY2VzcyB0byB0aGUgR0VNIG9iamVjdHMgYW5k
IG5vdCBhIHZmdW5jIGluIG9yZGVyIHRvIG5vdCBoYW5kCm91dCBkdXBsaWNhdGUgR0VNIG5hbWVz
IGZvciB0aGUgc2FtZSBvYmplY3QuCgpUaGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgZHJpdmVycyBl
eGNlcHQgZm9yIG5vdXZlYXUsIHdoaWNoIHdhcyBhCmxpdHRsZSB0b28gbm9uLXRyaXZpYWwgZm9y
IG15IGNvbWZvcnQsIHRvIHN0b3JpbmcgR0VNIG9iamVjdHMgZGlyZWN0bHkKaW4gZHJtX2ZyYW1l
YnVmZmVyLiBGb3IgdGhvc2UgZHJpdmVycyB3aG9zZSBkcml2ZXJfZnJhbWVidWZmZXIgc3RydWN0
CndhcyBub3RoaW5nIGJ1dCBkcm1fZnJhbWVidWZmZXIgKyBCTywgaXQgZGVsZXRlcyB0aGUgZHJp
dmVyLXNwZWNpZmljCnN0cnVjdC4gSXQgYWxzbyBtYWtlcyB1c2Ugb2YgTm9yYWxmJ3MgZ2VuZXJp
YyBmcmFtZWJ1ZmZlciBoZWxwZXJzIGZvcgpjcmVhdGVfaGFuZGxlIGFuZCBkZXN0cm95IHdoZXJl
IHBvc3NpYmxlLgoKSSBkb24ndCBoYXZlIHRoZSBoYXJkd2FyZSBmb3IgbW9zdCBvZiB0aGVzZSBk
cml2ZXJzLCBzbyBoYXZlIGhhZCB0bwpzZXR0bGUgZm9yIGp1c3Qgc3RhcmluZyByZWFsbHkgaGFy
ZCBhdCB0aGUgZGlmZi4KCkkgaW50ZW5kIHRvIHJlbW92ZSBjcmVhdGVfaGFuZGxlIHdoZW4gYWxs
IGRyaXZlcnMgYXJlIGNvbnZlcnRlZCBvdmVyCnRvIHBsYWNpbmcgQk9zIGRpcmVjdGx5IGluc2lk
ZSBkcm1fZnJhbWVidWZmZXIuIEZvciBtb3N0IGRyaXZlcnMKdGhlcmUncyBhIHJlbGF0aXZlbHkg
ZWFzeSBjb252ZXJzaW9uIHRvIHVzaW5nIHRoZSBoZWxwZXJzIGZvcgpiYXNpY2FsbHkgYWxsIGZy
YW1lYnVmZmVyIGhhbmRsaW5nIGFuZCBmYmRldiBlbXVsYXRpb24gYXMgd2VsbCwgdGhvdWdoCnRo
YXQncyBhIGJpdCBmdXJ0aGVyIHRoYW4gSSB3YXMgd2lsbGluZyB0byBnbyB3aXRob3V0IGhhcmR3
YXJlIHRvIHRlc3QKb24gLi4uCgpDaGVlcnMsCkRhbmllbAoKWzBdOiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1NYXJjaC8xNzA1MTIuaHRtbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
