Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CF6C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243095AbhLIRi2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRi2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:28 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34437C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:54 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id j3so11036694wrp.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WBMwTjyu84wOe3fLcGseTULsVDWvzOaqAPFsTReY9AQ=;
        b=NP4aMVQU8AeRyLGRpd3IeO2tispN5Mgn6FW18JeJTJhMupyxAYCwDJ1Lkkdyeb5J9r
         RNkl8JX6ng1PHKN8rj5NpnxI+iQR9LxGUaUdyf4r51lhviubk3fiNFAICWxdIzmGu3pz
         qUvW0kLHWlgzBi+WxNv4RFEh6mGga6jJ4BYSr59+vHrZgnUzxb2xIOesQibSEuS40AoL
         nnHHXijSMZmpe6gUungyrGOxveDT1UBBGtZuWVyHdnNNDaGYBBzSC43AR3wQBfAnrfhU
         38C0cP6X7nV6om3ltx0InGL7aszG+WB2zw2z8QpLcsV/gfDJYCwVvNBx9e04BdifI2RR
         bzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WBMwTjyu84wOe3fLcGseTULsVDWvzOaqAPFsTReY9AQ=;
        b=1GEAbkk785GR7mJJ/uVzgeHNzdXhSqICmu48+j//iqBElUoMs+Ah0K1cHHm357f9cm
         LsZ5ih9v5Z2lMYz4OpPdUeoJKhGfq22DjiJt5c/o6LKdisEePyssTeW+p6nCAjUgpo79
         XtOdz/oocU3VPv4I2Uu/E191QeZlYlBEFtW3WFneh/8fv70QyE1de+BY4l/7xUW86HZD
         3uZ6cwaidyGEbN5CpnzO7yC0tWThdge7S93dJMG53225/pQhYjwlJHLmZ+Myt+VnkIO5
         oy7V9c8eI3KPFJ3DqJQKW1p6LZhTf5SHsatOfrGA50CoaQbtjnrw/TYtjgoojAX9SKfb
         +4HA==
X-Gm-Message-State: AOAM532UTxBESLSn+VyzZRnruYIO/4sgt5OAh36lgViaCdcFvXa14xur
        b/1NXqe29StjVv6M/eZ/qMc=
X-Google-Smtp-Source: ABdhPJx93S9mRrxAb+zAnnmcl+ocaRshs92a9+OCPsRYnT5k0ZqAMpkQQUOpMkjrw/RYNo7gjEzrCA==
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr7767203wri.416.1639071292783;
        Thu, 09 Dec 2021 09:34:52 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id y6sm330217wrh.18.2021.12.09.09.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:51 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 20/25] ARM: tegra: Use correct vendor prefix for Invensense
Date:   Thu,  9 Dec 2021 18:33:51 +0100
Message-Id: <20211209173356.618460-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The correct vendor prefix for Invensense is "invensense," rather than
"invn,".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-seaboard.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 3724dc9897fb..7ee99518a24e 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -358,7 +358,7 @@ isl29018@44 {
 		};
 
 		gyrometer@68 {
-			compatible = "invn,mpu3050";
+			compatible = "invensense,mpu3050";
 			reg = <0x68>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(Z, 4) IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

