From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 03/36] drm/plane: Add optional ->atomic_disable() callback
Date: Thu, 22 Jan 2015 16:57:50 -0200
Message-ID: <20150122185750.GJ2001@joana>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
 <1421750935-4023-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1421750935-4023-4-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

MjAxNS0wMS0yMCBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPjoKCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBJbiBvcmRlciB0
byBwcmV2ZW50IGRyaXZlcnMgZnJvbSBoYXZpbmcgdG8gcGVyZm9ybSB0aGUgc2FtZSBjaGVja3Mg
b3Zlcgo+IGFuZCBvdmVyIGFnYWluLCBhZGQgYW4gb3B0aW9uYWwgLT5hdG9taWNfZGlzYWJsZSBj
YWxsYmFjayB3aGljaCB0aGUgY29yZQo+IGNhbGxzIHVuZGVyIHRoZSByaWdodCBjaXJjdW1zdGFu
Y2VzLgo+IAo+IHYyOiBwYXNzIG9sZCBzdGF0ZSBhbmQgZGV0ZWN0IGVkZ2VzIHRvIGF2b2lkIGNh
bGxpbmcgLT5hdG9taWNfZGlzYWJsZSBvbgo+IGFscmVhZHkgZGlzYWJsZWQgcGxhbmVzLCByZW1v
dmUgcmVkdW5kYW50IGNvbW1lbnQgKERhbmllbCBWZXR0ZXIpCj4gCj4gdjM6IHJlbmFtZSBoZWxw
ZXIgdG8gZHJtX2F0b21pY19wbGFuZV9kaXNhYmxpbmcoKSB0byBjbGFyaWZ5IHRoYXQgaXQgaXMK
PiBjaGVja2luZyBmb3IgdHJhbnNpdGlvbnMsIG1vdmUgaGVscGVyIHRvIGRybV9hdG9taWNfaGVs
cGVyLmgsIGNsYXJpZnkKPiBjaGVjayBmb3IgIW9sZF9zdGF0ZSBhbmQgaXRzIHJlbGF0aW9uIHRv
IHRyYW5zaXRpb25hbCBoZWxwZXJzCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcg
PHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
aGVscGVyLmMgfCAgOSArKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZV9oZWxw
ZXIuYyAgfCAxMCArKysrKysrKystCj4gIGluY2x1ZGUvZHJtL2RybV9hdG9taWNfaGVscGVyLmgg
ICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRl
L2RybS9kcm1fcGxhbmVfaGVscGVyLmggICAgICB8ICAzICsrKwo+ICA0IGZpbGVzIGNoYW5nZWQs
IDU3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogR3VzdGF2byBQ
YWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoKCUd1c3Rhdm8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
