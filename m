From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/3] ARM: enable cache via Trusted Foundations firmware
Date: Sun, 11 Nov 2018 15:42:58 +0300
Message-ID: <a84ef2fc-fe95-f4ff-f499-a8faf8d86a75@gmail.com>
References: <cover.1541882833.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1541882833.git.mirq-linux@rere.qmqm.pl>
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
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
List-Id: linux-tegra@vger.kernel.org

T24gMTEuMTEuMjAxOCAwOjAyLCBNaWNoYcWCIE1pcm9zxYJhdyB3cm90ZToKPiBUaGlzIHNldCBl
bmFibGVzIHBsYXRmb3JtcyB1c2luZyBUcnVzdGVkIEZvdW5kYXRpb25zIGZpcm13YXJlIHRvIHVz
ZQo+IHRoZWlyIEwyIGNhY2hlLiBMMiBjYWNoZSBjYW4gYmUgZW5hYmxlZCBvbmx5IGJ5IGNhbGxp
bmcgdGhlIGZpcm13YXJlLgo+IAo+IE1pY2hhxYIgTWlyb3PFgmF3ICgzKToKPiAgIEFSTTogY2Fj
aGUtbDJ4MDogc2hhcmUgbDJ4MF9iYXNlIHdpdGggUE1VIGNvZGUKPiAgIEFSTTogdHJ1c3RlZF9m
b3VuZGF0aW9uczogZW5hYmxlIEwyeDAgY2FjaGUgdmlhIGZpcm13YXJlX29wcwo+ICAgQVJNOiB0
cnVzdGVkX2ZvdW5kYXRpb25zOiBhbm5vdW5jZSBmaXJtd2FyZSB2ZXJzaW9uCj4gCj4gIGFyY2gv
YXJtL2Zpcm13YXJlL3RydXN0ZWRfZm91bmRhdGlvbnMuYyAgICB8IDY3ICsrKysrKysrKysrKysr
KysrKysrKy0KPiAgYXJjaC9hcm0vaW5jbHVkZS9hc20vaGFyZHdhcmUvY2FjaGUtbDJ4MC5oIHwg
IDYgKy0KPiAgYXJjaC9hcm0vbW0vY2FjaGUtbDJ4MC1wbXUuYyAgICAgICAgICAgICAgIHwgIDkg
Ky0tCj4gIGFyY2gvYXJtL21tL2NhY2hlLWwyeDAuYyAgICAgICAgICAgICAgICAgICB8IDE0ICsr
KystCj4gIDQgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
Cj4gCgpIZWxsbyBNaWNoYcWCLAoKVmVyeSBuaWNlIHRvIHNlZSB0aGF0IHlvdSBhcmUga2VlcGlu
ZyB0byB3b3JrIG9uIGl0ISBDb3VwbGUgbW9udGhzIGFnbyBJIHBvc3RlZCBwYXRjaGVzIHRoYXQg
YWRkIGEgZnVsbC1mZWF0dXJlZCBUcnVzdGVkIEZvdW5kYXRpb25zIHN1cHBvcnQgb24gVGVncmEz
MCBbMF0gKGluY2x1ZGluZyBzdXNwZW5kLXJlc3VtZSwgdGh1bWIyIGtlcm5lbCwgaGFuZGxpbmcg
Q09ORklHX0NBQ0hFX0wyWDA9biksIHVuZm9ydHVuYXRlbHkgdGhleSBkaWRuJ3QgZ2V0IGFueSBh
dHRlbnRpb24geWV0LiBDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29rIGFuZCB0cnkgb3V0IFsw
XT8gSSd2ZSBnb3QgZXZlcnl0aGluZyB3b3JraW5nIHdpdGhvdXQgdG91Y2hpbmcgYXJjaC9hcm0v
bW0vY2FjaGUtbDJ4MCogYXQgYWxsLiBXb3VsZCBiZSBhd2Vzb21lIGlmIHdlIGNvdWxkIGNvb3Bl
cmF0ZSB0aGUgZWZmb3J0cyBzb21laG93LCBtYXliZSB0aGF0IHdpbGwgYWxzbyBoZWxwIHRvIGdl
dCBtb3JlIGF0dGVudGlvbiBmcm9tIHRoZSBtYWludGFpbmVycy4KClswXSBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtdGVncmEvbGlzdC8/c2VyaWVzPTYzMzM5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==
