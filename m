From: Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] arm: tegra: Restore host1x/dc dm-pre-reloc
	properties
Date: Wed, 11 Jul 2018 20:42:19 +0200
Message-ID: <20180711184219.13920-1-kwizart@gmail.com>
References: <20180711151948.21779-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20180711151948.21779-1-kwizart@gmail.com>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: swarren@nvidia.com
Cc: linux-tegra@vger.kernel.org, u-boot@lists.denx.de
List-Id: linux-tegra@vger.kernel.org

U2luY2UgY29tbWl0IGYyZmFmZmVjYjAxNiwgdGVncmE6IENvbnZlcnQgdG8gdXNlIGJpbm1hbgp0
aGUgZG0tcHJlLXJlbG9jIHByb3BlcnRpZXMgYXJlIHJlbW92ZWQuCgpUaGlzIGxlYWRzIHVib290
IG5vdCB0byBlbmFibGUgdGhlIGRpc3BsYXkgb24gcGF6MDAKClRoaXMgcGF0Y2ggcmVzdG9yZSB0
aGUgZG0tcHJlLXJlbG9jIHByb3BlcnRpZXMgYWxsb3dpbmcKdGhlIGJvb3Rsb2FkZXIgdG8gb3V0
cHV0IHRvIHRoZSBkaXNwbGF5IHBhbmVsCgp2MzogLSBGaXggZmV3IHR5cG9zCnYyOiAtIEFkZCBt
b3JlIGNoYXJhY3RlcnMgdG8gY29tbWl0IGhhc2gKClNpZ25lZC1vZmYtYnk6IE5pY29sYXMgQ2hh
dXZldCA8a3dpemFydEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNo
cm9taXVtLm9yZz4KLS0tCiBhcmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaSB8IDEwICsr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vZHRzL3RlZ3JhMjAtdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvdGVncmEyMC11
LWJvb3QuZHRzaQppbmRleCA3YzExOTcyNTUyLi5mNjQ2NjdlNTQ5IDEwMDY0NAotLS0gYS9hcmNo
L2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaQorKysgYi9hcmNoL2FybS9kdHMvdGVncmEyMC11
LWJvb3QuZHRzaQpAQCAtMSwzICsxLDEzIEBACiAjaW5jbHVkZSA8Y29uZmlnLmg+CiAKICNpbmNs
dWRlICJ0ZWdyYS11LWJvb3QuZHRzaSIKKworCisvIHsKKwlob3N0MXhANTAwMDAwMDAgeworCQl1
LWJvb3QsZG0tcHJlLXJlbG9jOworCQlkY0A1NDIwMDAwMCB7CisJCQl1LWJvb3QsZG0tcHJlLXJl
bG9jOworCQl9OworCX07Cit9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBsaXN0ClUtQm9vdEBsaXN0cy5k
ZW54LmRlCmh0dHBzOi8vbGlzdHMuZGVueC5kZS9saXN0aW5mby91LWJvb3QK
