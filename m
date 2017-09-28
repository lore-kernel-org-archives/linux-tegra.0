From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 5/6] gpu: host1x: Fix incorrect comment for channel_request
Date: Thu, 28 Sep 2017 15:50:43 +0300
Message-ID: <20170928125044.32516-6-mperttunen@nvidia.com>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170928125044.32516-1-mperttunen@nvidia.com>
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
dmlkaWEuY29tPgpSZXZpZXdlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2hvc3QxeC9jaGFubmVsLmMgfCAzICstLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2hvc3QxeC9jaGFubmVsLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvY2hhbm5lbC5jCmluZGV4
IGRiOWI5MWQxMzg0Yy4uMmZiOTNjMjdjMWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9ob3N0
MXgvY2hhbm5lbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9jaGFubmVsLmMKQEAgLTEyOCw4
ICsxMjgsNyBAQCBzdGF0aWMgc3RydWN0IGhvc3QxeF9jaGFubmVsICphY3F1aXJlX3VudXNlZF9j
aGFubmVsKHN0cnVjdCBob3N0MXggKmhvc3QpCiAgKiBob3N0MXhfY2hhbm5lbF9yZXF1ZXN0KCkg
LSBBbGxvY2F0ZSBhIGNoYW5uZWwKICAqIEBkZXZpY2U6IEhvc3QxeCB1bml0IHRoaXMgY2hhbm5l
bCB3aWxsIGJlIHVzZWQgdG8gc2VuZCBjb21tYW5kcyB0bwogICoKLSAqIEFsbG9jYXRlcyBhIG5l
dyBob3N0MXggY2hhbm5lbCBmb3IgQGRldmljZS4gSWYgdGhlcmUgYXJlIG5vIGZyZWUgY2hhbm5l
bHMsCi0gKiB0aGlzIHdpbGwgc2xlZXAgdW50aWwgb25lIGJlY29tZXMgYXZhaWxhYmxlLiBNYXkg
cmV0dXJuIE5VTEwgaWYgQ0RNQQorICogQWxsb2NhdGVzIGEgbmV3IGhvc3QxeCBjaGFubmVsIGZv
ciBAZGV2aWNlLiBNYXkgcmV0dXJuIE5VTEwgaWYgQ0RNQQogICogaW5pdGlhbGl6YXRpb24gZmFp
bHMuCiAgKi8KIHN0cnVjdCBob3N0MXhfY2hhbm5lbCAqaG9zdDF4X2NoYW5uZWxfcmVxdWVzdChz
dHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
