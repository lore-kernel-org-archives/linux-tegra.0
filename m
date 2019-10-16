From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 10/14] drm/tegra: Move IOMMU group into host1x client
Date: Wed, 16 Oct 2019 18:33:50 +0300
Message-ID: <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
 <20191014125049.425101-11-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191014125049.425101-11-thierry.reding@gmail.com>
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

MTQuMTAuMjAxOSAxNTo1MCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEhhbmRsaW5nIG9mIHRoZSBJT01N
VSBncm91cCBhdHRhY2htZW50IGlzIGNvbW1vbiB0byBhbGwgY2xpZW50cywgc28gbW92ZQo+IHRo
ZSBncm91cCBpbnRvIHRoZSBjbGllbnQgdG8gc2ltcGxpZnkgY29kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuYyAgIHwgIDkgKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kYy5oICAgfCAgMiAtLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgIHwgMjIg
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggIHwg
IDYgKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjJkLmMgfCAxMCArKysrLS0tLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjNkLmMgfCAxMCArKysrLS0tLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS92aWMuYyAgfCAxMCArKysrLS0tLS0tCj4gIGluY2x1ZGUvbGludXgv
aG9zdDF4LmggICAgICAgfCAgMiArKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDQwIGRlbGV0aW9ucygtKQoKSGVsbG8gVGhpZXJyeSwKCklzIHRoZXJlIGFueSBjaGFuY2Ug
dGhhdCB5b3UgY291bGQgcGljayB1cCB0aGVzZSBwYXRjaGVzIFswXSBhbmQgcmViYXNlCnlvdXJz
IHNlcmllcyBvbiB0b3Agb2YgdGhlbT8KClswXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXgtdGVncmEvbGlzdC8/c2VyaWVzPTExNTYwOApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
