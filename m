Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDCCC433E9
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Dec 2020 14:34:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1A1225AB
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Dec 2020 14:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392143AbgL1OeP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Dec 2020 09:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392138AbgL1OeN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Dec 2020 09:34:13 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959BCC061794;
        Mon, 28 Dec 2020 06:33:33 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id a13so5010951qvv.0;
        Mon, 28 Dec 2020 06:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ierPRC6nwVyKGRAu13wlHhtdFpPWvdfztnJfDJ7P5k=;
        b=va2DRmSEXgN4RERvddEc0LUIi0aJ2is7ykW9emcWUQX3DQyUptlLMgP0Bea93irTYn
         GUNY+yNwBfUcC06TK70sP364qt6UJ0dMoK/+oYiVunlfYs5rDzclAbVJlZLTiFOAAv7Y
         zImRtB6Riffr8DbKUXQM0M7UjIrnkHXZHPhY2YkurjNfW54/qzpFSRS8/uAOuxOryPSN
         gy2hDuIsFEu9ROYAYzojZ50JFm+zlGultGM9IWu9tY+bPjpyfFO5qaDlssa7u0UyNUXH
         WxVPI2ZynCr7Hn6mXxkbbcQB3bl4W1nmQ3ZHYfE4kOI2tXQOuHBFRtUXFsmRGVnS8Yf4
         UP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ierPRC6nwVyKGRAu13wlHhtdFpPWvdfztnJfDJ7P5k=;
        b=o6abMvJVWTJ+9wxVBmdoUHYsaW5kfX1S2X4kAAoi0V0mdD9bjFgw/eLj4PdgGT8lQs
         2W9Zdx7dqvqE8y4fdc9Lh9uVRUeogTFIM4qdtFRokHsj+wRsTXkIm5yCWAkadhSxZH3H
         C1LK8cdyc0Ce+/kNXi+jyWaWUwGVJwuq21Mn2M5Xf1YeTKS8h3uKSVFdqYVLARFSeptK
         2E1ZbwDvxkifi6B9bKbJqhY5Q7X0Df40Tbesq9YlgQ/5W80Gquy4PBveWPXPl0heIXcD
         gkexWQKAdFh1gx/G5S0YUL/6jq7Ss1nuGAceUyLJkps76hCkNKAhPFa6KxK+j78vJCTW
         C/Xw==
X-Gm-Message-State: AOAM5311Xp+tQ2fcK8maclA/zfj4W+9VA7vZcCarUOa2TtX20acwqAFt
        glAQ9mTC9P9idv57d4vNM+LUgU8h/nwUJA==
X-Google-Smtp-Source: ABdhPJz0IbZ8X0oYIXV2iC2NMeWRmuwGBjxlk7CI6xetX/5FXgaY6nXvJlB7M8Tk76pOFM76GaP2rQ==
X-Received: by 2002:a0c:dc13:: with SMTP id s19mr47650134qvk.26.1609166012656;
        Mon, 28 Dec 2020 06:33:32 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id j142sm24361024qke.117.2020.12.28.06.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:33:31 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Subject: [PATCH] ARM: tegra: fix emmc on specific bootloaders
Date:   Mon, 28 Dec 2020 14:33:20 +0000
Message-Id: <20201228143321.1863250-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ouya fails to detect the emmc module when booting from specific bootloaders.
Fastboot and hard-kexec bootloaders have observed failures while u-boot does not have this issue.
It was discovered that if the sdmmc4 alternate configuration clock pin is input disabled the issue manifests.
Ouya uses sdmmc4 in the primary pin configuration so it is unknown why this occurs.
It is likely related to the other emmc limitations we have on Ouya.

For now, fix it by enabling input on cam_mclk_pcc0.

Fixes: d7195ac5c9c5 ("ARM: tegra: Add device-tree for Ouya")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Reported-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
---
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

