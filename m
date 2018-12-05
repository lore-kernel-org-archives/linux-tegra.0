From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/4] drm/edid: Pass connector to AVI inforframe functions
Date: Wed, 5 Dec 2018 10:19:29 +0000
Message-ID: <20181205101929.GP30658@n2100.armlinux.org.uk>
References: <20181120161345.15440-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20181120161345.15440-1-ville.syrjala@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Kyungmin Park <kyungmin.park@samsung.com>, amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>, freedreno@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCBOb3YgMjAsIDIwMTggYXQgMDY6MTM6NDJQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCj4gaW5kZXggYTdjMzlmMzk3OTNmLi4z
OGM2NmZiYzgyNzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Ry
di5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCj4gQEAgLTg0OSw3
ICs4NDksOCBAQCB0ZGE5OTh4X3dyaXRlX2F2aShzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAgewo+ICAJdW5pb24gaGRtaV9pbmZvZnJh
bWUgZnJhbWU7Cj4gIAo+IC0JZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9k
ZSgmZnJhbWUuYXZpLCBtb2RlLCBmYWxzZSk7Cj4gKwlkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zy
b21fZGlzcGxheV9tb2RlKCZmcmFtZS5hdmksCj4gKwkJCQkJCSAmcHJpdi0+Y29ubmVjdG9yLCBt
b2RlKTsKPiAgCWZyYW1lLmF2aS5xdWFudGl6YXRpb25fcmFuZ2UgPSBIRE1JX1FVQU5USVpBVElP
Tl9SQU5HRV9GVUxMOwo+ICAKPiAgCXRkYTk5OHhfd3JpdGVfaWYocHJpdiwgRElQX0lGX0ZMQUdT
X0lGMiwgUkVHX0lGMl9IQjAsICZmcmFtZSk7CgpGb3IgdGhpcywKCkFja2VkLWJ5OiBSdXNzZWxs
IEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgoKVGhhbmtzLgoKLS0gClJNSydzIFBh
dGNoIHN5c3RlbTogaHR0cDovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMv
CkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIu
MU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJw
cyBkb3duIDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
