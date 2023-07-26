Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84743C001B0
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjGZQn0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjGZQnY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:43:24 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93A02723;
        Wed, 26 Jul 2023 09:43:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9891c73e0fbso266017866b.1;
        Wed, 26 Jul 2023 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690389799; x=1690994599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uac4TMT6K0WrGk+/Xni8ZZMxvWd8V1Ykq9jESeaCBX4=;
        b=RI/5+c57NCPqML1Sk5EQCmok6NVr2ImWU6BiNPSizMMpBBsxJumME8gcSsVgxPGhnC
         KnXQNpMvHc+IBIBMBExIuBTrersTMpAnll1Hm8vjTBSHVItP/7IG4OssPQrq6SOw8bd5
         cGNGhmq8fCyspe2MhwW/XQtWuqX/kY2pzQee1vSVC97K8r8E4Beww+z4NiDGHrQHrmI2
         3J8R6/GuFDhzB9mfPfCh5mWWhO8d0ZGTFNwVBvaztcejWCtuiwK4h0xFLQmsw8zJuPM7
         xbsKjdWb2BdMo2vj0jLYaumwj/JpqZdaXwg9hAHAO4NcaqzKWvDkFKYpBty4xlTPN1Eb
         l3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389799; x=1690994599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uac4TMT6K0WrGk+/Xni8ZZMxvWd8V1Ykq9jESeaCBX4=;
        b=W6H8uQF6uO8FaXjX1rGpkV+fo6F7p4CKY8JFFooFJ3tqt/wAj6pa3W9g2Am+tLs7In
         6QA23e2O4ZBhiiArf3wrFxzVCzbBl5eUJWhIQvHVnWYAjevLBD489L3CEAPefKnrcHpt
         0a5bVMOijrOLOT/u4plUFS4DuV5L2fh6cMG4esgFc0r1V6QuVsA10BFujn26HdYgcC+U
         EPnAby0HlrN+uBYN9yRiQYHyAwRTQ9NY0PPH/BTfDFBPcXrSKRUe4FDh+n9Ln+oZBSwo
         tMoeDRK5ulavFyxhIS10Sv3QVgE9riTIW00MALR04qwK/ZGeskURBp20ZuNoCP3rc54G
         9T2Q==
X-Gm-Message-State: ABy/qLYT0AFK5Jwt3xz9QDdU48S7rl6qxEBw6JKPnJM2mtL3y5xMHseV
        kjAlZbvsrBcQriGsHrjQLZFDu1NVLBQ=
X-Google-Smtp-Source: APBJJlFIlu9ygvby/YyIM5zjjHUTL3lAUAgm7oAf7X/EJYkZB0GgcVO7+9mCEmrTtQOq973w4vKJ7Q==
X-Received: by 2002:a17:906:304e:b0:989:450:e565 with SMTP id d14-20020a170906304e00b009890450e565mr44266ejd.23.1690389799035;
        Wed, 26 Jul 2023 09:43:19 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id re16-20020a170906d8d000b00992e4d8cc89sm9895601ejb.57.2023.07.26.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:43:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: tegra: Remove {clock,reset}-names from VIC powergate
Date:   Wed, 26 Jul 2023 18:43:18 +0200
Message-ID: <20230726164318.2172859-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

According to the device tree bindings, the powergate definition nodes
don't contain clock-names and reset-names properties, so remove them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 083120849e4b..630a04bfc931 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -916,9 +916,7 @@ pd_venc: venc {
 
 			pd_vic: vic {
 				clocks = <&tegra_car TEGRA210_CLK_VIC03>;
-				clock-names = "vic";
 				resets = <&tegra_car 178>;
-				reset-names = "vic";
 				#power-domain-cells = <0>;
 			};
 
-- 
2.41.0

