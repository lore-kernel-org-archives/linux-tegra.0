From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Populate SOR power domain for DSI
Date: Fri, 1 Jul 2016 14:21:39 +0100
Message-ID: <1467379299-11961-3-git-send-email-jonathanh@nvidia.com>
References: <1467379299-11961-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467379299-11961-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

VGhlIERTSSBkZXZpY2UgcmVxdWlyZXMgdGhhdCB0aGUgU09SIHBvd2VyIHBhcnRpdGlvbiBpcyBl
bmFibGVkIHdoZW4KYWN0aXZlLiBQb3B1bGF0ZSB0aGlzIHBvd2VyIHBhcnRpdGlvbiBmb3IgdGhl
IFRlZ3JhMjEwIERTSSBub2Rlcy4KClNpZ25lZC1vZmYtYnk6IEpvbiBIdW50ZXIgPGpvbmF0aGFu
aEBudmlkaWEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMjEwLmR0
c2kgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmEyMTAuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbnZpZGlhL3RlZ3JhMjEwLmR0c2kKaW5kZXggOTljNWU5ZjY5ZjcyLi4yODg1YTExOWI0
MzAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMjEwLmR0c2kK
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmEyMTAuZHRzaQpAQCAtMTA5LDYg
KzEwOSw3IEBACiAJCQljbG9jay1uYW1lcyA9ICJkc2kiLCAibHAiLCAicGFyZW50IjsKIAkJCXJl
c2V0cyA9IDwmdGVncmFfY2FyIDQ4PjsKIAkJCXJlc2V0LW5hbWVzID0gImRzaSI7CisJCQlwb3dl
ci1kb21haW5zID0gPCZwZF9zb3I+OwogCQkJbnZpZGlhLG1pcGktY2FsaWJyYXRlID0gPCZtaXBp
IDB4MGMwPjsgLyogRFNJQSAmIERTSUIgcGFkcyAqLwogCiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
OwpAQCAtMTM4LDYgKzEzOSw3IEBACiAJCQljbG9jay1uYW1lcyA9ICJkc2kiLCAibHAiLCAicGFy
ZW50IjsKIAkJCXJlc2V0cyA9IDwmdGVncmFfY2FyIDgyPjsKIAkJCXJlc2V0LW5hbWVzID0gImRz
aSI7CisJCQlwb3dlci1kb21haW5zID0gPCZwZF9zb3I+OwogCQkJbnZpZGlhLG1pcGktY2FsaWJy
YXRlID0gPCZtaXBpIDB4MzAwPjsgLyogRFNJQyAmIERTSUQgcGFkcyAqLwogCiAJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOwotLSAKMi4xLjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
