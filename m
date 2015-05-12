From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: Re: "drm: Add reference counting to blob properties" breaks Tegra124
 Jetson TK1 in linux-next
Date: Tue, 12 May 2015 09:25:48 -0600
Message-ID: <55521B7C.3030708@nvidia.com>
References: <55517AE5.30700@nvidia.com>
 <CAPj87rOwzD7-g+GRkGpPXi+ayafmr8E=mbTK3j7cgCAkXCFt2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPj87rOwzD7-g+GRkGpPXi+ayafmr8E=mbTK3j7cgCAkXCFt2g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Daniel Stone <daniels@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

SGkgRGFuaWVsLAoKT24gMDUvMTIvMjAxNSAwMzowNiBBTSwgRGFuaWVsIFN0b25lIHdyb3RlOgo+
IEhpIFBhdWwsCj4KPiBPbiAxMiBNYXkgMjAxNSBhdCAwNTowMCwgUGF1bCBXYWxtc2xleSA8cHdh
bG1zbGV5QG52aWRpYS5jb20+IHdyb3RlOgo+PiBUZWdyYTEyNCBKZXRzb24gVEsxIGhhbmdzIGR1
cmluZyBib290IGluIG5leHQtMjAxNTA1MDggYW5kIGJleW9uZDoKPj4KPj4gaHR0cDovL252dC5w
d3Nhbi5jb20vZXhwZXJpbWVudGFsL2xpbnV4LW5leHQvdGVzdGxvZ3MvdGVzdF9uZXh0LTIwMTUw
NTA4LzIwMTUwNTA4MTAxMDE4L2Jvb3QvdGVncmExMjQtamV0c29uLXRrMS90ZWdyYTEyNC1qZXRz
b24tdGsxL3RlZ3JhX2RlZmNvbmZpZ19sb2cudHh0Cj4+IGh0dHA6Ly9udnQucHdzYW4uY29tL2V4
cGVyaW1lbnRhbC9saW51eC1uZXh0L3Rlc3Rsb2dzL3Rlc3RfbmV4dC0yMDE1MDUxMS8yMDE1MDUx
MTAwNDUzMy9ib290L3RlZ3JhMTI0LWpldHNvbi10azEvdGVncmExMjQtamV0c29uLXRrMS90ZWdy
YV9kZWZjb25maWdfbG9nLnR4dAo+Pgo+PiBSZXZlcnRpbmcgY29tbWl0IDY3MmNiMWQ2YWVjN2Rh
Mjc5OWFmZDFiNTI5ZDUxMzZkODRlZDI1NjEgKCJkcm06IEFkZAo+PiByZWZlcmVuY2UgY291bnRp
bmcgdG8gYmxvYiBwcm9wZXJ0aWVzIikgZ2V0cyBpdCBib290aW5nIGFnYWluOgo+Pgo+PiBodHRw
Oi8vbnZ0LnB3c2FuLmNvbS9wdWIvcHdhbG1zbGV5LXRlc3Rlci90ZXN0bG9ncy90ZXN0XzIwMTUw
NTExMjA0NzAzXzM4MzgyMzI0MzFjMjYzNmZmNTM5ZjIzNTRjNjMwYzBjYTNkNGI3YWQvMjAxNTA1
MTEyMDQ3MDMvYm9vdC90ZWdyYTEyNC1qZXRzb24tdGsxL3RlZ3JhMTI0LWpldHNvbi10azEvdGVn
cmFfZGVmY29uZmlnX2xvZy50eHQKPj4KPj4gSSdtIG5vdCBhIERSTSBleHBlcnQgYnV0IG1heWJl
IG9uZSBvZiB5b3Uga25vd3Mgd2hhdCdzIGdvaW5nIG9uIGhlcmU/Cj4gVGhpZXJyeSBmb3VuZCBh
bmQgZml4ZWQgdGhlIHJhdGhlciBzdHVwaWQgYnVnOiBub3QgdXNpbmcgdGhlIGNhY2hlZAo+ICdk
ZXYnIHZhcmlhYmxlIGluIHRoZSBvbmUgcGxhY2UgaXQgd291bGQndmUgYmVlbiB1c2VmdWwhCj4K
PiBodHRwOi8vcGFzdGUuZGViaWFuLm5ldC8xNzU1MjIvIGlzIHRoZSBmaXgsIHdoaWNoIGhhcyBi
ZWVuIHNxdWFzaGVkIGluCj4gdG8gdGhlIGJyYW5jaCBhbmQgc2hvdWxkIGFwcGVhciBpbiAtbmV4
dCBmcm9tIHRvZGF5Lgo+Cj4gVGhhbmtzIGZvciB0aGUgcmVwb3J0LgoKR3JlYXQhICBUaGFua3Mg
ZXZlcnlvbmUgZm9yIHRoZSB2ZXJ5IGZhc3QgZml4LgoKCi0gUGF1bAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
