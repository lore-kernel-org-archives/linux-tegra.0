Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0455CC2D0E4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A68D120B1F
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttCs+eVU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730920AbgK0Onn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgK0Onm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:43:42 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88722C0613D2
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:42 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id x22so5315401wmc.5
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uX/GVbnqAzBXx0E85jAnDMgOaxp18AQUYwU0Wycd3tw=;
        b=ttCs+eVUAu/Nlj0Q3UhP7icO8sHCRwrehl0jqHQmJ6mA6K6zIR3xr9VXXGB+GJfIKu
         F2YRz8viDwXvk+GiLfJlcAJaLcPMkZCAtcb5TDoXj+lrr8ClLb+cnzkA3xrO/Eh8Gzgs
         NN2mvcfFhNobc6K4dpDq1Cl0qXUVMRiXW5VV7eb/6ev4UKgvD3fjz4uAOKjuNzal+Q7q
         MfMGEx5JrpDyAGvD4jP01QOH0h/+zJZ9xixbNPWFU1shWZeTnf04YC8xGsXFoFVjf+MB
         ydR2bZXI6xsQqizuwUHZSJ8/zfm9aNiy3jGWG6EjLnact8NFsNtbkMIAAuuWHB3tVJPr
         GzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uX/GVbnqAzBXx0E85jAnDMgOaxp18AQUYwU0Wycd3tw=;
        b=MZ5uV+LpJIHc+kmexr5ysAnRsRVZimXKLnAJN2krLHyE0hVyI+4NoJW2oRSbC2UyuZ
         YO3TX0Tiue2ulaX5/mqXuUUeAsSqbLuRYQmGTWHYkeBeWlxegSEcooOmjOLLThUCqvIX
         hAqCxWOnknfDK0EZP1I07lhDQTrm8rvfpPmKVuu0bvWToTRWvM1foApjg+npZUxyEegl
         sMcJBqSX9enTlFy6RRNu9m2FB+py3u7WIbR7FbwX2AM7ER7dL3dgAVsdiAS6zA5bQvLd
         CznP9vUyg44+pEr8RlGaH/IwLcO3Pvy1CwsMCTn1v1GXyL6vqdQgA7ef7lEn9TMNChMc
         BtIg==
X-Gm-Message-State: AOAM5337qaZh6M2BlzA8pmbWKZGWXCkmBxinqBszpC9UM/9rMgELbxSy
        jeSMLEQjntRMeAAriT2v74w=
X-Google-Smtp-Source: ABdhPJzl20W3YHhp9wpXMsQPwnEu/2ZLBS4mjNLkOLU/zk+AOSHSHT9E1+wHKIdHfcW1s19Mob2d8g==
X-Received: by 2002:a7b:c0d7:: with SMTP id s23mr9503850wmh.54.1606488221257;
        Fri, 27 Nov 2020 06:43:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v1sm14934804wrr.48.2020.11.27.06.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:40 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:43:28 +0100
Message-Id: <20201127144329.124891-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-arm64-dt

for you to fetch changes up to 48f6e195039486bc303118948f49a9873acc888f:

  arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering (2020-11-26 16:33:04 +0100)

Note that you've already pulled part of this earlier as fixes for
v5.10-rc6, but I've included the whole lot for completeness. Let me know
if that doesn't work for you and you'd rather have a completely separate
branch.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.11-rc1

These changes are mostly minor fixes across the board, but they also
enable PMUs on Tegra186 and enable SATA support on Jetson TX2.

----------------------------------------------------------------
Dipen Patel (1):
      arm64: tegra: Wrong AON HSP reg property size

JC Kuo (2):
      arm64: tegra: Fix USB_VBUS_EN0 regulator on Jetson TX1
      arm64: tegra: Add XUSB pad controller interrupt

Jon Hunter (3):
      arm64: tegra: Disable the ACONNECT for Jetson TX2
      arm64: tegra: Correct the UART for Jetson Xavier NX
      arm64: tegra: Fix Tegra234 VDK node names

Marc Zyngier (2):
      arm64: tegra: Add missing CPU PMUs on Tegra186
      arm64: tegra: Fix GIC400 missing GICH/GICV register regions

Nicolas Chauvet (3):
      arm64: tegra: Add missing hot temperatures to Tegra132 thermal-zones
      arm64: tegra: Add missing gpu-throt-level to Tegra210 soctherm
      arm64: tegra: Add missing hot temperatures to Tegra210 thermal-zones

Sameer Pujar (2):
      arm64: tegra: Rename ADMA device nodes for Tegra210
      arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering

Sowjanya Komatineni (2):
      arm64: tegra: Change order of SATA resets for Tegra132 and Tegra210
      arm64: tegra: Enable AHCI on Jetson TX2

Thierry Reding (1):
      arm64: tegra: Hook up edp interrupt on Tegra132 SOCTHERM

Vidya Sagar (1):
      arm64: tegra: Fix DT binding for IO High Voltage entry

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           | 20 +++++--
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 16 ++----
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 61 +++++++++++++++++++---
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 19 +++----
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 20 +++----
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 22 ++++++--
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |  6 +--
 11 files changed, 119 insertions(+), 53 deletions(-)
