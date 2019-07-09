From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
Date: Tue, 9 Jul 2019 15:52:13 +0300
Message-ID: <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190709124526.36szuriteq3jumhr@flea>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MDkuMDcuMjAxOSAxNTo0NSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IEhpLAo+IAo+IE9u
IEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjU0OjQ3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4gMTcuMDYuMjAxOSAxNzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4g
RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+
Pgo+Pj4gUmV3cml0ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciBpbiBvcmRlciB0byBnZXQgYXdh
eSBmcm9tIHRoZSBzdGF0ZSBtYWNoaW5lCj4+PiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVz
Lgo+Pj4KPj4+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVh
c2lseSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4+PiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBk
aXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBOb3JhbGYg
VHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+Pj4gLS0tCj4+PiAgZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1ICsrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEwIGluc2VydGlvbnMoKyksIDExNSBk
ZWxldGlvbnMoLSkKPj4KPj4gSSBoYXZlIGEgVGVncmEgZGV2aWNlIHRoYXQgdXNlcyBhIHN0b2Nr
IGFuZHJvaWQgYm9vdGxvYWRlciB3aGljaAo+PiBwYXNzZXMgInZpZGVvPXRlZ3JhZmIiIGluIHRo
ZSBrZXJuZWxzIGNtZGxpbmUuIFRoYXQgd2Fzbid0IGEgcHJvYmxlbQo+PiBiZWZvcmUgdGhpcyBw
YXRjaCwgYnV0IG5vdyBUZWdyYSBEUk0gZHJpdmVyIGZhaWxzIHRvIHByb2JlIGJlY2F1c2UKPj4g
dGhlIG1vZGUgaXMgMHgwOjAgYW5kIGhlbmNlIGZyYW1lYnVmZmVyIGFsbG9jYXRpb24gZmFpbHMu
IElzIGl0IGEKPj4gbGVnaXQgcmVncmVzc2lvbiB0aGF0IHNob3VsZCBiZSBmaXhlZCBpbiB1cHN0
cmVhbT8KPiAKPiBUaGllcnJ5IGluZGVlZCByZXBvcnRlZCB0aGF0IGlzc3VlLCBidXQgdGhlIGRp
c2N1c3Npb24gcHJldHR5IG11Y2gKPiBzdGFsbGVkIHNpbmNlIHRoZW4uCgpTb3JyeSwgdGhpcyBk
b2Vzbid0IGFuc3dlciBteSBxdWVzdGlvbi4gV2hlcmUgaXQgd2FzIHJlcG9ydGVkPwoKSWYgaXQn
cyBhIHZhbGlkIHJlZ3Jlc3Npb24gKG15IGRldmljZSBpcyBicm9rZW4pLCB0aGVuIHRoZSBwYXRj
aCBzaG91bGQgZWl0aGVyIGJlIGZpeGVkIG9yCnJldmVydGVkLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
