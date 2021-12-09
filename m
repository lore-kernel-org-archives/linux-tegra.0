Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998D1C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243086AbhLIRiP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:15 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8C5C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:41 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so7186618wme.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+b5qn/bCLbD/Z9WmgeM6QIsMrkxU8xfHCM7gXiWdWjQ=;
        b=qrwboBtssRHNwoFUHEqmfT5joDsyUM6MbCCz4O2LVVbgswE1QskVqMdW+C1bTJct3W
         GxazYpkHyoTZQVEAB7cG51mnKEiV0Ei3xXBpU0IeLGODWSwJ2eKAFENODjcNfPgauIC8
         +nL9ZGX3LC43eHOxyx9qrBumTJhEFRYQ5ZnSG6xI4AKAtORkOS1ysOdlF2wkQxEtEhn0
         t7PruXR/RFWxIB/mTqJ8EPZjXuroSrRJ+cIazYqvF4jUSzLzEoyPkShbONY895r7nI9b
         PcrWp2ZQlO9Nd4syH0a81/tQkxiFdob4TDGsVl3Tuy+vWOtcSiuSRk9BrnJBut54gUP2
         55/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+b5qn/bCLbD/Z9WmgeM6QIsMrkxU8xfHCM7gXiWdWjQ=;
        b=7vUy0xmf6iyJHz+36C+CQ/QDzC1jkgcppE2XDaAbAUG1JmL5eVo4kJWPx0wYiO+VXm
         D8dx9H57gQxQNtHlPNngz/LrpioBqGB9MQ9Ya9v90WMfkL6jHYnssoZ/p6/rmze4GjMC
         bpBYItqj/eNNSiO5hwm3du+PmhKW3E9Lj6ZEGgULqQdgFFKmylJY5Zi++1OvdBW2+eQc
         jcA3+cDnDPuLUpsw8X38V5n/bKtiBuCG99GDuyRVeVaXfASZJTp43skse5v8zlXggWCI
         F9L/dNI6sczdoN4GCfLhflSparrqyL03/ggvy+ftLnP+QJfHti/2zLb+3Ulgv4BvfKPC
         7E0Q==
X-Gm-Message-State: AOAM532SM19otoTDm++Y4bueTYRM+5WfyEkmWeQ3B7HXNwjRGd5eyNz9
        x6oh20bUfvoWas6esNUbP0M=
X-Google-Smtp-Source: ABdhPJzaqd/Pb5zOc288m947XH/Q1nC/SfrRISQrXSfiJmjtvq+gExPH3gystSYggztvcvLcb7IH+w==
X-Received: by 2002:a05:600c:3658:: with SMTP id y24mr9015041wmq.161.1639071280078;
        Thu, 09 Dec 2021 09:34:40 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id t8sm483157wmq.32.2021.12.09.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:39 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 15/25] ARM: tegra: Sort Tegra124 XUSB clocks correctly
Date:   Thu,  9 Dec 2021 18:33:46 +0100
Message-Id: <20211209173356.618460-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make the order of the clocks and clock-names properties match the order
in the device tree bindings. This isn't strictly necessary from a point
of view of the operating system because matching will be done based on
the clock-names, but it makes it easier to validate the device trees
against the DT schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 36566a777e49..e87da6c24f7c 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -710,8 +710,8 @@ usb@70090000 {
 			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
 			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
@@ -719,7 +719,7 @@ usb@70090000 {
 			 <&tegra_car TEGRA124_CLK_PLL_E>;
 		clock-names = "xusb_host", "xusb_host_src",
 			      "xusb_falcon_src", "xusb_ss",
-			      "xusb_ss_src", "xusb_ss_div2",
+			      "xusb_ss_div2", "xusb_ss_src",
 			      "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
 		resets = <&tegra_car 89>, <&tegra_car 156>,
-- 
2.34.1

