From: Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] arm: tegra: Restore host1x/dc dm-pre-reloc
	properties
Date: Wed, 11 Jul 2018 18:56:53 +0200
Message-ID: <20180711165653.12738-1-kwizart@gmail.com>
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
aGUgZG0tcHJlLXJlbG9jIHByb3BlcnRpZXMgYXJlIHJlbW92ZWQuCgpUaGlzIGxlYWQgdWJvb3Qg
bm90IHRvIGVuYWJsZSB0aGUgZGlzcGxheSBvbiBwYXowMAoKVGhpcyBwYXRjaCByZXN0b3JlIHRo
ZSBkbS1wcmUtcmVsb2MgcHJvcGVydGllcyBhbGxvd2luZwp0aGUgYm9vdGxvYWRlciB0byBvdXRw
dXQgdG8gdGhlIGRpc3BsYXkgcGFuZWwKCnYyOiAtIEFkZCBtb3JlIGNoYXJhY3RlciB0byBjb21t
aXQgaGFzaAoKU2lnbmVkLW9mZi1ieTogTmljb2xhcyBDaGF1dmV0IDxrd2l6YXJ0QGdtYWlsLmNv
bT4KLS0tCiBhcmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaSB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
ZHRzL3RlZ3JhMjAtdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRz
aQppbmRleCA3YzExOTcyNTUyLi5mNjQ2NjdlNTQ5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9kdHMv
dGVncmEyMC11LWJvb3QuZHRzaQorKysgYi9hcmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRz
aQpAQCAtMSwzICsxLDEzIEBACiAjaW5jbHVkZSA8Y29uZmlnLmg+CiAKICNpbmNsdWRlICJ0ZWdy
YS11LWJvb3QuZHRzaSIKKworCisvIHsKKwlob3N0MXhANTAwMDAwMDAgeworCQl1LWJvb3QsZG0t
cHJlLXJlbG9jOworCQlkY0A1NDIwMDAwMCB7CisJCQl1LWJvb3QsZG0tcHJlLXJlbG9jOworCQl9
OworCX07Cit9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBsaXN0ClUtQm9vdEBsaXN0cy5kZW54LmRlCmh0
dHBzOi8vbGlzdHMuZGVueC5kZS9saXN0aW5mby91LWJvb3QK
