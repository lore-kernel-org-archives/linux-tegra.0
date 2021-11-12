Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE498C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6AB761075
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbhKLNWC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbhKLNWC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:22:02 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1554C061767;
        Fri, 12 Nov 2021 05:19:11 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so6767023wmd.1;
        Fri, 12 Nov 2021 05:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFFBsweLVulkeHO4uR3+8xjcp2/qK2qrpHp+ypySGyM=;
        b=Udsa077xhK5ZJUzs89kDtRWOUYKaR1FbKy1NgsANG1RHZijYTLLRDTFEk4GQ9cxBzR
         IvQfskrgNOG946FAu0Wsd7KCeZxP9s3vPIvvAqsTJcz958AclOWDusYhf7gBQutUlaVE
         919uOahBjMGlfRP3hAQT7Z4XIe/2JfUqhd2oYmPPLDoKZu0X543q6Nqwus6aAKWCIuap
         d60u7o1RBVoP6BgsJ5TIwyegGoOH6V6r3ObRgLnSBXYEXff34no2rNA5WqfGu24L1ES2
         65IFR2visnhxWUx+hxOh33hmmVOE0JO7WRWiG0gRZ7GJNsNOSHr5/aNbM7S77cgooF2q
         paFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFFBsweLVulkeHO4uR3+8xjcp2/qK2qrpHp+ypySGyM=;
        b=FxDbNZ06AdbGMt5V9NITRSrl3DDWiUi8QLQRjvKCjGhmqHld3mAQWEmacPRCRPe+lP
         RqSytYfDmDts7xKA0s5ICFwR82CSvujao9JUWrKmOMFkSBCzGk5vNUO6PZO4858T1CzH
         BPMEyGb/cnnZoIGQ9nPcRC9z2ueyM9rSrjmmrmu9fEh0FSBqaQohjwJ7fYQZZ1uHtbxc
         dEWCHgSon6HqrONJsDPCsvNmwq9ynRco2AoWm11B6kt8+hAI+I8J9xk0RUvFwBywORdv
         SVyW/9Y+ZsI3WBtbXUKYbkRUbpfPhnY7CB1U7dGooBttPvP5EECcT0yKAF1G85BWwZru
         8ZPw==
X-Gm-Message-State: AOAM533T8EhLXNNAi60dTRzX13xai0xYbwJzE2jDE9tUAWUqPleD3ryt
        5TgXYxnK4i9kt3WDcp+NJzM=
X-Google-Smtp-Source: ABdhPJx2Wv4yULLGcjTlQ7NRcpn8iagTZ2Nm7lMjWp38EEDgUJXE12cUsEg0QAmy8U8sEoy94shItA==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr32969855wmk.172.1636723150208;
        Fri, 12 Nov 2021 05:19:10 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g5sm9006420wri.45.2021.11.12.05.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:19:09 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Describe Tegra234 CPU hierarchy
Date:   Fri, 12 Nov 2021 14:19:04 +0100
Message-Id: <20211112131904.3683428-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112131904.3683428-1-thierry.reding@gmail.com>
References: <20211112131904.3683428-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra234 SoC has 3 clusters of 4 Cortex-A78AE CPU cores each,
for a total of 12 CPUs. Each CPU has 64 KiB instruction and data caches
with each cluster having an additional 256 KiB unified L2 cache and a 2
MiB L3 cache.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 365 ++++++++++++++++++++++-
 1 file changed, 363 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 104e5fdd5f8a..db24f48edc9f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -736,12 +736,373 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0_0: cpu@0 {
+			compatible = "arm,cortex-a78";
 			device_type = "cpu";
-			reg = <0x000>;
+			reg = <0x00000>;
 
 			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c0_0>;
+		};
+
+		cpu0_1: cpu@100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x00100>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c0_1>;
+		};
+
+		cpu0_2: cpu@200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x00200>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c0_2>;
+		};
+
+		cpu0_3: cpu@300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x00300>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c0_3>;
+		};
+
+		cpu1_0: cpu@10000 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x10000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c1_0>;
+		};
+
+		cpu1_1: cpu@10100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x10100>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c1_1>;
+		};
+
+		cpu1_2: cpu@10200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x10200>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c1_2>;
+		};
+
+		cpu1_3: cpu@10300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x10300>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c1_3>;
+		};
+
+		cpu2_0: cpu@20000 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x20000>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c2_0>;
+		};
+
+		cpu2_1: cpu@20100 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x20100>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c2_1>;
+		};
+
+		cpu2_2: cpu@20200 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x20200>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c2_2>;
+		};
+
+		cpu2_3: cpu@20300 {
+			compatible = "arm,cortex-a78";
+			device_type = "cpu";
+			reg = <0x20300>;
+
+			enable-method = "psci";
+
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c2_3>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0_0>;
+				};
+
+				core1 {
+					cpu = <&cpu0_1>;
+				};
+
+				core2 {
+					cpu = <&cpu0_2>;
+				};
+
+				core3 {
+					cpu = <&cpu0_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu1_0>;
+				};
+
+				core1 {
+					cpu = <&cpu1_1>;
+				};
+
+				core2 {
+					cpu = <&cpu1_2>;
+				};
+
+				core3 {
+					cpu = <&cpu1_3>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu2_0>;
+				};
+
+				core1 {
+					cpu = <&cpu2_1>;
+				};
+
+				core2 {
+					cpu = <&cpu2_2>;
+				};
+
+				core3 {
+					cpu = <&cpu2_3>;
+				};
+			};
+		};
+
+		l2c0_0: l2-cache00 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c0>;
+		};
+
+		l2c0_1: l2-cache01 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c0>;
 		};
+
+		l2c0_2: l2-cache02 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c0>;
+		};
+
+		l2c0_3: l2-cache03 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c0>;
+		};
+
+		l2c1_0: l2-cache10 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c1>;
+		};
+
+		l2c1_1: l2-cache11 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c1>;
+		};
+
+		l2c1_2: l2-cache12 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c1>;
+		};
+
+		l2c1_3: l2-cache13 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c1>;
+		};
+
+		l2c2_0: l2-cache20 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c2>;
+		};
+
+		l2c2_1: l2-cache21 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c2>;
+		};
+
+		l2c2_2: l2-cache22 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c2>;
+		};
+
+		l2c2_3: l2-cache23 {
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-unified;
+			next-level-cache = <&l3c2>;
+		};
+
+		l3c0: l3-cache0 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+
+		l3c1: l3-cache1 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+
+		l3c2: l3-cache2 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		status = "okay";
 	};
 
 	psci {
-- 
2.33.1

