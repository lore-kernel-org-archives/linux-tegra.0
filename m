From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 01/36] clk: Introduce clk_try_parent()
Date: Tue, 20 Jan 2015 13:16:16 -0500
Message-ID: <CAF6AEGsPGCAHxqqRR7wWGxbiuS1HwTxF8fMb=VaL8T_qj85=TQ@mail.gmail.com>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
 <1421750935-4023-2-git-send-email-thierry.reding@gmail.com>
 <20150120180247.22722.92597@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150120180247.22722.92597@quantum>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: Russell King <linux@arm.linux.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCBKYW4gMjAsIDIwMTUgYXQgMTowMiBQTSwgTWlrZSBUdXJxdWV0dGUgPG10dXJxdWV0
dGVAbGluYXJvLm9yZz4gd3JvdGU6Cj4gUXVvdGluZyBUaGllcnJ5IFJlZGluZyAoMjAxNS0wMS0y
MCAwMjo0ODoyMCkKPj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
Pj4KPj4gVGhpcyBuZXcgZnVuY3Rpb24gaXMgc2ltaWxhciB0byBjbGtfc2V0X3BhcmVudCgpLCBl
eGNlcHQgdGhhdCBpdCBkb2Vzbid0Cj4+IGFjdHVhbGx5IGNoYW5nZSB0aGUgcGFyZW50LiBJdCBt
ZXJlbHkgY2hlY2tzIHRoYXQgdGhlIGdpdmVuIHBhcmVudCBjbG9jawo+PiBjYW4gYmUgYSBwYXJl
bnQgZm9yIHRoZSBnaXZlbiBjbG9jay4KPj4KPj4gQSBzaXR1YXRpb24gd2hlcmUgdGhpcyBpcyB1
c2VmdWwgaXMgdG8gY2hlY2sgdGhhdCBhIHBhcnRpY3VsYXIgc2V0dXAgaXMKPj4gdmFsaWQgYmVm
b3JlIHN3aXRjaGluZyB0byBpdC4gT25lIHNwZWNpZmljIHVzZS1jYXNlIGZvciB0aGlzIGlzIGF0
b21pYwo+PiBtb2Rlc2V0dGluZyBpbiB0aGUgRFJNIGZyYW1ld29yayB3aGVyZSBzZXR0aW5nIGEg
bW9kZSBpcyBkaXZpZGVkIGludG8gYQo+PiBjaGVjayBwaGFzZSB3aGVyZSBhIGdpdmVuIGNvbmZp
Z3VyYXRpb24gaXMgdmFsaWRhdGVkIGJlZm9yZSBhcHBseWluZwo+PiBjaGFuZ2VzIHRvIHRoZSBo
YXJkd2FyZS4KPgo+IENhbiB5b3UgZGVzY3JpYmUgd2h5IHRoaXMgd2FzIG5lZWRlZCBmb3IgeW91
ciBhdG9taWMgbW9kZXNldHRpbmcgd29yaz8KPiBXaGF0IHByb2JsZW0gZGlkIHlvdSBoaXQgaW4g
dGhlIGRyaXZlciB0aGF0IHJlcXVpcmVkIHRoaXMgbmV3IGNoZWNrPwoKSW4gcGFydGljdWxhciwg
Zm9yIGFuIGFzeW5jIGF0b21pYyB1cGRhdGUsIHdlIG5lZWQgdG8gZG8gZXZlcnl0aGluZwp0aGF0
IG1heSBwb3RlbnRpYWxseSBmYWlsIHVwIGZyb250IGJlZm9yZSByZXR1cm5pbmcgdG8gdXNlcnNw
YWNlLgpBZGRpdGlvbmFsbHkgdGhlcmUgaXMgYSAndGVzdG9ubHknIGZsYWcgc28gdGhhdCB1c2Vy
c3BhY2UgY2FuIGFzayBpZiBhCnBhcnRpY3VsYXIgZGlzcGxheSBjb25maWd1cmF0aW9uIGlzIHBv
c3NpYmxlLgoKQlIsCi1SCgo+IFRoYW5rcywKPiBNaWtlCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
