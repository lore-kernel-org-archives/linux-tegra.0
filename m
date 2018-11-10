From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/2] ARM: tegra: enable SMP boot with TF
Date: Sat, 10 Nov 2018 22:18:08 +0100
Message-ID: <cover.1541884486.git.mirq-linux@rere.qmqm.pl>
References: <cover.1541882833.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

VGhpcyBwYXRjaHNldCBlbmFibGVzIHN0YXJ0aW5nIHVwIGFsbCBjb3JlcyBvbiBUZWdyYTMgd2l0
aCBUcnVzdGVkCkZvdW5kYXRpb25zIGZpcm13YXJlLiBUaGlzIGlzIFRlZ3JhLXNwZWNpZmljIHBh
cnQgYW5kIGRlcGVuZHMgb24KIkFSTTogZW5hYmxlIGNhY2hlIHZpYSBUcnVzdGVkIEZvdW5kYXRp
b25zIGZpcm13YXJlIiBwYXRjaHNldCBzZW50CmVhcmxpZXIuCgpNaWNoYcWCIE1pcm9zxYJhdyAo
Mik6CiAgQVJNOiB0ZWdyYTogZW5hYmxlIGNhY2hlIHZpYSBURgogIEFSTTogdGVncmE6IGF2b2lk
IHRvdWNoaW5nIFNlY3VyZSByZWdpc3RlcnMgaW4gcmVzZXQgaGFuZGxlcgoKIGFyY2gvYXJtL2Zp
cm13YXJlL3RydXN0ZWRfZm91bmRhdGlvbnMuYyAgICB8ICA2ICsrKy0tCiBhcmNoL2FybS9pbmNs
dWRlL2FzbS90cnVzdGVkX2ZvdW5kYXRpb25zLmggfCAgNiArKystLQogYXJjaC9hcm0vbWFjaC10
ZWdyYS9yZXNldC1oYW5kbGVyLlMgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrLQog
YXJjaC9hcm0vbWFjaC10ZWdyYS9yZXNldC5jICAgICAgICAgICAgICAgIHwgIDUgKysrLQogYXJj
aC9hcm0vbWFjaC10ZWdyYS9yZXNldC5oICAgICAgICAgICAgICAgIHwgIDUgKystLQogYXJjaC9h
cm0vbWFjaC10ZWdyYS90ZWdyYS5jICAgICAgICAgICAgICAgIHwgIDYgKysrLS0KIDYgZmlsZXMg
Y2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgotLSAKMi4xOS4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
