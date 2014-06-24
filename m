From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 2/3] drm/ttm: introduce dma cache sync helpers
Date: Tue, 24 Jun 2014 19:33:10 +0900
Message-ID: <53A953E6.2030503@nvidia.com>
References: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
 <1403603667-11302-3-git-send-email-acourbot@nvidia.com>
 <20140624100220.GK32514@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140624100220.GK32514@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

T24gMDYvMjQvMjAxNCAwNzowMiBQTSwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IHdyb3RlOgo+
IE9uIFR1ZSwgSnVuIDI0LCAyMDE0IGF0IDA2OjU0OjI2UE0gKzA5MDAsIEFsZXhhbmRyZSBDb3Vy
Ym90IHdyb3RlOgo+PiBGcm9tOiBMdWNhcyBTdGFjaCA8ZGV2QGx5bnhleWUuZGU+Cj4+Cj4+IE9u
IGFyY2hpdGVjdHVyZXMgZm9yIHdoaWNoIGFjY2VzcyB0byBHUFUgbWVtb3J5IGlzIG5vbi1jb2hl
cmVudCwKPj4gY2FjaGVzIG5lZWQgdG8gYmUgZmx1c2hlZCBhbmQgaW52YWxpZGF0ZWQgZXhwbGlj
aXRseSBhdCB0aGUKPj4gYXBwcm9wcmlhdGUgcGxhY2VzLiBJbnRyb2R1Y2UgdHdvIHNtYWxsIGhl
bHBlcnMgdG8gbWFrZSB0aGluZ3MKPj4gZWFzeSBmb3IgVFRNLWJhc2VkIGRyaXZlcnMuCj4KPiBI
YXZlIHlvdSBydW4gdGhpcyB3aXRoIERNQSBBUEkgZGVidWdnaW5nIGVuYWJsZWQ/ICBJIHN1c3Bl
Y3QgeW91IGhhdmVuJ3QsCj4gYW5kIEkgcmVjb21tZW5kIHRoYXQgeW91IGRvLgoKIyBjYXQgL3N5
cy9rZXJuZWwvZGVidWcvZG1hLWFwaS9lcnJvcl9jb3VudAoxNjI2MjEKCijila/CsOKWocKw77yJ
4pWv77i1IOKUu+KUgeKUuykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
