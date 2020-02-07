From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip: core/kprobes] arm/ftrace: Use __patch_text()
Date: Fri, 7 Feb 2020 12:27:20 +0100
Message-ID: <20200207112720.GF14914@hirez.programming.kicks-ass.net>
References: <20191113092636.GG4131@hirez.programming.kicks-ass.net>
 <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
 <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86 <x86@kernel.org>, Denys Vlasenko <dvlasenk@redhat.com>, linux-tip-commits@vger.kernel.org, Brian Gerst <brgerst@gmail.com>, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org, tip-bot2 for Peter Zijlstra <tip-bot2@linutronix.de>, Jon Hunter <jonathanh@nvidia.com>, rabin@rab.in, Linus Torvalds <torvalds@linux-foundation.org>, Thierry Reding <thierry.reding@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, james.morse@arm.com, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTI6MjY6NDZBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDA0LjEyLjIwMTkgMTE6MzMsIHRpcC1ib3QyIGZvciBQZXRlciBaaWpsc3RyYSDQ
v9C40YjQtdGCOgo+ID4gQEAgLTk3LDEwICs5NCw3IEBAIHN0YXRpYyBpbnQgZnRyYWNlX21vZGlm
eV9jb2RlKHVuc2lnbmVkIGxvbmcgcGMsIHVuc2lnbmVkIGxvbmcgb2xkLAo+ID4gIAkJCXJldHVy
biAtRUlOVkFMOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCWlmIChwcm9iZV9rZXJuZWxfd3JpdGUoKHZv
aWQgKilwYywgJm5ldywgTUNPVU5UX0lOU05fU0laRSkpCj4gPiAtCQlyZXR1cm4gLUVQRVJNOwo+
ID4gLQo+ID4gLQlmbHVzaF9pY2FjaGVfcmFuZ2UocGMsIHBjICsgTUNPVU5UX0lOU05fU0laRSk7
Cj4gPiArCV9fcGF0Y2hfdGV4dCgodm9pZCAqKXBjLCBuZXcpOwo+ID4gIAo+ID4gIAlyZXR1cm4g
MDsKPiA+ICB9Cj4gPiAKPiAKPiBIZWxsbywKPiAKPiBOVklESUEgVGVncmEyMC8zMCBhcmUgbm90
IGJvb3Rpbmcgd2l0aCBDT05GSUdfRlRSQUNFPXksIGJ1dCBldmVuIHdpdGgKPiBDT05GSUdfRlRS
QUNFPW4gdGhpbmdzIGFyZSBub3Qgd29ya2luZyB3ZWxsLgoKT29oLCBJIHRoaW5rIEkgc2VlLiBD
YW4geW91IHRyeSB0aGlzOgoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2tlcm5lbC9mdHJhY2UuYyBi
L2FyY2gvYXJtL2tlcm5lbC9mdHJhY2UuYwppbmRleCAyYTVmZjY5YzI4ZTYuLjEwNDk5ZDQ0OTY0
YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0va2VybmVsL2Z0cmFjZS5jCisrKyBiL2FyY2gvYXJtL2tl
cm5lbC9mdHJhY2UuYwpAQCAtNzgsMTMgKzc4LDEwIEBAIHN0YXRpYyBpbnQgZnRyYWNlX21vZGlm
eV9jb2RlKHVuc2lnbmVkIGxvbmcgcGMsIHVuc2lnbmVkIGxvbmcgb2xkLAogewogCXVuc2lnbmVk
IGxvbmcgcmVwbGFjZWQ7CiAKLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfVEhVTUIyX0tFUk5FTCkp
IHsKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfVEhVTUIyX0tFUk5FTCkpCiAJCW9sZCA9IF9fb3Bj
b2RlX3RvX21lbV90aHVtYjMyKG9sZCk7Ci0JCW5ldyA9IF9fb3Bjb2RlX3RvX21lbV90aHVtYjMy
KG5ldyk7Ci0JfSBlbHNlIHsKKwllbHNlCiAJCW9sZCA9IF9fb3Bjb2RlX3RvX21lbV9hcm0ob2xk
KTsKLQkJbmV3ID0gX19vcGNvZGVfdG9fbWVtX2FybShuZXcpOwotCX0KIAogCWlmICh2YWxpZGF0
ZSkgewogCQlpZiAocHJvYmVfa2VybmVsX3JlYWQoJnJlcGxhY2VkLCAodm9pZCAqKXBjLCBNQ09V
TlRfSU5TTl9TSVpFKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
