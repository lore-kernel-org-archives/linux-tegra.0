Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B390C433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 946EF23119
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzAZ6GdE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgHFRIp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730051AbgHFRGV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:21 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78872C000384
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:41:21 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i26so32157687edv.4
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGFtKaxSRLcBJrXrSKuT5gcGccZy60brObCwIGGtaO8=;
        b=CzAZ6GdEMPduCQRZpB2RmrNL/aPQmAucOR1IbGT/rdXUhfonhlrw9Yyhb5VglWTryF
         5VDgNO0w3YiqjvNrMEKVMmqdIIqRpj81kByPTBMuVwAxx1p9WpjmtO5p1rD1Htob68AD
         C/wRJjTmcT/aHeuVonU+2Bfq67AScG0tt0aGqbN78tW9PMd0zpTh3oBaD3jdXccRF+sA
         vVINR7JKX8Zi9RunPreq9ui2Rdoo3SKW8XrOQ7xIOIkhT77ytsuiXLpJgRVD82KqrBMR
         4/Dq1jjNdd9sTcbYuiscRhOzM6c9/TE2cKBsfRxYcWJOL+9IJj7j+d0P7PxB1n7gwvN8
         i3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGFtKaxSRLcBJrXrSKuT5gcGccZy60brObCwIGGtaO8=;
        b=i8HcJNhRU4zdVRvapdl6IqcRWwr8Ql/UC4PSrrdbLL3U0T5FDn81sy0LNCcgdK5Vhc
         20zd9ams2MsUiNJZZeFMHrER5QMmqE8K2rtM62ErS/QYke2jfYJCk6+SZdDkgDEbCKVI
         Nsf6FCjwpE0a0K75fUETHIMCa4xaBVHeOxxL1b5FmK0m42oTYOO+5sJ58s8ecyvnlDMu
         7USA1HbURovN9096/n7zYimrePPOTMWnv0Ver6WeJnQuaDi8qBk7oahOkofynV5FAmva
         sRyt9QfPSUUmDSPKkftXxrdu2e6Cbh+mEEVhucZlkiy8mTBeiASJIsYETEwWhxHTvs7O
         AX/w==
X-Gm-Message-State: AOAM532Xj+K7jS/uDOcn6r1tmuNYTCxplT/hWwS6bzttO4z4wuTboQNf
        RmaxpoK9b7ycgVBW6xjXOuY=
X-Google-Smtp-Source: ABdhPJwLviEWksIrCxmqouHOmHK+7GnS5TDxsM5VYn/bHcF5CpczkMp/s8V5gqriDRofNG+osRChVQ==
X-Received: by 2002:a05:6402:847:: with SMTP id b7mr4776884edz.39.1596728480270;
        Thu, 06 Aug 2020 08:41:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id fx15sm4060140ejb.1.2020.08.06.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:41:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] arm64: tegra: Describe display controller outputs for Tegra210
Date:   Thu,  6 Aug 2020 17:41:11 +0200
Message-Id: <20200806154111.3917284-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806154111.3917284-1-thierry.reding@gmail.com>
References: <20200806154111.3917284-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Both display controllers can drive both DSI and both SOR outputs on
Tegra210. Describe this in device tree so that the operating system
doesn't have to guess.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 829f786af133..27d4e3f134ca 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -194,6 +194,7 @@ dc@54200000 {
 
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
+			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
 			nvidia,head = <0>;
 		};
 
@@ -208,10 +209,11 @@ dc@54240000 {
 
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
+			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
 			nvidia,head = <1>;
 		};
 
-		dsi@54300000 {
+		dsia: dsi@54300000 {
 			compatible = "nvidia,tegra210-dsi";
 			reg = <0x0 0x54300000 0x0 0x00040000>;
 			clocks = <&tegra_car TEGRA210_CLK_DSIA>,
@@ -248,7 +250,7 @@ nvjpg@54380000 {
 			status = "disabled";
 		};
 
-		dsi@54400000 {
+		dsib: dsi@54400000 {
 			compatible = "nvidia,tegra210-dsi";
 			reg = <0x0 0x54400000 0x0 0x00040000>;
 			clocks = <&tegra_car TEGRA210_CLK_DSIB>,
@@ -284,7 +286,7 @@ tsec@54500000 {
 			status = "disabled";
 		};
 
-		sor@54540000 {
+		sor0: sor@54540000 {
 			compatible = "nvidia,tegra210-sor";
 			reg = <0x0 0x54540000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -304,7 +306,7 @@ sor@54540000 {
 			status = "disabled";
 		};
 
-		sor@54580000 {
+		sor1: sor@54580000 {
 			compatible = "nvidia,tegra210-sor1";
 			reg = <0x0 0x54580000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.27.0

