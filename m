From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 7/9] ARM: vt8500: Provide regulator to pwm-backlight
Date: Tue, 19 Mar 2013 11:59:31 -0700
Message-ID: <1363719573-20926-8-git-send-email-achew@nvidia.com>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363719573-20926-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The pwm-backlight driver now takes a mandatory regulator that is gotten
during driver probe.  Initialize a dummy regulator to satisfy this
requirement.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/wm8850-w70v2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/wm8850-w70v2.dts b/arch/arm/boot/dts/wm8850-w70v2.dts
index fcc660c..47a0b1a 100644
--- a/arch/arm/boot/dts/wm8850-w70v2.dts
+++ b/arch/arm/boot/dts/wm8850-w70v2.dts
@@ -37,11 +37,17 @@
 		};
 	};
 
+	bl_en: fixed-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "bl-en-supply";
+	};
+
 	backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 0 50000 1>;	/* duty inverted */
 
 		brightness-levels = <0 40 60 80 100 130 190 255>;
 		default-brightness-level = <5>;
+		enable-supply = <&bl_en>;
 	};
 };
-- 
1.8.1.5
