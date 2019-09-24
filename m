From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache
 implementation
Date: Tue, 24 Sep 2019 10:50:22 +0200
Message-ID: <20190924085022.GB18171@8bytes.org>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-5-thierry.reding@gmail.com>
 <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
 <20190916154946.GD7488@ulmo> <20190916155443.GF7488@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190916155443.GF7488@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

SGkgVGhpZXJyeSwKCk9uIE1vbiwgU2VwIDE2LCAyMDE5IGF0IDA1OjU0OjQzUE0gKzAyMDAsIFRo
aWVycnkgUmVkaW5nIHdyb3RlOgo+ID4gSm9lcmcsIHRvIHN1bW1hcml6ZTogdGhlIHByb3Bvc2Fs
IGhlcmUgaXMgdG8gbW92ZSB0aGUgZGVjbGFyYXRpb24gb2YgdGhlCj4gPiBpb21tdV9md3NwZWMg
b3V0c2lkZSBvZiB0aGUgSU9NTVVfQVBJIGd1YXJkIGFuZCBwcm92aWRlIGEgZHVtbXkKPiA+IGlt
cGxlbWVudGF0aW9uIG9mIGRldl9pb21tdV9md3NwZWNfZ2V0KCkgdG8gYWxsb3cgdGhpcyBjb2Rl
IHRvIGJlIGJ1aWx0Cj4gPiB3aXRob3V0IHRoZSAjaWZkZWYgZ3VhcmRzLiBXZSBoYWQgZGlzY3Vz
c2VkIHNvbWV0aGluZyBzaW1pbGFyIGFib3V0IDUKPiA+IHllYXJzIGJhY2sgYW5kIGF0IHRoZSB0
aW1lIHlvdSBoYWQgYmVlbiBvcHBvc2VkOgo+ID4gCj4gPiAJaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaW9tbXUvMTQwNjg5NzExMy0yMDA5OS0xLWdpdC1zZW5kLWVtYWlsLXRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbS8KPiA+IAo+ID4gVGhlIGNhc2UgaGVyZSBpcyBzbGlnaHRseSBkaWZm
ZXJlbnQgYW5kIGEgbG90IG9mIHRpbWUgaGFzIHBhc3NlZCBzaW5jZSwKPiA+IHNvIGp1c3Qgd2Fu
dGVkIHRvIGFzayBpZiB5b3VyIG9waW5pb24gaGVyZSBpcyB0aGUgc2FtZSwgb3Igd2hldGhlciB5
b3UKPiA+IHdvdWxkIGFjY2VwdCBhIHBhdGNoIHRvIG1ha2UgdGhpcyBidWlsZGFibGUgd2l0aG91
dCByZXNvcnRpbmcgdG8KPiA+ICNpZmRlZidlcnkuCgpUaGlzIGlzIGFib3V0IERSTSwgc28gaWYg
aXQgaXMgZmluZSB0byBidWlsZCBkcm0vbm91dmVhdSB3aXRob3V0CklPTU1VLUFQSSBJIGFtIGFs
c28gZmluZSB3aXRoIGR1bW15cyBmb3IgZGV2X2lvbW11X2Z3c3BlY19nZXQoKSBhbmQgYQpkdW1t
eSAnc3RydWN0IGlvbW11X2Z3c3BlYycuCgpSZWdhcmRzLAoKCUpvZXJnCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
