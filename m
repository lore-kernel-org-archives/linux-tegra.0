From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload() callbacks
Date: Thu, 24 Oct 2019 20:15:39 +0200
Message-ID: <20191024181539.GA31268@qmqm.qmqm.pl>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20191024173137.290420-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDc6MzE6MzdQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBU
aGUgLT5sb2FkKCkgYW5kIC0+dW5sb2FkKCkgZHJpdmVycyBhcmUgbWlkbGF5ZXJzIGFuZCBzaG91
bGQgYmUgYXZvaWRlZAo+IGluIG1vZGVybiBkcml2ZXJzLiBGaXggdGhpcyBieSBtb3ZpbmcgdGhl
IGNvZGUgaW50byB0aGUgZHJpdmVyIC0+cHJvYmUoKQo+IGFuZCAtPnJlbW92ZSgpIGltcGxlbWVu
dGF0aW9ucywgcmVzcGVjdGl2ZWx5Lgo+IAo+IHYyOiBraWNrIG91dCBjb25mbGljdGluZyBmcmFt
ZWJ1ZmZlcnMgYmVmb3JlIGluaXRpYWxpemluZyBmYmRldgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
aWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gTWljaGHFgiwgRG1pdHJ5
LAo+IAo+IGRvIHlvdSBndXlzIGhhdmUgYSB3YXkgb2YgdGVzdGluZyB0aGF0IHRoZSByZW1vdmFs
IG9mIHRoZSBjb25mbGljdGluZwo+IGZyYW1lYnVmZmVyIGFjdHVhbGx5IHdvcmtzPwpbLi4uXQoK
SSBtaWdodCBiZSBhYmxlIHRvIGNoZWNrIGR1cmluZyB0aGUgd2Vla2VuZC4gSXMgdGhpcyBwYXRj
aCBhbG9uZSBlbm91Z2gKZm9yIHY1LjM/CgpCZXN0IFJlZ2FyZHMsCk1pY2hhxYIgTWlyb3PFgmF3
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
