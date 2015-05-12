From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: "drm: Add reference counting to blob properties" breaks Tegra124
 Jetson TK1 in linux-next
Date: Tue, 12 May 2015 10:06:44 +0100
Message-ID: <CAPj87rOwzD7-g+GRkGpPXi+ayafmr8E=mbTK3j7cgCAkXCFt2g@mail.gmail.com>
References: <55517AE5.30700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55517AE5.30700@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Walmsley <pwalmsley@nvidia.com>
Cc: Daniel Stone <daniels@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

SGkgUGF1bCwKCk9uIDEyIE1heSAyMDE1IGF0IDA1OjAwLCBQYXVsIFdhbG1zbGV5IDxwd2FsbXNs
ZXlAbnZpZGlhLmNvbT4gd3JvdGU6Cj4gVGVncmExMjQgSmV0c29uIFRLMSBoYW5ncyBkdXJpbmcg
Ym9vdCBpbiBuZXh0LTIwMTUwNTA4IGFuZCBiZXlvbmQ6Cj4KPiBodHRwOi8vbnZ0LnB3c2FuLmNv
bS9leHBlcmltZW50YWwvbGludXgtbmV4dC90ZXN0bG9ncy90ZXN0X25leHQtMjAxNTA1MDgvMjAx
NTA1MDgxMDEwMTgvYm9vdC90ZWdyYTEyNC1qZXRzb24tdGsxL3RlZ3JhMTI0LWpldHNvbi10azEv
dGVncmFfZGVmY29uZmlnX2xvZy50eHQKPiBodHRwOi8vbnZ0LnB3c2FuLmNvbS9leHBlcmltZW50
YWwvbGludXgtbmV4dC90ZXN0bG9ncy90ZXN0X25leHQtMjAxNTA1MTEvMjAxNTA1MTEwMDQ1MzMv
Ym9vdC90ZWdyYTEyNC1qZXRzb24tdGsxL3RlZ3JhMTI0LWpldHNvbi10azEvdGVncmFfZGVmY29u
ZmlnX2xvZy50eHQKPgo+IFJldmVydGluZyBjb21taXQgNjcyY2IxZDZhZWM3ZGEyNzk5YWZkMWI1
MjlkNTEzNmQ4NGVkMjU2MSAoImRybTogQWRkCj4gcmVmZXJlbmNlIGNvdW50aW5nIHRvIGJsb2Ig
cHJvcGVydGllcyIpIGdldHMgaXQgYm9vdGluZyBhZ2FpbjoKPgo+IGh0dHA6Ly9udnQucHdzYW4u
Y29tL3B1Yi9wd2FsbXNsZXktdGVzdGVyL3Rlc3Rsb2dzL3Rlc3RfMjAxNTA1MTEyMDQ3MDNfMzgz
ODIzMjQzMWMyNjM2ZmY1MzlmMjM1NGM2MzBjMGNhM2Q0YjdhZC8yMDE1MDUxMTIwNDcwMy9ib290
L3RlZ3JhMTI0LWpldHNvbi10azEvdGVncmExMjQtamV0c29uLXRrMS90ZWdyYV9kZWZjb25maWdf
bG9nLnR4dAo+Cj4gSSdtIG5vdCBhIERSTSBleHBlcnQgYnV0IG1heWJlIG9uZSBvZiB5b3Uga25v
d3Mgd2hhdCdzIGdvaW5nIG9uIGhlcmU/CgpUaGllcnJ5IGZvdW5kIGFuZCBmaXhlZCB0aGUgcmF0
aGVyIHN0dXBpZCBidWc6IG5vdCB1c2luZyB0aGUgY2FjaGVkCidkZXYnIHZhcmlhYmxlIGluIHRo
ZSBvbmUgcGxhY2UgaXQgd291bGQndmUgYmVlbiB1c2VmdWwhCgpodHRwOi8vcGFzdGUuZGViaWFu
Lm5ldC8xNzU1MjIvIGlzIHRoZSBmaXgsIHdoaWNoIGhhcyBiZWVuIHNxdWFzaGVkIGluCnRvIHRo
ZSBicmFuY2ggYW5kIHNob3VsZCBhcHBlYXIgaW4gLW5leHQgZnJvbSB0b2RheS4KClRoYW5rcyBm
b3IgdGhlIHJlcG9ydC4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
