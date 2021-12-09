Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E64C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242837AbhLIR3I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242852AbhLIR3E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:04 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A6DC061A72
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:29 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t18so10897628wrg.11
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xGQBtMQaGQsDXdQ1E+vYbO+JE/wxZYbd4TA1hkh/B0U=;
        b=S7wWL+quhy45vJj3glSQU3IRnHf8WlN3sTs6Ri6Zsw7QPeSGdZNv31S3k3pWb8X+V0
         N6pwuUhC+EFUAlFVdxwECvZK4xNPtfhBfrUfXe32qWCeECEv4VukVkpPz9z9v24h9HFp
         IpZR2tLz/KDCOiQ7pNaoZAYI1xFDdWWzZX4FWTe4VcPNfgmWEQlxVj6XLxd2IBiMNa1U
         6rOKTgVMWRL8oceVFxT0879pFx5FEJQzaQvJrV59ys1IGLF/nX+Zk0GkFGO0otUiyKHf
         TDSMIyp7lyHShqBoymMl/GBeD+gSwLQ/e5c/3MZ4wXZlQDUQL0QhStmZsmVKOep+5f5r
         /qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xGQBtMQaGQsDXdQ1E+vYbO+JE/wxZYbd4TA1hkh/B0U=;
        b=LQI5t0zP5wGvBBIkI27Ai9dsofXbdaFlcUHJ0VhPqSqt23ucBy+soSydO8naLzloIP
         /GVoq6P4/zxjx00RvGe43BnDNKbcBU7Wu/TTrbYAnDovf6vhyjAgt4Q6JUIzw1EjTA9r
         h8/7IAkCB+X/Zc2nIZwZ+z82zi1GFgMh3K5TfWxqie7iJNKGekoKOJHuRJUzfc/2xEfF
         wg15afYpoBponFFb02n2c+S9ge4we5pZg86sp2IYqxKmNRS1PMpEc/OSSCqzfNs+N35d
         SvpCSgRC5da3JWiZgUWB3m3sUvLRVmiypZf/GfkIOTjgSJQuIUDup0I9iIHcGW5eq7rL
         EJWw==
X-Gm-Message-State: AOAM530XYGW5ZiNqsjHxB4XmnHRU8wRCV9g1lppmnmZdjBkg4yCJlpy7
        akWWVRWlYuPrZ/mhGr2UhBEIFopBjSA7Cw==
X-Google-Smtp-Source: ABdhPJycTOmG7A5I7Qx4IJ7M51WkUbYACL3qse4xaSnSVJvYdFlXWr/8DBh75vEmzwXCmOPrx+rJnw==
X-Received: by 2002:adf:edc1:: with SMTP id v1mr8083733wro.170.1639070728394;
        Thu, 09 Dec 2021 09:25:28 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id u2sm380388wrs.17.2021.12.09.09.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 09/30] arm64: tegra: Drop unused AHCI clocks on Tegra132
Date:   Thu,  9 Dec 2021 18:24:42 +0100
Message-Id: <20211209172503.617716-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The CML1 and PLL_E clocks are never explicitly used by the AHCI
controller found on Tegra132, so drop them from the corresponding device
tree node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 0e8903027f04..16673d3bf6f9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -635,10 +635,8 @@ sata@70020000 {
 		      <0x0 0x70020000 0x0 0x7000>; /* SATA */
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SATA>,
-			 <&tegra_car TEGRA124_CLK_SATA_OOB>,
-			 <&tegra_car TEGRA124_CLK_CML1>,
-			 <&tegra_car TEGRA124_CLK_PLL_E>;
-		clock-names = "sata", "sata-oob", "cml1", "pll_e";
+			 <&tegra_car TEGRA124_CLK_SATA_OOB>;
+		clock-names = "sata", "sata-oob";
 		resets = <&tegra_car 124>,
 			 <&tegra_car 129>,
 			 <&tegra_car 123>;
-- 
2.34.1

