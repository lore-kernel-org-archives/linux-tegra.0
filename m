From: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2] dma-buf: cleanup dma_buf_export() to
	make it easily extensible
Date: Wed, 28 Jan 2015 17:57:28 +0530
Message-ID: <CAO_48GF7CQvY4dF4RoXytSkAQPf-AMsO9Co_UvpS4hr4TY_Wig@mail.gmail.com>
References: <1422424845-14906-1-git-send-email-sumit.semwal@linaro.org>
 <54C8C612.1030701@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <54C8C612.1030701@linaro.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Dave Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, kgene@kernel.org, Thierry Reding <thierry.reding@gmail.com>, daniel.vetter@intel.com, linux-tegra@vger.kernel.org, rmk+kernel@arm.linux.org.uk, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gMjggSmFudWFyeSAyMDE1IGF0IDE2OjUwLCBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiAyOC8wMS8xNSAwNjowMCwgU3VtaXQgU2Vtd2Fs
IHdyb3RlOgo8c25pcD4KPj4gKy8qKgo+PiArICogaGVscGVyIG1hY3JvIGZvciBleHBvcnRlcnM7
IHplcm9zIGFuZCBmaWxscyBpbiBtb3N0IGNvbW1vbiB2YWx1ZXMKPj4gKyAqLwo+PiArI2RlZmlu
ZSBERUZJTkVfRE1BX0JVRl9FWFBPUlRfSU5GTyhhKSAgICAgICAgICAgICAgICAgICAgICAgIFwK
Pj4gKyAgICAgc3RydWN0IGRtYV9idWZfZXhwb3J0X2luZm8gYSA9IHswfTsgICAgICAgICAgICAg
XAo+PiArICAgICBleHBfaW5mby5leHBfbmFtZSA9IEtCVUlMRF9NT0ROQU1FCj4+ICsKPgo+IFRo
aXMgcmlza3MgZ2VuZXJhdGluZyBDOTkgd2FybmluZ3MgdW5sZXNzIHVzZWQgd2l0aCBjYXJlIChh
bmQgb25seSBvbmNlCj4gcGVyIGZ1bmN0aW9uKS4gU2hvdWxkbid0IHRoaXMgYmUgbW9yZSBsaWtl
Ogo+Cj4gI2RlZmluZSBERUZJTkVfRE1BX0JVRl9FWFBPUlRfSU5GTyhhKSBcCj4gICAgIHN0cnVj
dCBkbWFfYnVmX2V4cG9ydF9pbmZvIGEgPSB7IC5leHBfbmFtZSA9IEtCVUlMRF9NT0ROQU1FIH0K
PgoKQWghIE15IGJhZDsgdGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLCBEYW5pZWw7IEknbGwgc2Vu
ZCBvdXQgdGhlCnVwZGF0ZWQgcGF0Y2ggaW4gYSBtaW51dGUhCj4gRGFuaWVsLgo+CgoKCi0tIApU
aGFua3MgYW5kIHJlZ2FyZHMsCgpTdW1pdCBTZW13YWwKS2VybmVsIFRlYW0gTGVhZCAtIExpbmFy
byBNb2JpbGUgR3JvdXAKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
