Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317F9C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Jan 2021 16:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B08233FC
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Jan 2021 16:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbhAGQ6P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Jan 2021 11:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbhAGQ6P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Jan 2021 11:58:15 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B50C0612F4;
        Thu,  7 Jan 2021 08:57:34 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id f26so6064535qka.0;
        Thu, 07 Jan 2021 08:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHmyjldWahf1HaQ4AhCEJA5XrMVwiCb1laUOCVRwLmU=;
        b=o3wkNRnSIU355kxVNIsEZKCV0Zrp3MppLy1glnFtx+V0TdMknifDj042SjoAFG3rfE
         y38hOUG3JgBirS57/sTdlE1pbj0KYXToRg/8sKE89tmCcfC+846lCv+luRoc1U2hLm68
         HR9EIv6Ds95adplN3Sx4T6lkSFCfRmnS9axU/z0YQ41zhY3wu79b8RsKNDL65+pEzhu+
         +A9eJibI8QBGsH13hllywC8Kvy9X8TG/BYe5In5FVXYAfcuBRNoMYk+DsmAc/Qg4/bT/
         YRd+caMyE77Mgqhcfk8P0Acsg2eBuQXFx4ChtYT5ebOdyRrsZ4qxoZb8abnCCt7T4B0l
         ACOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHmyjldWahf1HaQ4AhCEJA5XrMVwiCb1laUOCVRwLmU=;
        b=VVLktfPASKLNEo1+ncuItBeXoM9WsDU0axm1MfddzykrCIYdYGbIDDAgkPktS4jFyO
         y/b6256gayqJatqkbgRd05FaB6dBLWT/e6GC0kIZxK84gktH8qfAGv8S+k/cSDCibYJ3
         T9rMr0mZGhRWY1RdwQnVSXLzt/M0+gUkGZI2eSk32uf70aLEbgtRb1/ZdXqxmNszMTnZ
         Jp+hZJptXPGS/R32M1oRzaHDn2Lf/EZJfa9yd2i8DIBWlos1Rov78pWu7D3PGYFD8bXT
         k2y7lCvL/CPhwuPd2cv8bPcIqM8AIkPJwEW4QnGoY/Pc5xSTrA9D5bUtwoRGbPTCCu+M
         Jmwg==
X-Gm-Message-State: AOAM531d+4g1tY60s8JWwatAl1SQtE6i9gw/g8/9RNeqoIoo57YNHhDE
        DgEVUv0knuWBw4T/6HljvLg=
X-Google-Smtp-Source: ABdhPJw5c4JmiAT+8/vxw+xTkw9iPFNhMT84io4/ZxSTQGkIu0jOS1mqn3yt5t6ZGxjoEC3aqWT81g==
X-Received: by 2002:a37:8703:: with SMTP id j3mr9984320qkd.455.1610038653882;
        Thu, 07 Jan 2021 08:57:33 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id d72sm3366399qkg.34.2021.01.07.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 08:57:33 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Subject: [PATCH v3] ARM: tegra: ouya: Fix eMMC on specific bootloaders
Date:   Thu,  7 Jan 2021 16:56:59 +0000
Message-Id: <20210107165658.1354191-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ouya fails to detect the eMMC module when booted via certain bootloaders.
Fastboot and hard-kexec bootloaders fail while u-boot does not. It was
discovered that the issue manifests if the sdmmc4 alternate configuration
clock pin is input disabled.

Ouya uses sdmmc4 in the primary pin configuration. It is unknown why this
occurs, though it is likely related to other eMMC limitations experienced
on Ouya.

For now, fix it by enabling input on cam_mclk_pcc0.

Fixes: d7195ac5c9c5 ("ARM: tegra: Add device-tree for Ouya")
Reported-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
Changes v3:
Removed stable tag, applies to v5.11+ only

Changes v2:
-Added stable tag.
-Improved commit message.

 arch/arm/boot/dts/tegra30-ouya.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 74da1360d297..0368b3b816ef 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -4352,8 +4352,8 @@ cam_mclk_pcc0 {
 		nvidia,pins = "cam_mclk_pcc0";
 		nvidia,function = "vi_alt3";
 		nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-		nvidia,tristate = <TEGRA_PIN_ENABLE>;
-		nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		nvidia,tristate = <TEGRA_PIN_DISABLE>;
+		nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 	};
 	pcc1 {
 		nvidia,pins = "pcc1";
-- 
2.25.1

