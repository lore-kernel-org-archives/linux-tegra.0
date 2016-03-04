From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v4.5-rc7
Date: Fri,  4 Mar 2016 16:35:18 +0100
Message-ID: <1457105718-12924-1-git-send-email-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOTJlOTYzZjUwZmM3
NDA0MWI1ZTllNzQ0YzMzMGRjYTQ4ZTA0ZjA4ZDoKCiAgTGludXggNC41LXJjMSAoMjAxNi0wMS0y
NCAxMzowNjo0NyAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0
OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy90ZWdyYS9saW51eCB0YWdzL2RybS90
ZWdyYS9mb3ItNC41LXJjNwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGM5NTQ2OWFh
NWExODgzODRjY2Y4YWM1MjBlY2U5MzFjNjZjYWY4YWE6CgogIGdwdTogaG9zdDF4OiBTZXQgRE1B
IG9wcyBvbiBkZXZpY2UgY3JlYXRpb24gKDIwMTYtMDMtMDQgMTY6MjQ6NTcgKzAxMDApCgpUaGFu
a3MsClRoaWVycnkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtL3RlZ3JhOiBGaXhlcyBmb3IgdjQuNS1yYzcKClR3byBz
bWFsbCBmaXhlcyB0aGF0IHJlc3RvcmUgUFJJTUUgc3VwcG9ydC4KCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGFuZHJl
IENvdXJib3QgKDIpOgogICAgICBncHU6IGhvc3QxeDogU2V0IERNQSBtYXNrCiAgICAgIGdwdTog
aG9zdDF4OiBTZXQgRE1BIG9wcyBvbiBkZXZpY2UgY3JlYXRpb24KCiBkcml2ZXJzL2dwdS9ob3N0
MXgvYnVzLmMgfCAyICsrCiBkcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMgfCA3ICsrKysrKysKIGRy
aXZlcnMvZ3B1L2hvc3QxeC9kZXYuaCB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
