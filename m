From: Erik Faye-Lund <kusmabite@gmail.com>
Subject: Re: [PATCH 18/22] gpu: host1x: Remove unused 'struct host1x_cmdbuf'
Date: Tue, 23 May 2017 02:42:47 +0200
Message-ID: <CABPQNSZCQxJBpBHOkh+vtBrq2aSc-H6YVWrhw_myxGMi3t-3pw@mail.gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <f744341274b5749761550d14e37cac57cd0e63fc.1495498184.git.digetx@gmail.com>
Reply-To: kusmabite@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f744341274b5749761550d14e37cac57cd0e63fc.1495498184.git.digetx@gmail.com>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCBNYXkgMjMsIDIwMTcgYXQgMjoxNCBBTSwgRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPiB3cm90ZToKPiBUaGUgc3RydWN0IGhvc3QxeF9jbWRidWYgaXMgdW51c2VkLCBs
ZXQncyByZW1vdmUgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2hvc3QxeC9qb2IuaCB8IDcgLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9ob3N0MXgvam9iLmggYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmgKPiBpbmRleCAw
ZGViZDkzYTE4NDkuLjRiZGE1MWQ1MDNlYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0
MXgvam9iLmgKPiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmgKPiBAQCAtMjcsMTMgKzI3
LDYgQEAgc3RydWN0IGhvc3QxeF9qb2JfZ2F0aGVyIHsKPiAgICAgICAgIGJvb2wgaGFuZGxlZDsK
PiAgfTsKPgo+IC1zdHJ1Y3QgaG9zdDF4X2NtZGJ1ZiB7Cj4gLSAgICAgICB1MzIgaGFuZGxlOwo+
IC0gICAgICAgdTMyIG9mZnNldDsKPiAtICAgICAgIHUzMiB3b3JkczsKPiAtICAgICAgIHUzMiBw
YWQ7Cj4gLX07Cj4gLQo+ICBzdHJ1Y3QgaG9zdDF4X2pvYl91bnBpbl9kYXRhIHsKPiAgICAgICAg
IHN0cnVjdCBob3N0MXhfYm8gKmJvOwo+ICAgICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4g
LS0KPiAyLjEzLjAKPgoKUmV2aWV3ZWQtYnk6IEVyaWsgRmF5ZS1MdW5kIDxrdXNtYWJpdGVAZ21h
aWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
