Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F799C3E8C5
	for <linux-tegra@archiver.kernel.org>; Sat, 28 Nov 2020 00:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CDC822242
	for <linux-tegra@archiver.kernel.org>; Sat, 28 Nov 2020 00:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adbqpcz5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731360AbgK0UCm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 15:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730858AbgK0UCJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 15:02:09 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D95C0613D4
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 12:02:07 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id u4so5324266qkk.10
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 12:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ierPRC6nwVyKGRAu13wlHhtdFpPWvdfztnJfDJ7P5k=;
        b=adbqpcz5StDJ/7sO/HcY1M3HeMCEvOKMopLbVzYqvr8DuTWDtHShOF67zz36MzfRe5
         t2aw+JoCucITUY95bg7pxzutUXuirVT7EIV1WSoNZJA8nX0f4ygJDjDSXZOno8k5oW9D
         Jtzz8fHYqIdERRz0fdicANbA0w+BB5I2DT8iLJHqCbH/GFukUqxFcflyfdbsDCOAdQV9
         GRF90brf6GcD3FLGpUrkZKjOij9tKDrcYyOCXgUHHAiE758b1xe9HcumZ3DM90lRUIze
         thaBqw68ZvsOttceqe05DlRwkvsns99ccVfe+vX7jl8L9EL9bAUgtABQKXNeZLtyCdWM
         kY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ierPRC6nwVyKGRAu13wlHhtdFpPWvdfztnJfDJ7P5k=;
        b=DK0pNwupWRFjmY+CzX83nfZ9adj3SKF4/3EKAVINKyer+AnKrL2+AKpUmSnRGYXQL9
         GuqfJ82PwdxsYVAkVX+pXBebSgeeRIA0DcCBnIfQFL1RuTwghRhbgRj6d9HqgyZdI6Wz
         Au1OBUKFda5yZ/e62Rhnp3Sjtbimunbb1jEriErye1SXn5xDrBm50voVdBd3uDUGDEJz
         e6hLfYAqIN89EQ85btqJykUnRBEMkwN0feUJ4fqKJizLjBoMpl6HO6uLzw+Kx3evUNnS
         XDzDHcgv1QFqGFfdbvisZ0QAuR3O9QVgq+SGNMSpWC4WkJj8O1PgrXKGf39jwHr0qVpU
         z0hg==
X-Gm-Message-State: AOAM531aYI2AW0KaXQGdNNKev8EZBida2+8hnyBJPtCb0gO/iZiWceJm
        U2LOPotrCXAD25MA4KYy2hy0QZgOg/RsjQ==
X-Google-Smtp-Source: ABdhPJznECkXi93FlMhXalnZlb/UXYwv6ULAkbiD9RS2tuU0uifzOGhIVCoLfGu8PYCsroy/uCS/hA==
X-Received: by 2002:a05:620a:11a4:: with SMTP id c4mr10377463qkk.8.1606507326586;
        Fri, 27 Nov 2020 12:02:06 -0800 (PST)
Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id i203sm6684736qke.49.2020.11.27.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 12:02:06 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Subject: [PATCH] ARM: tegra: fix emmc on specific bootloaders
Date:   Fri, 27 Nov 2020 20:01:46 +0000
Message-Id: <20201127200146.25625-1-pgwipeout@gmail.com>
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

