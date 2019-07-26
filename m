From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
Date: Fri, 26 Jul 2019 16:57:05 +0200
Message-ID: <d02d9605797d784dc941c9d98769bf5d@agner.ch>
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
 <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
 <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f035a8ba-ffa7-b98b-a444-db8b4bbd34ec@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

T24gMjAxOS0wNy0yNiAxNjo0NiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI2LjA3LjIwMTkg
MTc6MjMsIFN0ZWZhbiBBZ25lciDQv9C40YjQtdGCOgo+PiBIaSBUaGllcnJ5LCBIaSBEYXZlLAo+
Pgo+PiBPbiAyMDE4LTA5LTA3IDAxOjMxLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+PiBPbiAyNi4w
Ny4yMDE4IDA2OjM2LCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+Pj4gSWYgdGhlIEdQSU8gc3Vic3lz
dGVtIGlzIG5vdCByZWFkeSBtYWtlIHN1cmUgdG8gcmV0dXJuIC1FUFJPQkVfREVGRVIKPj4+PiBp
bnN0ZWFkIG9mIHNpbGVudGx5IGNvbnRpbnVpbmcgd2l0aG91dCBIUEQuCj4+Pj4KPj4+PiBSZXBv
cnRlZC1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4+Pgo+Pj4g
SSB0aGluayB0aGlzIGRpZCBub3QgZ2V0IG1lcmdlZCB5ZXQsIGFueSBjaGFuY2UgdG8gZ2V0IGl0
IGluPwo+Pgo+PiBBbnkgY2hhbmNlIHRvIGdldCB0aGlzIGluIGluIHRoZSBuZXh0IG1lcmdlIHdp
bmRvdz8KPiAKPiBUaGUgcGF0Y2ggaXNuJ3QgcmVsZXZhbnQgYW55bW9yZSAoc2luY2UgdjUuMykg
YmVjYXVzZSB0aGUgY29kZSB3YXMKPiBjaGFuZ2VkIGFuZCBub3cgcHJvcGFnYXRlcyB0aGUgcHJv
cGVyIGVycm9yIGNvZGUgaW4gYSBjYXNlIG9mIGVycm9yLAo+IHBsZWFzZSBzZWUgWzFdLgo+IAo+
IFsxXQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2g9djUuMy1yYzEmaWQ9YmJhZDY0MDcwOWZkNDNmZjc3
Yjg4MzhjNDA5Yzk3N2MwYjI4NDMwYwoKT2ggSSBzZWUsIEkgYWNjaWRlbnRhbGx5IGNoZWNrZWQg
aW4gTGludXggNS4yLiBTb3JyeSBmb3IgdGhlIG5vaXNlIGFuZAp0aGFua3MgZm9yIHRoZSBsaW5r
IQoKLS0KU3RlZmFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
