Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F3EC07E96
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CC0461447
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 10:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhGHKjo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 06:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhGHKjn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 06:39:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5B6C061574
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jul 2021 03:37:01 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso3688123wmj.4
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jul 2021 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sKIAzp43GPHBSu1FCv0hVUbO8ZG1NpGSHhgylht/1Zg=;
        b=FjPQAn+m6ILUXNh+Na1REYIshgD/NFG2dbp9OYC2BVYZqVQBTWCGmTnA/LHDczIsCo
         pgKFdkG2fKMzIebZEMjVrHOmHzoZ7r1VurqG6cuMGyx4OUGSzDCPy+PgIl8zZ/4qEO+q
         AdSfox6wvUd+08pc7sTjgAThD2raXTIBpdp66ORJrEI/iWlTncDqyZ12G3dZ9h0H/sCX
         2p1e2/KQtba0aJZL/dYHxR8RpfcWvpwYgiXqzbqQdIHcM35RcHg0awli5tTOq9DIcRo2
         VD7s933iqOa6HbsKH/SX5swCq53ZyIvqnHRWmshri6u79E1sUKRNtAihlzYp6BUeEJAd
         dGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sKIAzp43GPHBSu1FCv0hVUbO8ZG1NpGSHhgylht/1Zg=;
        b=PI5vwo8vKbUI6lZUTdk0tVW7PAkQP6XZcJ24OgwbeMYNme3UvX8DC0l9agUKAKEhZx
         zcaXQ+VOMoIh/nmo1pv2SfMhRmvOZu6agH0TOMWvVobzqgXk+2fatw4h7eMbNnJM2CKj
         eb/ZpMDbY8oT+ibdzujRCYuxntXFBp2mZnxcmdV1/jh32jzMeMCTHh+SSjyC5rx7+qC3
         KYyZdLtD0s39wLQMPkCCpjQgWmjXCblNmw5vyd2cy1w5ZNYd/S65EE4Oms5/oIK74VQB
         dw7wA2I2EFxPFCZSuUgKz4RM0XeZbsOGIeIWAWdOeD6q9lSKVJSG7dhNe3zfdold1vgh
         StTg==
X-Gm-Message-State: AOAM533MaBAM9ZnOAsX9oQoFE724tYrYi1GOW8MBvCXm7b8PAGJJA+CO
        8QR1cuUQsSL1rugaaDfZcRw=
X-Google-Smtp-Source: ABdhPJwnX/VYXrJPRKoCMtY0t3Yd5CgpNauyTx3NQvPaA6T5p96cJfRbEQzLuM5OzxfNounD6Adm9g==
X-Received: by 2002:a1c:de88:: with SMTP id v130mr8505389wmg.98.1625740620562;
        Thu, 08 Jul 2021 03:37:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a22sm1888751wrc.66.2021.07.08.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 03:36:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Enable SMMU support for USB on Tegra194
Date:   Thu,  8 Jul 2021 12:39:32 +0200
Message-Id: <20210708103932.1691306-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

As of commit c7289b1c8a4e ("arm64: tegra: Enable SMMU support on
Tegra194"), SMMU support is enabled system-wide on Tegra194. However,
there was a bit of overlap between the SMMU enablement and the USB
support addition, so the USB device tree nodes are missing the iommus
and interconnects properties. This in turn leads to SMMU faults for
these devices, since by default the ARM SMMU will fault.

Add the iommus and interconnects properties to the XUSB and XUDC device
tree nodes to restore their functionality.

Fixes: c7289b1c8a4e ("arm64: tegra: Enable SMMU support on Tegra194")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 07e61f084123..7cc6dc19ff9f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -952,6 +952,10 @@ usb@3550000 {
 				 <&bpmp TEGRA194_CLK_XUSB_SS>,
 				 <&bpmp TEGRA194_CLK_XUSB_FS>;
 			clock-names = "dev", "ss", "ss_src", "fs_src";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_DEVR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_XUSB_DEVW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_XUSB_DEV>;
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBB>,
 					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
 			power-domain-names = "dev", "ss";
@@ -981,6 +985,10 @@ usb@3610000 {
 				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
 				      "xusb_fs_src", "pll_u_480m", "clk_m",
 				      "pll_e";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_XUSB_HOST>;
 
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
 					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
-- 
2.32.0

