From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 01/20] drm/atomic: Fix remaining places
 where !funcs->best_encoder is valid
Date: Thu, 2 Jun 2016 23:40:04 +0100
Message-ID: <20160602224004.GA1819@nuc-i3427.alporthouse.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464877907-27723-2-git-send-email-boris.brezillon@free-electrons.com>
 <8671722.LHaiaBNqfE@avalon>
 <CAKMK7uHyqNbA8Scw2fE0geAyNt0a0XVtzf81nwWjEhbZ-gAvKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uHyqNbA8Scw2fE0geAyNt0a0XVtzf81nwWjEhbZ-gAvKw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Re ding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Daniel Vetter <daniel.vetter@intel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Alexey Brodkin <abrodkin@synopsys.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>in
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBKdW4gMDIsIDIwMTYgYXQgMTE6NTc6MDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBkcm1fZW5jb2Rlcl9maW5kIGlzIGFuIGlkciBsb29rdXAuIFRoYXQgc2hvdWxkIGJl
IHBsZW50eSBmYXN0LAo+IGVzcGVjaWFsbHkgZm9yIG1vZGVzZXQgY29kZS4gVXN1YWxseSB3aGF0
J3MgdG9vIGV4cGVuc2l2ZSBldmVuIGZvcgo+IG1vZGVzZXQgY29kZSBpcyBsaW5lYXIgbGlzdCB3
YWxrcy4gQnV0IENocmlzIGp1c3Qgc3VibWl0dGVkIHBhdGNoZXMgdG8KPiBjb252ZXJ0IG1vc3Qg
b2YgdGhlbSBpbnRvIHNpbXBsZSBsb29rdXBzLgoKRm9yIHRoZSBpZHJfZmluZCwgSSdtIHRlbXB0
ZWQgdG8gcmVwbGFjZSB0aGUgbXV0ZXggd2l0aCBhIHJ3bG9jay4gSXQKaGVscHMgcGF0aG9sb2dp
Y2FsIGNhc2VzLCBidXQgaW4gcmVhbGl0eSB0aGVyZSBhcmUgbW9yZSBjcnVjaWFsCmxvY2tzIGFy
b3VuZCB0aGUgaHcgdGhhdCBsaW1pdCBjb25jdXJyZW5jeS4gOy0pCi1DaHJpcwoKLS0gCkNocmlz
IFdpbHNvbiwgSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50cmUKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
