From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
Date: Tue, 9 Jul 2019 14:28:27 +0100
Message-ID: <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
 <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
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
To: Dmitry Osipenko <digetx@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Ck9uIDA5LzA3LzIwMTkgMTQ6MjYsIEpvbiBIdW50ZXIgd3JvdGU6Cj4gCj4gT24gMDkvMDcvMjAx
OSAxMzo1MiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwOS4wNy4yMDE5IDE1OjQ1LCBNYXhp
bWUgUmlwYXJkINC/0LjRiNC10YI6Cj4+PiBIaSwKPj4+Cj4+PiBPbiBGcmksIEp1bCAwNSwgMjAx
OSBhdCAwNzo1NDo0N1BNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gMTcuMDYu
MjAxOSAxNzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4+PiBGcm9tOiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4KPj4+Pj4KPj4+Pj4gUmV3
cml0ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciBpbiBvcmRlciB0byBnZXQgYXdheSBmcm9tIHRo
ZSBzdGF0ZSBtYWNoaW5lCj4+Pj4+IHBhcnNpbmcgdGhlIHZpZGVvIG1vZGUgbGluZXMuCj4+Pj4+
Cj4+Pj4+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVhc2ls
eSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4+Pj4+IGFuZCAvIG9yIHByb3BlcnRpZXMgc2V0IGRp
cmVjdGx5IG9uIHRoZSBjb21tYW5kIGxpbmUuCj4+Pj4+Cj4+Pj4+IFJldmlld2VkLWJ5OiBOb3Jh
bGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1ICsrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0KPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyMTAgaW5zZXJ0aW9u
cygrKSwgMTE1IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gSSBoYXZlIGEgVGVncmEgZGV2aWNlIHRo
YXQgdXNlcyBhIHN0b2NrIGFuZHJvaWQgYm9vdGxvYWRlciB3aGljaAo+Pj4+IHBhc3NlcyAidmlk
ZW89dGVncmFmYiIgaW4gdGhlIGtlcm5lbHMgY21kbGluZS4gVGhhdCB3YXNuJ3QgYSBwcm9ibGVt
Cj4+Pj4gYmVmb3JlIHRoaXMgcGF0Y2gsIGJ1dCBub3cgVGVncmEgRFJNIGRyaXZlciBmYWlscyB0
byBwcm9iZSBiZWNhdXNlCj4+Pj4gdGhlIG1vZGUgaXMgMHgwOjAgYW5kIGhlbmNlIGZyYW1lYnVm
ZmVyIGFsbG9jYXRpb24gZmFpbHMuIElzIGl0IGEKPj4+PiBsZWdpdCByZWdyZXNzaW9uIHRoYXQg
c2hvdWxkIGJlIGZpeGVkIGluIHVwc3RyZWFtPwo+Pj4KPj4+IFRoaWVycnkgaW5kZWVkIHJlcG9y
dGVkIHRoYXQgaXNzdWUsIGJ1dCB0aGUgZGlzY3Vzc2lvbiBwcmV0dHkgbXVjaAo+Pj4gc3RhbGxl
ZCBzaW5jZSB0aGVuLgo+IAo+IFllcyBUaGllcnJ5IGlzIGN1cnJlbnRseSBvdXQgYW5kIGhlbmNl
IGhhcyBub3QgcmVzcG9uZGVkLiBJIGhhZCBiZWVuCj4gcGxhbm5pbmcgdG8gbG9vayBhdCB0aGlz
IHRoaXMgd2VlayBhbmQgcmVzcG9uZGVkLgo+IAo+PiBTb3JyeSwgdGhpcyBkb2Vzbid0IGFuc3dl
ciBteSBxdWVzdGlvbi4gV2hlcmUgaXQgd2FzIHJlcG9ydGVkPwo+IAo+IFNhbWUgdGhyZWFkIFsw
XS4KCkNvcnJlY3Rpb24sIGl0IHdhcyBvbiBwYXRjaCA2LzEyIGFuZCBub3QgdGhpcyBvbmUuCgpK
b24KCi0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
