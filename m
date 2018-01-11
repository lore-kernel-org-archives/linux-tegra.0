From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v4.15-rc8
Date: Thu, 11 Jan 2018 17:42:21 +0100
Message-ID: <20180111164221.22348-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjBiYjIyMjQ0MGE1
YzgyNzNmNjdkZDM3OTQ2NzA3ZTZiYTZhZDgzMjoKCiAgTWVyZ2UgYnJhbmNoICdsaW51eC00LjE1
JyBvZiBnaXQ6Ly9naXRodWIuY29tL3NrZWdnc2IvbGludXggaW50byBkcm0tZml4ZXMgKDIwMTgt
MDEtMDkgMTI6MDM6MTAgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvdGVncmEvbGludXggdGFncy9k
cm0vdGVncmEvZm9yLTQuMTUtcmM4Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZDc4
MDUzN2Y5YjQ5ZTlkNzE0YTQ1NGU1ZWQ5ODlkOTA5YmVhYjhlYzoKCiAgZHJtL3RlZ3JhOiBzb3I6
IEZpeCBoYW5nIG9uIFRlZ3JhMTI0IGVEUCAoMjAxOC0wMS0xMCAxMzowNDo1OCArMDEwMCkKClRo
YW5rcywKVGhpZXJyeQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkcm0vdGVncmE6IEZpeGVzIGZvciB2NC4xNS1yYzgKCkEg
c2luZ2xlIGZpeCBmb3IgYSBUZWdyYTEyNCBlRFAgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5IHRo
ZSBTT1IgY2hhbmdlcwppbiB2NC4xNS1yYzEuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRoaWVycnkgUmVkaW5nICgxKToK
ICAgICAgZHJtL3RlZ3JhOiBzb3I6IEZpeCBoYW5nIG9uIFRlZ3JhMTI0IGVEUAoKIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
