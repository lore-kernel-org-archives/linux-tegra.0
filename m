Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FE1C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42CDD6108E
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbhKLNJg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbhKLNJd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:33 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9033AC06127A;
        Fri, 12 Nov 2021 05:06:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u1so15374644wru.13;
        Fri, 12 Nov 2021 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M2FTBYmJcelyUb1EGBR+Qsnp35mKYCD9oISifjns3kM=;
        b=BKd/mPF5efstFqlVR4lUGskwBtfm6cagNlBMrLI+/MeQXUwAULbiVS3NCfLG1ej35o
         TQzN2/AY/YZLS88Beq7D+gnzeCjgXc8ZzzOMBssRfnTUsJF41V51Xms2yfO6M9q8lkaO
         ZtJ+h3u3Dsbyz9rJPJhJEbW8bWLn1grboWuaY2b5ZpuFah243K49OQNOKGrovsyDUN5I
         ZBaPnINgDzSSUB9z67vCBJvCpUv/hMBtQlBoqxULbGuR1bimZhU0ymR0Q837sdjE1OCE
         skeRX6m97SaIL4dIqI9FYjDR392Vy/nZ8x0p7wMkYovKjOCSNz478fBI9k5+ql2XPVFD
         9WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M2FTBYmJcelyUb1EGBR+Qsnp35mKYCD9oISifjns3kM=;
        b=zB0/To9vzCZnVQmnmTBTepINzUqHeKWWk+15VHHP3JBbISvKXld/GIXS49n/aVO5EY
         RsLP3Hx39MT22l1p344KuEBRdpNPKYm9DLTv1pYU53jfSZUAgTEwrisyRwXnktbVYQhH
         BdBlUl0cOBTf+R6soNxLoPFcX3xpE7hDGnrjKBnkBEaEr90CB8NcdUbhDoUNiCz8t7Y9
         MLtWQsFTbkGiKfsTGWVW4EBIE6fCXjRplkJRfMHOQKha3XjbUCp5MxgNsRtfcutS6T4R
         E5wy4ONAjtCmXIhuPqHjXBhNvbzKVNTUZWERsDsExnGiZ75WQG2BBQdyLhYIOfa7w6xa
         pjvA==
X-Gm-Message-State: AOAM532h8ArFfJfSkdIDHDOGPkzjcqIeTdapo2aZFQ+eABYb4CiW0Cxh
        rZqPF2r/k800brL5tbOemZs=
X-Google-Smtp-Source: ABdhPJzM/n60wn5eSwhIr0W3ysEnPzy7SYyt8mm/WkB4Prqov3OqCN/r2A02Tge1d5OVXTJlRkML2A==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr17885066wrm.269.1636722401201;
        Fri, 12 Nov 2021 05:06:41 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k15sm5499182wrx.53.2021.11.12.05.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:06:40 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: tegra: Add memory controller on Tegra234
Date:   Fri, 12 Nov 2021 14:06:26 +0100
Message-Id: <20211112130627.3682795-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130627.3682795-1-thierry.reding@gmail.com>
References: <20211112130627.3682795-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This adds the memory controller and the embedded external memory
controller found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index ad6978ca7162..8893d110a0ae 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/memory/tegra234-mc.h>
 #include <dt-bindings/reset/tegra234-reset.h>
 
 / {
@@ -85,6 +86,54 @@ gpio: gpio@2200000 {
 			gpio-controller;
 		};
 
+		mc: memory-controller@2c00000 {
+			compatible = "nvidia,tegra234-mc";
+			reg = <0x02c00000 0x100000>,
+			      <0x02b80000 0x040000>,
+			      <0x01700000 0x100000>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			#interconnect-cells = <1>;
+			status = "okay";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x01700000 0x0 0x01700000 0x0 0x100000>,
+				 <0x02b80000 0x0 0x02b80000 0x0 0x040000>,
+				 <0x02c00000 0x0 0x02c00000 0x0 0x100000>;
+
+			/*
+			 * Bit 39 of addresses passing through the memory
+			 * controller selects the XBAR format used when memory
+			 * is accessed. This is used to transparently access
+			 * memory in the XBAR format used by the discrete GPU
+			 * (bit 39 set) or Tegra (bit 39 clear).
+			 *
+			 * As a consequence, the operating system must ensure
+			 * that bit 39 is never used implicitly, for example
+			 * via an I/O virtual address mapping of an IOMMU. If
+			 * devices require access to the XBAR switch, their
+			 * drivers must set this bit explicitly.
+			 *
+			 * Limit the DMA range for memory clients to [38:0].
+			 */
+			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
+
+			emc: external-memory-controller@2c60000 {
+				compatible = "nvidia,tegra234-emc";
+				reg = <0x0 0x02c60000 0x0 0x90000>,
+				      <0x0 0x01780000 0x0 0x80000>;
+				clocks = <&bpmp TEGRA234_CLK_EMC>;
+				clock-names = "emc";
+				status = "okay";
+
+				#interconnect-cells = <0>;
+
+				nvidia,bpmp = <&bpmp>;
+			};
+		};
+
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra234-uart", "nvidia,tegra20-uart";
 			reg = <0x03100000 0x10000>;
-- 
2.33.1

