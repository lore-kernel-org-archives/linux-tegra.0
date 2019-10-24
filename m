From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload() callbacks
Date: Fri, 25 Oct 2019 00:10:49 +0300
Message-ID: <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
 <20191024181539.GA31268@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191024181539.GA31268@qmqm.qmqm.pl>
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
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

MjQuMTAuMjAxOSAyMToxNSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBUaHUs
IE9jdCAyNCwgMjAxOSBhdCAwNzozMTozN1BNICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
Pj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4KPj4gVGhlIC0+
bG9hZCgpIGFuZCAtPnVubG9hZCgpIGRyaXZlcnMgYXJlIG1pZGxheWVycyBhbmQgc2hvdWxkIGJl
IGF2b2lkZWQKPj4gaW4gbW9kZXJuIGRyaXZlcnMuIEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgY29k
ZSBpbnRvIHRoZSBkcml2ZXIgLT5wcm9iZSgpCj4+IGFuZCAtPnJlbW92ZSgpIGltcGxlbWVudGF0
aW9ucywgcmVzcGVjdGl2ZWx5Lgo+Pgo+PiB2Mjoga2ljayBvdXQgY29uZmxpY3RpbmcgZnJhbWVi
dWZmZXJzIGJlZm9yZSBpbml0aWFsaXppbmcgZmJkZXYKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhp
ZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4gLS0tCj4+IE1pY2hhxYIsIERtaXRy
eSwKPj4KPj4gZG8geW91IGd1eXMgaGF2ZSBhIHdheSBvZiB0ZXN0aW5nIHRoYXQgdGhlIHJlbW92
YWwgb2YgdGhlIGNvbmZsaWN0aW5nCj4+IGZyYW1lYnVmZmVyIGFjdHVhbGx5IHdvcmtzPwo+IFsu
Li5dCj4gCj4gSSBtaWdodCBiZSBhYmxlIHRvIGNoZWNrIGR1cmluZyB0aGUgd2Vla2VuZC4gSXMg
dGhpcyBwYXRjaCBhbG9uZSBlbm91Z2gKPiBmb3IgdjUuMz8KCkkgZG9uJ3QgdGhpbmsgaXQgd2ls
bCBhcHBseSBjbGVhbmx5IG9uIHRvcCBvZiA1LjMsIGJ1dCBzaG91bGQgd29yayB3aXRoCmxpbnV4
LW5leHQgb3IgYnkgY2hlcnJ5LXBpY2tpbmcgOWQ1YTU0OTg3MjY1LgoKUmVnYXJkaW5nIHRoZSB0
ZXN0aW5nLCBJIG5ldmVyIHVzZWQgc2ltcGxlLWZiIG9uIFRlZ3JhIGJlZm9yZSBhbmQgaXQncwpu
b3Qgd29ya2luZyBmb3IgbWUgbm93LiBIb3BlZnVsbHkgaXQgd2lsbCB3b3JrIGZvciB5b3UsIE1p
Y2hhxYIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
