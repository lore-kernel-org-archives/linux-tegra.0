From: Neal Liu <neal.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] cpuidle: Fix CFI failure
Date: Mon, 6 Jul 2020 11:13:15 +0800
Message-ID: <1594005196-16327-1-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sami Tolvanen <samitolvanen-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Neal Liu <neal.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Y2hhbmdlcyBzaW5jZSB2MToNCi0gYWRkIG1vcmUgZGVzY3JpcHRpb24gaW4gY29tbWl0IG1lc3Nh
Z2UuDQoNCioqKiBCTFVSQiBIRVJFICoqKg0KDQpOZWFsIExpdSAoMSk6DQogIGNwdWlkbGU6IGNo
YW5nZSBlbnRlcl9zMmlkbGUoKSBwcm90b3R5cGUNCg0KIGRyaXZlcnMvYWNwaS9wcm9jZXNzb3Jf
aWRsZS5jICAgfCA2ICsrKystLQ0KIGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXRlZ3JhLmMgfCA4
ICsrKysrLS0tDQogZHJpdmVycy9pZGxlL2ludGVsX2lkbGUuYyAgICAgICB8IDYgKysrKy0tDQog
aW5jbHVkZS9saW51eC9jcHVpZGxlLmggICAgICAgICB8IDYgKysrLS0tDQogNCBmaWxlcyBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjE4LjANCg==
