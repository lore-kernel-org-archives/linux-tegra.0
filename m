From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
Date: Tue, 9 Jul 2019 14:26:56 +0100
Message-ID: <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
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

Ck9uIDA5LzA3LzIwMTkgMTM6NTIsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwOS4wNy4yMDE5
IDE1OjQ1LCBNYXhpbWUgUmlwYXJkINC/0LjRiNC10YI6Cj4+IEhpLAo+Pgo+PiBPbiBGcmksIEp1
bCAwNSwgMjAxOSBhdCAwNzo1NDo0N1BNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
PiAxNy4wNi4yMDE5IDE3OjUxLCBNYXhpbWUgUmlwYXJkINC/0LjRiNC10YI6Cj4+Pj4gRnJvbTog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+Pj4KPj4+
PiBSZXdyaXRlIHRoZSBjb21tYW5kIGxpbmUgcGFyc2VyIGluIG9yZGVyIHRvIGdldCBhd2F5IGZy
b20gdGhlIHN0YXRlIG1hY2hpbmUKPj4+PiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+
Pj4+Cj4+Pj4gSG9wZWZ1bGx5LCB0aGlzIHdpbGwgYWxsb3cgdG8gZXh0ZW5kIGl0IG1vcmUgZWFz
aWx5IHRvIHN1cHBvcnQgbmFtZWQgbW9kZXMKPj4+PiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBk
aXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IE5vcmFs
ZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+Pj4+IC0tLQo+Pj4+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAzMjUgKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEwIGluc2VydGlvbnMoKyks
IDExNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBJIGhhdmUgYSBUZWdyYSBkZXZpY2UgdGhhdCB1c2Vz
IGEgc3RvY2sgYW5kcm9pZCBib290bG9hZGVyIHdoaWNoCj4+PiBwYXNzZXMgInZpZGVvPXRlZ3Jh
ZmIiIGluIHRoZSBrZXJuZWxzIGNtZGxpbmUuIFRoYXQgd2Fzbid0IGEgcHJvYmxlbQo+Pj4gYmVm
b3JlIHRoaXMgcGF0Y2gsIGJ1dCBub3cgVGVncmEgRFJNIGRyaXZlciBmYWlscyB0byBwcm9iZSBi
ZWNhdXNlCj4+PiB0aGUgbW9kZSBpcyAweDA6MCBhbmQgaGVuY2UgZnJhbWVidWZmZXIgYWxsb2Nh
dGlvbiBmYWlscy4gSXMgaXQgYQo+Pj4gbGVnaXQgcmVncmVzc2lvbiB0aGF0IHNob3VsZCBiZSBm
aXhlZCBpbiB1cHN0cmVhbT8KPj4KPj4gVGhpZXJyeSBpbmRlZWQgcmVwb3J0ZWQgdGhhdCBpc3N1
ZSwgYnV0IHRoZSBkaXNjdXNzaW9uIHByZXR0eSBtdWNoCj4+IHN0YWxsZWQgc2luY2UgdGhlbi4K
ClllcyBUaGllcnJ5IGlzIGN1cnJlbnRseSBvdXQgYW5kIGhlbmNlIGhhcyBub3QgcmVzcG9uZGVk
LiBJIGhhZCBiZWVuCnBsYW5uaW5nIHRvIGxvb2sgYXQgdGhpcyB0aGlzIHdlZWsgYW5kIHJlc3Bv
bmRlZC4KCj4gU29ycnksIHRoaXMgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb24uIFdoZXJlIGl0
IHdhcyByZXBvcnRlZD8KClNhbWUgdGhyZWFkIFswXS4gRG1pdHJ5LCBhcmUgeW91IGFibGUgdG8g
cmVzcG9uZCB0byBNYXhpbWUncyByZXNwb25zZSB0bwpUaGllcnJ5PwoKQ2hlZXJzCkpvbgoKWzBd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA5OTkzOTMvCgotLSAKbnZwdWJs
aWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
