From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
Date: Fri, 5 Jul 2019 19:54:47 +0300
Message-ID: <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MTcuMDYuMjAxOSAxNzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IEZyb206IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+IAo+IFJld3JpdGUg
dGhlIGNvbW1hbmQgbGluZSBwYXJzZXIgaW4gb3JkZXIgdG8gZ2V0IGF3YXkgZnJvbSB0aGUgc3Rh
dGUgbWFjaGluZQo+IHBhcnNpbmcgdGhlIHZpZGVvIG1vZGUgbGluZXMuCj4gCj4gSG9wZWZ1bGx5
LCB0aGlzIHdpbGwgYWxsb3cgdG8gZXh0ZW5kIGl0IG1vcmUgZWFzaWx5IHRvIHN1cHBvcnQgbmFt
ZWQgbW9kZXMKPiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBkaXJlY3RseSBvbiB0aGUgY29tbWFu
ZCBsaW5lLgo+IAo+IFJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIxMCBpbnNlcnRpb25zKCspLCAxMTUgZGVsZXRpb25zKC0pCgpIZWxsbywKCkkgaGF2ZSBhIFRl
Z3JhIGRldmljZSB0aGF0IHVzZXMgYSBzdG9jayBhbmRyb2lkIGJvb3Rsb2FkZXIgd2hpY2ggcGFz
c2VzICJ2aWRlbz10ZWdyYWZiIiBpbgp0aGUga2VybmVscyBjbWRsaW5lLiBUaGF0IHdhc24ndCBh
IHByb2JsZW0gYmVmb3JlIHRoaXMgcGF0Y2gsIGJ1dCBub3cgVGVncmEgRFJNIGRyaXZlcgpmYWls
cyB0byBwcm9iZSBiZWNhdXNlIHRoZSBtb2RlIGlzIDB4MDowIGFuZCBoZW5jZSBmcmFtZWJ1ZmZl
ciBhbGxvY2F0aW9uIGZhaWxzLiBJcyBpdCBhCmxlZ2l0IHJlZ3Jlc3Npb24gdGhhdCBzaG91bGQg
YmUgZml4ZWQgaW4gdXBzdHJlYW0/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
