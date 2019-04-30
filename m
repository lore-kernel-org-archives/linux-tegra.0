From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] dma-buf: add struct dma_buf_attach_info v2
Date: Tue, 30 Apr 2019 12:59:23 -0400
Message-ID: <acaa403e-ad0f-dcf5-bccb-6b7331381889@oracle.com>
References: <20190430111002.106168-1-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190430111002.106168-1-christian.koenig@amd.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>, xen-devel@lists.xenproject.org, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, sstabellini@kernel.org, jgross@suse.com, digetx@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de, mchehab@kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, pawel@osciak.com, jonathanh@nvidia.com, thierry.reding@gmail.com, tomi.valkeinen@ti.com, rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com, sean@poorly.run, maxime.ripard@bootlin.com, maarten.lankhorst@linux.intel.com, linux@armlinux.org.uk, sumit.semwal@linaro.org
List-Id: linux-tegra@vger.kernel.org

T24gNC8zMC8xOSA3OjEwIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVm
LmMKPiBpbmRleCAyYzRmMzI0Zjg2MjYuLmNhY2NhODMwYjQ4MiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMKPiArKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVm
LmMKPiBAQCAtNjA4LDYgKzYwOCw3IEBAIGRtYWJ1Zl9pbXBfdG9fcmVmcyhzdHJ1Y3QgZ250ZGV2
X2RtYWJ1Zl9wcml2ICpwcml2LCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJICAgaW50IGZkLCBp
bnQgY291bnQsIGludCBkb21pZCkKPiAgewo+ICAJc3RydWN0IGdudGRldl9kbWFidWYgKmdudGRl
dl9kbWFidWYsICpyZXQ7Cj4gKwlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2hfaW5mbyBhdHRhY2hfaW5m
bzsKPiAgCXN0cnVjdCBkbWFfYnVmICpkbWFfYnVmOwo+ICAJc3RydWN0IGRtYV9idWZfYXR0YWNo
bWVudCAqYXR0YWNoOwo+ICAJc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gQEAgLTYyNyw2ICs2Mjgs
OSBAQCBkbWFidWZfaW1wX3RvX3JlZnMoc3RydWN0IGdudGRldl9kbWFidWZfcHJpdiAqcHJpdiwg
c3RydWN0IGRldmljZSAqZGV2LAo+ICAJZ250ZGV2X2RtYWJ1Zi0+cHJpdiA9IHByaXY7Cj4gIAln
bnRkZXZfZG1hYnVmLT5mZCA9IGZkOwo+ICAKPiArCW1lbXNldCgmYXR0YWNoX2luZm8sIDAsIHNp
emVvZihhdHRhY2hfaW5mbykpOwo+ICsJYXR0YWNoX2luZm8uZGV2ID0gZGV2Owo+ICsJYXR0YWNo
X2luZm8uZG1hYnVmID0gZG1hX2J1ZjsKPiAgCWF0dGFjaCA9IGRtYV9idWZfYXR0YWNoKGRtYV9i
dWYsIGRldik7Cj4gIAlpZiAoSVNfRVJSKGF0dGFjaCkpIHsKPiAgCQlyZXQgPSBFUlJfQ0FTVChh
dHRhY2gpOwoKVGhpcyB3b24ndCBidWlsZC4KCkRpZCB5b3UgbWVhbgoKwqDCoMKgIGF0dGFjaCA9
IGRtYV9idWZfYXR0YWNoKCZhdHRhY2hfaW5mbyk7Cgo/CgotYm9yaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVs
QGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==
