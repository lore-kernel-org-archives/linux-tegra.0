From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 5/6] gpu: host1x: Fix incorrect comment for channel_request
Date: Tue,  5 Sep 2017 11:10:28 +0300
Message-ID: <20170905081029.19769-6-mperttunen@nvidia.com>
References: <20170905081029.19769-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170905081029.19769-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, digetx@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

VGhpcyBmdW5jdGlvbiBhY3R1YWxseSBkb2Vzbid0IHNsZWVwIGluIHRoZSB2ZXJzaW9uIHRoYXQg
d2FzIG1lcmdlZC4KClNpZ25lZC1vZmYtYnk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5lbkBu
dmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2hvc3QxeC9jaGFubmVsLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2hvc3QxeC9jaGFubmVsLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvY2hhbm5l
bC5jCmluZGV4IGRiOWI5MWQxMzg0Yy4uMmZiOTNjMjdjMWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9ob3N0MXgvY2hhbm5lbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9jaGFubmVsLmMK
QEAgLTEyOCw4ICsxMjgsNyBAQCBzdGF0aWMgc3RydWN0IGhvc3QxeF9jaGFubmVsICphY3F1aXJl
X3VudXNlZF9jaGFubmVsKHN0cnVjdCBob3N0MXggKmhvc3QpCiAgKiBob3N0MXhfY2hhbm5lbF9y
ZXF1ZXN0KCkgLSBBbGxvY2F0ZSBhIGNoYW5uZWwKICAqIEBkZXZpY2U6IEhvc3QxeCB1bml0IHRo
aXMgY2hhbm5lbCB3aWxsIGJlIHVzZWQgdG8gc2VuZCBjb21tYW5kcyB0bwogICoKLSAqIEFsbG9j
YXRlcyBhIG5ldyBob3N0MXggY2hhbm5lbCBmb3IgQGRldmljZS4gSWYgdGhlcmUgYXJlIG5vIGZy
ZWUgY2hhbm5lbHMsCi0gKiB0aGlzIHdpbGwgc2xlZXAgdW50aWwgb25lIGJlY29tZXMgYXZhaWxh
YmxlLiBNYXkgcmV0dXJuIE5VTEwgaWYgQ0RNQQorICogQWxsb2NhdGVzIGEgbmV3IGhvc3QxeCBj
aGFubmVsIGZvciBAZGV2aWNlLiBNYXkgcmV0dXJuIE5VTEwgaWYgQ0RNQQogICogaW5pdGlhbGl6
YXRpb24gZmFpbHMuCiAgKi8KIHN0cnVjdCBob3N0MXhfY2hhbm5lbCAqaG9zdDF4X2NoYW5uZWxf
cmVxdWVzdChzdHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
