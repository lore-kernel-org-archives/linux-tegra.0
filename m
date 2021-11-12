Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89529C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72AE46109D
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbhKLNJi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbhKLNJg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:36 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F32C061205;
        Fri, 12 Nov 2021 05:06:45 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o29so7673743wms.2;
        Fri, 12 Nov 2021 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A/1VLW4VwuHylTDOZ406zvdQSAlg4XrkszofU6R4Kj8=;
        b=NekF9bBLBohgqkbP8dWHoX6SZ56DWgNBFbWpOavNqrFsW/UM+xQ/+ksjuaoOV3SZ1N
         arF0gGmAvZBnRdcwvca1NbjLGCZAdSQaPvE5dO/+UIagRkzPAL57qtAyC4Dxs5PsFQ+Y
         mmyxWvUSg9xTAr9G2c8Up7TXo2VLrQLtHZmeK8yGLoO4bO31WMmpiI+xcTAIRpFtknQc
         RaHj8RaOxBH7neN85kY7GNiIk9TigrBRPsJFTPhSd72SlzTQXtInx9XlKTpND5i1TKwo
         lw4//muFcvFTMAoLoCFsJracCGViJXYXkSXOiN+gkPs6s8THwXUmNBixRgBu4r9EJFOd
         rEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A/1VLW4VwuHylTDOZ406zvdQSAlg4XrkszofU6R4Kj8=;
        b=GDqw527iO+q41nuU7OobmnaankTPDAEIXu7Bx7Rqb6bwk5JU6B8+OfMYRyTtp+nrCl
         5efVlzZxqDQfc9Ua5gwp9IpRkM1JTiZJBjWY5hZkBnauDQr7SMUkwlJ8KfPOBzen3qiR
         5X6r33Vv6/AtlDLc82BhRVUxJs1nQQWE8TZZCYRqeChBBiBZAja9/34PI6k+iNVK6zh9
         SIM8iokEAe3ig2hgYu0GrrBxGRQng1PVEVO2DjnqW5ZKkO33xFJIttzZjPX12G8uX9IO
         lGcb8Jqwjlk7kvqWheklcKeeautaXW5uvt/w7fhU1YwBMhdBJnmjLEfijW72ySsTj8zc
         fiXw==
X-Gm-Message-State: AOAM533LxbzrBFpzpDIoju6s6I3BsdKd7zraTSt7yb/CVdff6gtBgunU
        iEkHqYBh+S1/nueu+9Hx8Qk=
X-Google-Smtp-Source: ABdhPJzMnbGP7RnxtWcninHXDUR/mVaMC63swTzwc+MlXAXroZGpYZ6VZxkZ0xiCuBO/3GvJndqnHg==
X-Received: by 2002:a05:600c:35d2:: with SMTP id r18mr34035985wmq.166.1636722404206;
        Fri, 12 Nov 2021 05:06:44 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h15sm5760678wml.9.2021.11.12.05.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:06:42 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: tegra: Hook up MMC and BPMP to memory controller
Date:   Fri, 12 Nov 2021 14:06:27 +0100
Message-Id: <20211112130627.3682795-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130627.3682795-1-thierry.reding@gmail.com>
References: <20211112130627.3682795-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the interconnects property to hook up the MMC and BPMP to the memory
controller. This is needed to set the correct bus-level DMA mask, which
is a prerequisite for adding IOMMU support.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 8893d110a0ae..07ab9137f681 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -157,6 +157,9 @@ mmc@3460000 {
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLC4>;
 			resets = <&bpmp TEGRA234_RESET_SDMMC4>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_SDMMCRAB &emc>,
+					<&mc TEGRA234_MEMORY_CLIENT_SDMMCWAB &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
@@ -289,6 +292,11 @@ bpmp: bpmp {
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
+		interconnects = <&mc TEGRA234_MEMORY_CLIENT_BPMPR &emc>,
+				<&mc TEGRA234_MEMORY_CLIENT_BPMPW &emc>,
+				<&mc TEGRA234_MEMORY_CLIENT_BPMPDMAR &emc>,
+				<&mc TEGRA234_MEMORY_CLIENT_BPMPDMAW &emc>;
+		interconnect-names = "read", "write", "dma-mem", "dma-write";
 
 		bpmp_i2c: i2c {
 			compatible = "nvidia,tegra186-bpmp-i2c";
-- 
2.33.1

