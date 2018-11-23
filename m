From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/7] gpu: host1x: Fix syncpoint ID field size on Tegra186
Date: Fri, 23 Nov 2018 13:31:33 +0100
Message-ID: <20181123123138.20739-2-thierry.reding@gmail.com>
References: <20181123123138.20739-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181123123138.20739-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBudW1iZXIgb2Yg
c3luY3BvaW50cyBvbiBUZWdyYTE4NiBpcyA1NzYgYW5kIHRoZXJlZm9yZSBubyBsb25nZXIgZml0
cwppbnRvIDggYml0cy4gSW5jcmVhc2UgdGhlIHNpemUgb2YgdGhlIHN5bmNwb2ludCBJRCBmaWVs
ZCB0byAxMCBpbiBvcmRlcgp0byBhY2NvbW9kYXRlIGFsbCBzeW5jcG9pbnRzLgoKU2lnbmVkLW9m
Zi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9ob3N0MXgvaHcvaHdfaG9zdDF4MDZfdWNsYXNzLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9o
b3N0MXgvaHcvaHdfaG9zdDF4MDZfdWNsYXNzLmggYi9kcml2ZXJzL2dwdS9ob3N0MXgvaHcvaHdf
aG9zdDF4MDZfdWNsYXNzLmgKaW5kZXggNDQ1NzQ4NmM3MmIwLi5lNTk5ZTE1YmY5OTkgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9ody9od19ob3N0MXgwNl91Y2xhc3MuaAorKysgYi9k
cml2ZXJzL2dwdS9ob3N0MXgvaHcvaHdfaG9zdDF4MDZfdWNsYXNzLmgKQEAgLTU5LDcgKzU5LDcg
QEAgc3RhdGljIGlubGluZSB1MzIgaG9zdDF4X3VjbGFzc19pbmNyX3N5bmNwdF9yKHZvaWQpCiAJ
aG9zdDF4X3VjbGFzc19pbmNyX3N5bmNwdF9yKCkKIHN0YXRpYyBpbmxpbmUgdTMyIGhvc3QxeF91
Y2xhc3NfaW5jcl9zeW5jcHRfY29uZF9mKHUzMiB2KQogewotCXJldHVybiAodiAmIDB4ZmYpIDw8
IDg7CisJcmV0dXJuICh2ICYgMHhmZikgPDwgMTA7CiB9CiAjZGVmaW5lIEhPU1QxWF9VQ0xBU1Nf
SU5DUl9TWU5DUFRfQ09ORF9GKHYpIFwKIAlob3N0MXhfdWNsYXNzX2luY3Jfc3luY3B0X2NvbmRf
Zih2KQotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
