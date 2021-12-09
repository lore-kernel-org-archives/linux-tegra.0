Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB50C43217
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbhLIR3J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242862AbhLIR3I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:08 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9AB7C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:34 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q3so10939880wru.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NwDVLLOpstvURWBNQkl8aI5dnUgYEM/XX1KwlvI9g3U=;
        b=bJVcZgZAnvKwdsFo1J1oS8SVcxKekJvx3FqsppsJDi7qvt/5Im+7gWhMue20L7Szu8
         IZqkkKe3cSbMEfok3OI7kn4NjxqvmFTEgjDC8q8KnB89oF099nQe45iEYhzo5q+KeP6a
         f17v1ZubegKUiY0yHtw+YKVMmjKQfPhidzU+cHCPfQUIcwQPq4y2HgQZsTMGQ10sTUXs
         z7B6yGIzlIoizYHse6o7Sdbjqj/M98u89J0IzeVr/JeKLs61gcvBy19cDCo7oQxo3SvN
         q5sNWFH4Ih3Xir6+ByawaeL1YNGiIEbtgtF7vqRQb8Zxk9i3OWJ1fI6lZzds1JBSTQUi
         UO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NwDVLLOpstvURWBNQkl8aI5dnUgYEM/XX1KwlvI9g3U=;
        b=4FDmxBgrh9+UK9+sk77+NH3mhQEXvIO6MqVBj5qP1wEK2Pc0fzPVRtZPO/aizTaLhK
         nenh3KVF1M0DNYkEFdgMq2MCAd4+SOzr083sJYBpCf4ZekeUBWVr4bHAnN9h4iGK4AQY
         yaRwT+IJrxyQSh++AqA6+QbBKMuVaZYBTsFaR6Qog1Kf3wNgxlPLPyPY56TtJDZ1/mkX
         HvbPAicjuuURxSxqRNFi78aWa6wMcQGyjYlq0HBiuJdRUS3CHdIJVVQB6wM8S+BlrB7O
         9pfecLBlpQ1QNvTPAi0LbgbAFW6y41633MISHLQhLZCU2w2DoSIbC1A6czIzwjHjIEXU
         S49A==
X-Gm-Message-State: AOAM532eDeNd6WGykGM4Ug2eXnV3vGCCZPxanN74DRtmQi1dzek+lZR6
        6e39jlf4BFK//vPOPKEuJcU=
X-Google-Smtp-Source: ABdhPJxezVtcfmx4G3QQg3qyaIrvYPazNU/62Orq4RW1Js9N6F4dZW+avFua0TsmdbfAntdZ9LqBOg==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr7889014wrq.264.1639070733383;
        Thu, 09 Dec 2021 09:25:33 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h2sm290009wrz.23.2021.12.09.09.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 11/30] arm64: tegra: Rename thermal zones nodes
Date:   Thu,  9 Dec 2021 18:24:44 +0100
Message-Id: <20211209172503.617716-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DT schema requires that nodes representing thermal zones include a
"-thermal" suffix in their name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      | 11 ++++---
 .../nvidia/tegra186-p3509-0000+p3636-0001.dts | 14 ++++-----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      | 27 ++++++++---------
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  6 ++--
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  |  6 ++--
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 30 ++++++++-----------
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  8 ++---
 8 files changed, 49 insertions(+), 55 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index e41671fcd7e3..3673f79adf1a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -895,7 +895,7 @@ throttle_heavy: heavy {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <0>;
 
@@ -923,7 +923,8 @@ map0 {
 				};
 			};
 		};
-		mem {
+
+		mem-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 
@@ -950,7 +951,8 @@ cooling-maps {
 				 */
 			};
 		};
-		gpu {
+
+		gpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <0>;
 
@@ -978,7 +980,8 @@ map0 {
 				};
 			};
 		};
-		pllx {
+
+		pllx-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 28d59792eaa1..33e707ef883b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -633,7 +633,7 @@ vdd_hdmi: regulator-vdd-hdmi {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
@@ -687,28 +687,28 @@ cpu-passive {
 			};
 		};
 
-		gpu {
+		aux-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
 
 			trips {
-				gpu_alert0: critical {
-					temperature = <99000>;
+				aux_alert0: critical {
+					temperature = <90000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
 		};
 
-		aux {
+		gpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
 
 			trips {
-				aux_alert0: critical {
-					temperature = <90000>;
+				gpu_alert0: critical {
+					temperature = <99000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 35679d2eda69..f4642ceacc63 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1946,12 +1946,12 @@ sound {
 	};
 
 	thermal-zones {
-		a57 {
+		/* Cortex-A57 cluster */
+		cpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <1000>;
 
-			thermal-sensors =
-				<&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_CPU>;
+			thermal-sensors = <&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_CPU>;
 
 			trips {
 				critical {
@@ -1965,12 +1965,12 @@ cooling-maps {
 			};
 		};
 
-		denver {
+		/* Denver cluster */
+		aux-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <1000>;
 
-			thermal-sensors =
-				<&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_AUX>;
+			thermal-sensors = <&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_AUX>;
 
 			trips {
 				critical {
@@ -1984,12 +1984,11 @@ cooling-maps {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <1000>;
 
-			thermal-sensors =
-				<&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_GPU>;
+			thermal-sensors = <&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_GPU>;
 
 			trips {
 				critical {
@@ -2003,12 +2002,11 @@ cooling-maps {
 			};
 		};
 
-		pll {
+		pll-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <1000>;
 
-			thermal-sensors =
-				<&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_PLLX>;
+			thermal-sensors = <&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_PLLX>;
 
 			trips {
 				critical {
@@ -2022,12 +2020,11 @@ cooling-maps {
 			};
 		};
 
-		always_on {
+		ao-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <1000>;
 
-			thermal-sensors =
-				<&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_AO>;
+			thermal-sensors = <&bpmp_thermal TEGRA186_BPMP_THERMAL_ZONE_AO>;
 
 			trips {
 				critical {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 9f34871b8f60..b79d7d89cf62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2097,7 +2097,7 @@ sound {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
@@ -2151,7 +2151,7 @@ cpu-passive {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
@@ -2165,7 +2165,7 @@ gpu_alert0: critical {
 			};
 		};
 
-		aux {
+		aux-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 8d3999cd1af2..76d94ecd1cfe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -2103,7 +2103,7 @@ sound {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
@@ -2157,7 +2157,7 @@ cpu-passive {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
@@ -2171,7 +2171,7 @@ gpu_alert0: critical {
 			};
 		};
 
-		aux {
+		aux-thermal {
 			polling-delay = <0>;
 			polling-delay-passive = <500>;
 			status = "okay";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index a0025b1c425f..14868e877c63 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2739,39 +2739,33 @@ tcu: tcu {
 	};
 
 	thermal-zones {
-		cpu {
-			thermal-sensors = <&{/bpmp/thermal}
-					   TEGRA194_BPMP_THERMAL_ZONE_CPU>;
+		cpu-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA194_BPMP_THERMAL_ZONE_CPU>;
 			status = "disabled";
 		};
 
-		gpu {
-			thermal-sensors = <&{/bpmp/thermal}
-					   TEGRA194_BPMP_THERMAL_ZONE_GPU>;
+		gpu-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA194_BPMP_THERMAL_ZONE_GPU>;
 			status = "disabled";
 		};
 
-		aux {
-			thermal-sensors = <&{/bpmp/thermal}
-					   TEGRA194_BPMP_THERMAL_ZONE_AUX>;
+		aux-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA194_BPMP_THERMAL_ZONE_AUX>;
 			status = "disabled";
 		};
 
-		pllx {
-			thermal-sensors = <&{/bpmp/thermal}
-					   TEGRA194_BPMP_THERMAL_ZONE_PLLX>;
+		pllx-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA194_BPMP_THERMAL_ZONE_PLLX>;
 			status = "disabled";
 		};
 
-		ao {
-			thermal-sensors = <&{/bpmp/thermal}
-					   TEGRA194_BPMP_THERMAL_ZONE_AO>;
+		ao-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA194_BPMP_THERMAL_ZONE_AO>;
 			status = "disabled";
 		};
 
-		tj {
-			thermal-sensors = <&{/bpmp/thermal}
-					   TEGRA194_BPMP_THERMAL_ZONE_TJ_MAX>;
+		tj-thermal {
+			thermal-sensors = <&{/bpmp/thermal} TEGRA194_BPMP_THERMAL_ZONE_TJ_MAX>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 283b50febb6f..9e60ebf2f5c0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1684,7 +1684,7 @@ fan: fan {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			trips {
 				cpu_trip_critical: critical {
 					temperature = <96500>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index ccdc0dec4e59..af9237ad03c1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1981,7 +1981,7 @@ sound {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <0>;
 
@@ -2010,7 +2010,7 @@ map0 {
 			};
 		};
 
-		mem {
+		mem-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 
@@ -2056,7 +2056,7 @@ dram-active {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <0>;
 
@@ -2085,7 +2085,7 @@ map0 {
 			};
 		};
 
-		pllx {
+		pllx-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 
-- 
2.34.1

