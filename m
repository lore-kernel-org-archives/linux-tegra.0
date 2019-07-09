From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
Date: Tue, 9 Jul 2019 16:40:20 +0300
Message-ID: <763b0a94-0b64-c4fa-00a4-dba6b4247c73@gmail.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
 <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
 <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
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
To: Jon Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MDkuMDcuMjAxOSAxNjoyOCwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IAo+IE9uIDA5LzA3LzIw
MTkgMTQ6MjYsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Cj4+IE9uIDA5LzA3LzIwMTkgMTM6NTIsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDA5LjA3LjIwMTkgMTU6NDUsIE1heGltZSBSaXBhcmQg
0L/QuNGI0LXRgjoKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3
OjU0OjQ3UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4gMTcuMDYuMjAxOSAx
Nzo1MSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4+Pj4gRnJvbTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gUmV3cml0
ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciBpbiBvcmRlciB0byBnZXQgYXdheSBmcm9tIHRoZSBz
dGF0ZSBtYWNoaW5lCj4+Pj4+PiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+Pj4+Pj4K
Pj4+Pj4+IEhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IHRvIGV4dGVuZCBpdCBtb3JlIGVhc2ls
eSB0byBzdXBwb3J0IG5hbWVkIG1vZGVzCj4+Pj4+PiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBk
aXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Pj4+Pj4KPj4+Pj4+IFJldmlld2VkLWJ5OiBO
b3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+Pj4+Pj4g
LS0tCj4+Pj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMzI1ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEwIGlu
c2VydGlvbnMoKyksIDExNSBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gSSBoYXZlIGEgVGVncmEg
ZGV2aWNlIHRoYXQgdXNlcyBhIHN0b2NrIGFuZHJvaWQgYm9vdGxvYWRlciB3aGljaAo+Pj4+PiBw
YXNzZXMgInZpZGVvPXRlZ3JhZmIiIGluIHRoZSBrZXJuZWxzIGNtZGxpbmUuIFRoYXQgd2Fzbid0
IGEgcHJvYmxlbQo+Pj4+PiBiZWZvcmUgdGhpcyBwYXRjaCwgYnV0IG5vdyBUZWdyYSBEUk0gZHJp
dmVyIGZhaWxzIHRvIHByb2JlIGJlY2F1c2UKPj4+Pj4gdGhlIG1vZGUgaXMgMHgwOjAgYW5kIGhl
bmNlIGZyYW1lYnVmZmVyIGFsbG9jYXRpb24gZmFpbHMuIElzIGl0IGEKPj4+Pj4gbGVnaXQgcmVn
cmVzc2lvbiB0aGF0IHNob3VsZCBiZSBmaXhlZCBpbiB1cHN0cmVhbT8KPj4+Pgo+Pj4+IFRoaWVy
cnkgaW5kZWVkIHJlcG9ydGVkIHRoYXQgaXNzdWUsIGJ1dCB0aGUgZGlzY3Vzc2lvbiBwcmV0dHkg
bXVjaAo+Pj4+IHN0YWxsZWQgc2luY2UgdGhlbi4KPj4KPj4gWWVzIFRoaWVycnkgaXMgY3VycmVu
dGx5IG91dCBhbmQgaGVuY2UgaGFzIG5vdCByZXNwb25kZWQuIEkgaGFkIGJlZW4KPj4gcGxhbm5p
bmcgdG8gbG9vayBhdCB0aGlzIHRoaXMgd2VlayBhbmQgcmVzcG9uZGVkLgo+Pgo+Pj4gU29ycnks
IHRoaXMgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb24uIFdoZXJlIGl0IHdhcyByZXBvcnRlZD8K
Pj4KPj4gU2FtZSB0aHJlYWQgWzBdLgo+IAo+IENvcnJlY3Rpb24sIGl0IHdhcyBvbiBwYXRjaCA2
LzEyIGFuZCBub3QgdGhpcyBvbmUuCgpUaGFuayB5b3UgdmVyeSBtdWNoLCBKb24hIFNvIGxvb2tz
IGxpa2UgdGhpcyBwYXRjaCBpcyBzaW1wbHkgYnJva2VuIGJlY2F1c2UgaXQgc2lsZW50bHkKY29w
aWVzIHRoZSAibW9kZSdzIG5hbWUiIGFuZCB0aGVuIGRybV9jb25uZWN0b3JfZ2V0X2NtZGxpbmVf
bW9kZSgpIGRvZXNuJ3QgZXZlbiB0cnkgdG8KdmFsaWRhdGUgdGhlIG1vZGUuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
