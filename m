Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28DBC433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242861AbhLIR3e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242916AbhLIR3e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:34 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231B6C061D5E
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:00 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o13so10887113wrs.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YKUA83lC1/7b/546A55OKYb7LyGPLVF+6DqqJAKToS8=;
        b=WEVbplv7KC6XbtcYK6JIx/5PAvv/eNcML2pf8jhRy9KiIr5YhvHBgSyjrPq4VpEhWZ
         LzcUk0eMMLvN3RC5hgUNzeFphfR2fkFGVlcV9LOCXm/fXXr2Veo8oLsVTXuPay1CfGQP
         3CkpSFjyYveFz/NT99SuyEMhRci6Y9CIu8Kz9a1aRr/zjZWqLA2G6kKn+vKW9GaDaCTA
         5W62+u0VeUsgx51HXzhQn7U2uj4plrgpLmBOtQiSsAIQtA8hnOjlR1iXWEtfIhVr+Xje
         1zUORBJ5FInmL+pC+z05XjtE94Xne1y/1Yex5+s3pOAvOqGHL4KozwcZkdPnKLmQyG3t
         3MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YKUA83lC1/7b/546A55OKYb7LyGPLVF+6DqqJAKToS8=;
        b=2OS0fnxc1C43VRTRlt0XnpDJq0ZwHvyEeWp6BI3OZdrJXKVKwY/z1kaOoTdbTVFVIR
         KER5aplj5w+zKAJH0hgKqFuROo16fgbu0/0xj1S7tO4hUnTTUkwcSBK8boNWDMk5lF/s
         5WkZCwhizcbekKpGS/msIeMM8YnHT1pfQxLIioCbSP2ACLLg3qrhRjWDHEmC/xWe6El8
         jo9LvgN0H92ymtTK7qvkqh9+1ia/5AuFR+zcXIvoCIsvFqtXFicXk/hz+dv0R6XGw+M8
         hkhiDGgbpDq0l8f8/PoAZDPOzwOrZYIpL1Jgg2yCpEjkxINhwVcO95SImCD0a4jKmd1j
         zd1g==
X-Gm-Message-State: AOAM533w3Pehx+O9z86ATyPhLBWCU/SVrMql1AD3hePaDMuf3aC0TE9b
        osweWYZFDJp78QLirPvA5wA=
X-Google-Smtp-Source: ABdhPJyE/QDqhv8fr9mjeV2q1AwMlgIfnydsUKRBeznCkUdg3mWVHniDf+Liv2IYOEa5HmgE114tXA==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr8126145wrf.383.1639070758607;
        Thu, 09 Dec 2021 09:25:58 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 4sm432348wrz.90.2021.12.09.09.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 21/30] arm64: tegra: Rename TCU node to "serial"
Date:   Thu,  9 Dec 2021 18:24:54 +0100
Message-Id: <20211209172503.617716-22-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The TCU is basically a serial port (albeit a fancy one), so it should be
named "serial".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 941027049b9a..416a6b6e434c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2713,7 +2713,7 @@ sound {
 		iommus = <&smmu TEGRA194_SID_APE>;
 	};
 
-	tcu: tcu {
+	tcu: serial {
 		compatible = "nvidia,tegra194-tcu";
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_RX(0)>,
 		         <&hsp_aon TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_TX(1)>;
-- 
2.34.1

