From: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Date: Tue, 28 Jan 2020 08:43:01 +0800
Message-ID: <20200128004301.GD20624@richard>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
 <20200117232254.2792-4-richardw.yang@linux.intel.com>
 <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: thellstrom@vmware.com, yang.shi@linux.alibaba.com, Russell King - ARM Linux <linux@armlinux.org.uk>, aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-mm@kvack.org, Thierry Reding <thierry.reding@gmail.com>, Wei Yang <richardw.yang@linux.intel.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, kirill@shutemov.name, akpm@linux-foundation.org, dan.j.williams@intel.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCBKYW4gMjYsIDIwMjAgYXQgMDU6NDc6NTdQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+MTguMDEuMjAyMCAwMjoyMiwgV2VpIFlhbmcg0L/QuNGI0LXRgjoKPj4gVXNlIHRo
ZSBnZW5lcmFsIGhlbHBlciBpbnN0ZWFkIG9mIGRvIGl0IGJ5IGhhbmQuCj4+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBXZWkgWWFuZyA8cmljaGFyZHcueWFuZ0BsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+
PiAgbW0vbXJlbWFwLmMgfCA3ICsrLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvbW0vbXJlbWFwLmMgYi9t
bS9tcmVtYXAuYwo+PiBpbmRleCBjMmFmOGJhNGJhNDMuLmEyNTg5MTRmM2VlMSAxMDA2NDQKPj4g
LS0tIGEvbW0vbXJlbWFwLmMKPj4gKysrIGIvbW0vbXJlbWFwLmMKPj4gQEAgLTI1MywxMSArMjUz
LDggQEAgdW5zaWduZWQgbG9uZyBtb3ZlX3BhZ2VfdGFibGVzKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAo+PiAgCj4+ICAJZm9yICg7IG9sZF9hZGRyIDwgb2xkX2VuZDsgb2xkX2FkZHIgKz0g
ZXh0ZW50LCBuZXdfYWRkciArPSBleHRlbnQpIHsKPj4gIAkJY29uZF9yZXNjaGVkKCk7Cj4+IC0J
CW5leHQgPSAob2xkX2FkZHIgKyBQTURfU0laRSkgJiBQTURfTUFTSzsKPj4gLQkJLyogZXZlbiBp
ZiBuZXh0IG92ZXJmbG93ZWQsIGV4dGVudCBiZWxvdyB3aWxsIGJlIG9rICovCj4+ICsJCW5leHQg
PSBwbWRfYWRkcl9lbmQob2xkX2FkZHIsIG9sZF9lbmQpOwo+PiAgCQlleHRlbnQgPSBuZXh0IC0g
b2xkX2FkZHI7Cj4+IC0JCWlmIChleHRlbnQgPiBvbGRfZW5kIC0gb2xkX2FkZHIpCj4+IC0JCQll
eHRlbnQgPSBvbGRfZW5kIC0gb2xkX2FkZHI7Cj4+ICAJCW9sZF9wbWQgPSBnZXRfb2xkX3BtZCh2
bWEtPnZtX21tLCBvbGRfYWRkcik7Cj4+ICAJCWlmICghb2xkX3BtZCkKPj4gIAkJCWNvbnRpbnVl
Owo+PiBAQCAtMzAxLDcgKzI5OCw3IEBAIHVuc2lnbmVkIGxvbmcgbW92ZV9wYWdlX3RhYmxlcyhz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4gIAo+PiAgCQlpZiAocHRlX2FsbG9jKG5ld192
bWEtPnZtX21tLCBuZXdfcG1kKSkKPj4gIAkJCWJyZWFrOwo+PiAtCQluZXh0ID0gKG5ld19hZGRy
ICsgUE1EX1NJWkUpICYgUE1EX01BU0s7Cj4+ICsJCW5leHQgPSBwbWRfYWRkcl9lbmQobmV3X2Fk
ZHIsIG5ld19hZGRyICsgbGVuKTsKPj4gIAkJaWYgKGV4dGVudCA+IG5leHQgLSBuZXdfYWRkcikK
Pj4gIAkJCWV4dGVudCA9IG5leHQgLSBuZXdfYWRkcjsKPj4gIAkJbW92ZV9wdGVzKHZtYSwgb2xk
X3BtZCwgb2xkX2FkZHIsIG9sZF9hZGRyICsgZXh0ZW50LCBuZXdfdm1hLAo+PiAKPgo+SGVsbG8g
V2VpLAo+Cj5TdGFydGluZyB3aXRoIG5leHQtMjAyMDAxMjIsIEknbSBzZWVpbmcgdGhlIGZvbGxv
d2luZyBpbiBLTVNHIG9uIE5WSURJQQo+VGVncmEgKEFSTTMyKToKPgo+ICBCVUc6IEJhZCByc3Mt
Y291bnRlciBzdGF0ZSBtbToocHRydmFsKSB0eXBlOk1NX0FOT05QQUdFUyB2YWw6MTkwCj4KClRo
YW5rcy4KCldvdWxkIHlvdSBtaW5kIGxldHRpbmcgbWUga25vdyB3aGljaCBjYXNlIHlvdSBhcmUg
dGVzdGluZz8gT3IgdGhlIHNwZWNpYWwKdGhpbmcgaXMgMzItYml0IHBsYXRmb3JtPwoKPmFuZCBl
dmVudHVhbGx5IGtlcm5lbCBoYW5ncy4KPgo+R2l0J3MgYmlzZWN0aW9uIHBvaW50cyB0byB0aGlz
IHBhdGNoIGFuZCByZXZlcnRpbmcgaXQgaGVscHMuIFBsZWFzZSBmaXgsCj50aGFua3MgaW4gYWR2
YW5jZS4KCi0tIApXZWkgWWFuZwpIZWxwIHlvdSwgSGVscCBtZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
