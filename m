Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3E5C43470
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33BDF610A0
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235461AbhDARxG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236841AbhDARre (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:47:34 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4846FC0319D7
        for <linux-tegra@vger.kernel.org>; Thu,  1 Apr 2021 10:26:08 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h10so2786346edt.13
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFyIg8syNYPFzhmphZGsN0/P5BjL76RGwMywZZQhQ6c=;
        b=nvTC5y589Fz/gj87Pv5YA9OmIoYiI3vwoAOpWITntQYOll/KEaz8X20wO9hoVRcw4E
         chE8IvLnNqOcIC+3TaSeWXe3FXsM7JOmQTtn+/q74qyh73IlvDC2rItOxKi76eRm0R5J
         uczD62U9ZYoncx4VbDAWzo7Bk4XfQn8RSFWfY9wgqXWLytg3h69vztqRHUsgs/UamSEW
         fFeNsREl325yllSCy9MMzuv4eYJXvsikbgegvtSeAnicVNDrSgkyVTBVWTNv3WYmvCQc
         w3ZbV0OzLDnv/enXIqlfLqmfMVvmK+ut14Vq1RL/jnVz2SYCiIvRrrUdBIqpBC74CZYG
         krtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFyIg8syNYPFzhmphZGsN0/P5BjL76RGwMywZZQhQ6c=;
        b=ruWZrTu1+vUTwUPIuYilnRmn41974mH4ZNC8JWjcopjhP1vj6mWZb35jdSsGBdsIfX
         4bCVJteFSVugjnigIfHjKX68UGZOlWTev4bpC6PX9dO8V6q8WD9/jU0zybrEOxMExWOO
         RQ9SGKQHo6zc27r2kEqBamKkZo79td0uq11g4dT0dYgpk2fLMYEmfvK4ZkFo0Trk+eEe
         njh83AxCzUPrRR9irNytJr1Jyx7a3/SRNPqmeNV02u2QQ5nDWbcSsWfHymbhFD0wWMcZ
         5tB1q5w+XqdiioitnRZqHwoYWxjMgfJmJZhtnkFPedipaNR1U+SvxPCyj+66E2sz7Pxf
         l45g==
X-Gm-Message-State: AOAM5309hGkEdK4rt9vlHl6YIwOTM8Jtqgpgi+qIeG9WbHOgmKmHwmkl
        sEB2mKAip6/9uzo1U/L44C0=
X-Google-Smtp-Source: ABdhPJzHLEVoJiG2OIvfg61ZJ+n48ibWJdHJA6V35LhUTvqh/mUPrd8q/IsIyh5iDD/AyxbRLrbR3A==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr10816258edp.167.1617297967004;
        Thu, 01 Apr 2021 10:26:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id hb19sm3045144ejb.11.2021.04.01.10.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:26:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Date:   Thu,  1 Apr 2021 19:26:22 +0200
Message-Id: <20210401172622.3352990-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt

for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:

  arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-25 14:04:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.12-rc6

This contains a couple of device tree fixes for the v5.12 release cycle.
These are needed for proper audio support on Jetson AGX Xavier, to boot
the Jetson Xavier NX from an SD card and to be able to suspend/resume
the Jetson TX2.

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Set fw_devlink=on for Jetson TX2
      arm64: tegra: Fix mmc0 alias for Jetson Xavier NX

Sameer Pujar (1):
      arm64: tegra: Move clocks from RT5658 endpoint to device node

Thierry Reding (1):
      arm64: tegra: Add unit-address for ACONNECT on Tegra186

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi            | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 3 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi      | 1 -
 7 files changed, 13 insertions(+), 5 deletions(-)
