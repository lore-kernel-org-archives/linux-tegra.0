From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 18/32] drm/tegra: sor: Hook up I2C-over-AUX to output
Date: Thu, 24 Oct 2019 18:45:20 +0200
Message-ID: <20191024164534.132764-19-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgaXMgbmVjZXNz
YXJ5IGZvciB0aGUgb3V0cHV0IGFic3RyYWN0aW9uIHRvIHJldHJpZXZlIGEgbGlzdCBvZiB2YWxp
ZAptb2RlcyBmcm9tIHRoZSBFRElEIG9mIGEgY29ubmVjdGVkIHBhbmVsL21vbml0b3IuIFRoaXMg
d2lsbCBiZSB1c2VmdWwgaW4KY29uanVuY3Rpb24gd2l0aCBEaXNwbGF5UG9ydCBzdXBwb3J0IHRo
YXQgd2lsbCBiZSBhZGRlZCBpbiBhIHN1YnNlcXVlbnQKcGF0Y2gsIHNvIHRoYXQgdGhlIGRyaXZl
ciBjYW4gcmVhZCBFRElEIHZpYSB0aGUgQVVYIGNoYW5uZWwuCgpTaWduZWQtb2ZmLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9zb3IuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMKaW5kZXggNjM2ODA3ZTA0N2YwLi42Zjk3OWM1ZmZmN2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMK
QEAgLTM1MjQsNiArMzUyNCw4IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkJaWYgKCFzb3ItPmF1eCkKIAkJCXJldHVybiAtRVBS
T0JFX0RFRkVSOworCisJCXNvci0+b3V0cHV0LmRkYyA9ICZzb3ItPmF1eC0+ZGRjOwogCX0KIAog
CWlmICghc29yLT5hdXgpIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
