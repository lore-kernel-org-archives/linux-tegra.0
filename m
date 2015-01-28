From: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v3] dma-buf: cleanup dma_buf_export() to make it easily
 extensible
Date: Wed, 28 Jan 2015 19:00:46 +0530
Message-ID: <CAO_48GH3CVPeGUfDTuOgGfYmBnc1CvwVc5GYS6O3=275o0SwCw@mail.gmail.com>
References: <1422449643-7829-1-git-send-email-sumit.semwal@linaro.org>
 <20150128112339.164c55fd@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150128112339.164c55fd@recife.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, Pawel Osciak <pawel@osciak.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, kgene@kernel.org, daniel.vetter@intel.com, linux-tegra@vger.kernel.org, rmk+kernel@arm.linux.org.uk, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

SGkgTWF1cm8sCgpPbiAyOCBKYW51YXJ5IDIwMTUgYXQgMTg6NTMsIE1hdXJvIENhcnZhbGhvIENo
ZWhhYgo8bWNoZWhhYkBvc2cuc2Ftc3VuZy5jb20+IHdyb3RlOgo+IEVtIFdlZCwgMjggSmFuIDIw
MTUgMTg6MjQ6MDMgKzA1MzAKPiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3Jn
PiBlc2NyZXZldToKPgo+PiArLyoqCj4+ICsgKiBoZWxwZXIgbWFjcm8gZm9yIGV4cG9ydGVyczsg
emVyb3MgYW5kIGZpbGxzIGluIG1vc3QgY29tbW9uIHZhbHVlcwo+PiArICovCj4+ICsjZGVmaW5l
IERFRklORV9ETUFfQlVGX0VYUE9SVF9JTkZPKGEpICAgICAgICBcCj4+ICsgICAgIHN0cnVjdCBk
bWFfYnVmX2V4cG9ydF9pbmZvIGEgPSB7IC5leHBfbmFtZSA9IEtCVUlMRF9NT0ROQU1FIH0KPj4g
Kwo+Cj4gSSBzdXNwZWN0IHRoYXQgdGhpcyB3aWxsIGxldCB0aGUgb3RoZXIgZmllbGRzIG5vdCBp
bml0aWFsaXplZC4KPgo+IFlvdSBsaWtlbHkgbmVlZCB0byBkbzoKPgo+ICNkZWZpbmUgREVGSU5F
X0RNQV9CVUZfRVhQT1JUX0lORk8oYSkgICBcCj4gICAgICAgICBzdHJ1Y3QgZG1hX2J1Zl9leHBv
cnRfaW5mbyBhID0geyAgICAgICAgXAo+ICAgICAgICAgLmV4cF9uYW1lID0gS0JVSUxEX01PRE5B
TUU7ICAgICAgICAgICAgIFwKPiAgICAgICAgIC5maWVsZHMgPSAwOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gLi4uCj4gfQpJIHN1c3BlY3RlZCB0aGUgc2FtZSwgYnV0IERhbmllbCBr
aW5kbHkgcmVmZXJyZWQgdG8gdGhlIEM5OSBzdGFuZGFyZCwKd2hpY2ggc3RhdGVzOgoiIElmIHRo
ZXJlIGFyZSBmZXdlciBpbml0aWFsaXplcnMgaW4gYSBicmFjZS1lbmNsb3NlZCBsaXN0IHRoYW4g
dGhlcmUKYXJlIGVsZW1lbnRzIG9yIG1lbWJlcnMKb2YgYW4gYWdncmVnYXRlLCBvciBmZXdlciBj
aGFyYWN0ZXJzIGluIGEgc3RyaW5nIGxpdGVyYWwgdXNlZCB0bwppbml0aWFsaXplIGFuIGFycmF5
IG9mIGtub3duCnNpemUgdGhhbiB0aGVyZSBhcmUgZWxlbWVudHMgaW4gdGhlIGFycmF5LCB0aGUg
cmVtYWluZGVyIG9mIHRoZQphZ2dyZWdhdGUgc2hhbGwgYmUKaW5pdGlhbGl6ZWQgaW1wbGljaXRs
eSB0aGUgc2FtZSBhcyBvYmplY3RzIHRoYXQgaGF2ZSBzdGF0aWMgc3RvcmFnZSBkdXJhdGlvbi4i
CgpTbyBJIHRoaW5rIHdlJ3JlIHdlbGwgY292ZXJlZCB0aGVyZT8KPgo+IFJlZ2FyZHMsCj4gTWF1
cm8KCgoKLS0gClRoYW5rcyBhbmQgcmVnYXJkcywKClN1bWl0IFNlbXdhbApLZXJuZWwgVGVhbSBM
ZWFkIC0gTGluYXJvIE1vYmlsZSBHcm91cApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
