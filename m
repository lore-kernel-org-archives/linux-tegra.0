Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36662C56201
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 17:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAFD1206D9
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 17:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSInxctv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgKYRDP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 12:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730921AbgKYRDP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 12:03:15 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A7EC0613D4
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2020 09:03:15 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m6so2602079wrg.7
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2020 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7blJLYjMdEaNh2dhpLR9C25RvuF/uzuAZi3O9yu30Pc=;
        b=KSInxctvqK6IH23Or4fmcxwpwf0vChowIU4vqx95ZTDXmmTcV6W8i5lZ52bsepEjIN
         qTU3BHq5ruk1bQpMOw0vHkfhZCotzNiTx+QJVIhjw0Gp6f6NKB7NsTi7gWkzQsHxwGaE
         b5xRFXgCZiilsfeTyMFHIRBTcZIUvSoqtGps4XPYowi0ToDmjJE6YUsXWSA2DV+rDiDF
         Vn+qHdQWzTpeszppPyjDeaKrEGT9HSKCgbrFGRdkJ9RffKR5NNU/aO8XrxtzZeuZV135
         dzWbHv7mdhuJlCBxvpLqHIwYnUAOL3/3OGs+Wxm7z/flKXJdGNrr0FzByE+/ZcRzCgmU
         ElWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7blJLYjMdEaNh2dhpLR9C25RvuF/uzuAZi3O9yu30Pc=;
        b=QoZ3g5V8q3TIljofvOTYjquTFg2YOyt0cpS6krT+gtdKc/VazLKay9hFyh8f33RuQv
         nzD5gRUEtdfZJ0xmPmq92ydLA9fjF3yVHbMeOO4zIAzTIKaHESSGny9GZBnn2IqLieqC
         +8QfFVGVPOF8I8HmRBSQpF2+OJ1OxVU9JJ9nNhk6N9K4cJ6O96SF/yJLqKx2vrWilTLt
         /AafVQNmq0N8oNR3Nd3Igk4s1yt47c8+bPFkGMuZzTbr3oAyZ6VvJfIn1iFZj2VAmErk
         macxgDOv+oGL8tFhdPTkreNU70080A69/HOIjNcn3gPkf47ApbYGLhUg//c0E91qlQbT
         jOMw==
X-Gm-Message-State: AOAM5324iqkm1KbdHO0qNGnymnCYTmSdUjnmUvRX0gyTEvlbFK2N8q7J
        R82zZ2CTttOnl5SRgkyq8ZE=
X-Google-Smtp-Source: ABdhPJwJr0K/LRFhc3WnoWvK0FIoEdzUN5Tr2Ir8zxu5h7zWxOUDXxi82ErHH16eNiIi2xv7uxccOg==
X-Received: by 2002:adf:b310:: with SMTP id j16mr5146756wrd.293.1606323793830;
        Wed, 25 Nov 2020 09:03:13 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q16sm5672793wrn.13.2020.11.25.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 09:03:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.10-rc6
Date:   Wed, 25 Nov 2020 18:03:06 +0100
Message-Id: <20201125170306.1095734-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm64-dt-fixes

for you to fetch changes up to d98bccf10dd0f36cabee71a425381fce0908de3b:

  arm64: tegra: Fix Tegra234 VDK node names (2020-11-25 15:33:30 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.10-rc6

This contains a couple of fixes to device trees. Among other things,
this restores suspend/resume on Jetson TX2 and makes USB OTG work on
Jetson TX1.

----------------------------------------------------------------
Dipen Patel (1):
      arm64: tegra: Wrong AON HSP reg property size

JC Kuo (1):
      arm64: tegra: Fix USB_VBUS_EN0 regulator on Jetson TX1

Jon Hunter (3):
      arm64: tegra: Disable the ACONNECT for Jetson TX2
      arm64: tegra: Correct the UART for Jetson Xavier NX
      arm64: tegra: Fix Tegra234 VDK node names

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 12 ------------
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi            |  2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi      | 20 ++++++++++----------
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts     |  6 +++---
 5 files changed, 15 insertions(+), 27 deletions(-)
