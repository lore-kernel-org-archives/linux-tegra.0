Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26956C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10B0761027
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234978AbhKLMjE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbhKLMjE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:39:04 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96922C061767;
        Fri, 12 Nov 2021 04:36:13 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u1so15214494wru.13;
        Fri, 12 Nov 2021 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ojds7uoTrXBLCO1H2MYmLZ4nSe7NxxdQakvrVqtQ3RE=;
        b=hwwBk2QZDR/NziyD3Xe1C4hppuXJVGLMkrC/mDiGumcaNCjlXJyniamyq9c+kGs6fz
         KsfmvGRkiA/lUWhbDRrsGYGGayK4C6Pd90ZoT1Z9Qhbt7oBIfcAm52LsmUwME430d+0I
         jwj2fkjCqrJT+Lat5nXUMR1HXHLH4kMuMuT6d80WINlfy8yct0VPa4lvAuHab9vvmzi1
         DOENga+dNFLvumna+1ZlHqgHkqP42+5jnuIZhjEnXHXYUWREthH87lmZVPM/BSgBMhLr
         zdV+KcUSNgxIPgGs+cIBScpPjB1XSjEMmc6vPPazDjjY4maPNPg4PbqiMZYLjf/s07es
         NNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ojds7uoTrXBLCO1H2MYmLZ4nSe7NxxdQakvrVqtQ3RE=;
        b=7Eyd0cWZ95oT48dZbXLMXNujbmFq/aHeCHcAlgQl2jy3zJpyFBQfoGob0mszJhhw6H
         BvtEqvbU1GAUetIGhEaV23whUbw2cvlTbP2PFaQ9LV+240ca1qIoyZHFpKE95s+r3kYa
         g84Kmfan/aSWDGHcL3e92xiXvgLQjkLCvBL5zF+H5fdx0wkXp8utFnZStk+5sagvfBGn
         BmdhWat6whgd9FomJs0VXYOWThrha9nLwc2Qi8m/Bb6+Lagr0ds773L/5bm2dj/9iDI7
         cZMjtfALB6p/XfjgtgS+bdwUe7jGobxjGCo4GpWGFnZlXalItWx+Y4HODSxxzYZIc4F+
         lk5w==
X-Gm-Message-State: AOAM531GfQC4aWaiTTlUNYMGQtkEnIFKYWF5CmZFIc7+6majoXxV/wfv
        0CidWa4w4OeMN/P83aTY3m103i2SxzjYtw==
X-Google-Smtp-Source: ABdhPJyxV1vHoZOMQNPSjOtmt3c6HXHqPIq3WDPyzlEQgipZttT3+ww3S2cMmk61QlvHdq8Biuy1ig==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr17842753wrg.282.1636720572181;
        Fri, 12 Nov 2021 04:36:12 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id q84sm13373795wme.3.2021.11.12.04.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:11 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/11] arm64: tegra: Update Tegra234 BPMP channel addresses
Date:   Fri, 12 Nov 2021 13:35:39 +0100
Message-Id: <20211112123542.3680629-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

On final Tegra234 systems, shared memory for communication with BPMP is
located at offset 0x70000 in SYSRAM.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 400c01acc19f..844cab44aee6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -126,19 +126,19 @@ gic: interrupt-controller@f400000 {
 
 	sram@40000000 {
 		compatible = "nvidia,tegra234-sysram", "mmio-sram";
-		reg = <0x0 0x40000000 0x0 0x50000>;
+		reg = <0x0 0x40000000 0x0 0x80000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x40000000 0x50000>;
+		ranges = <0x0 0x0 0x40000000 0x80000>;
 
-		cpu_bpmp_tx: sram@4e000 {
-			reg = <0x4e000 0x1000>;
+		cpu_bpmp_tx: sram@70000 {
+			reg = <0x70000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
-		cpu_bpmp_rx: sram@4f000 {
-			reg = <0x4f000 0x1000>;
+		cpu_bpmp_rx: sram@71000 {
+			reg = <0x71000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
 		};
-- 
2.33.1

