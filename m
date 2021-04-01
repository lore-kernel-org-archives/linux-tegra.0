Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877C7C001B5
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:44:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7481E61286
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbhDARmz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbhDARhf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:37:35 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7FAC0319D6
        for <linux-tegra@vger.kernel.org>; Thu,  1 Apr 2021 10:26:05 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h13so2816275eds.5
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 10:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5sLzzLW3ME8Xe8VqYfMyA7U25GpLo2zuKXzOdcoRKY=;
        b=fMyLwNAl16sg3Najvg/gxxAfWYQYJWo6FFTC5aQ4NfcfFj+7bs47jmjSuh9LRIkX3R
         83Wk/V5NLiYy/SSpUY228BUxI+Cuet5RWYo2CS4HbVnRpNcROxCdqHLnbhO7KmsZ7vMK
         C2vNpBJEy4XDGdLXfF0ytJ4uh1iLXWQ5/MoZGg0Ytl4smHYTjx8rrz5hmj0/4TIBGGh2
         GdexAPTyyywyoZJ6qho1j/h/PBLcOzjZ4NyGAxpPmu6bi2MMDnFntnrnTpgqrV7XSoby
         w+jE4pouiq8y2g82hqYSDpaDjSU1QJ1qc6dmJFJ4+i/tq6aTnMRPCzTw7TK9GXYNaEj+
         LoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5sLzzLW3ME8Xe8VqYfMyA7U25GpLo2zuKXzOdcoRKY=;
        b=gQRdxuWsadM1UJQnIpozR9u049KtRIHfQSq7hg/4bA0euBQRoTnGVDlTSuHElIonT6
         66eZI+0NNyZl+EvkVLf4ILVJAVeeAhV/LhpxTBGMEU07zpLjbzBvu2hvPTFjUJtFFL4p
         pW2LFzisXqDO0AUIYXa6Dl0dT0UjzjJhspwOWs4iKOot+W7WBIfXDhDcWVLx/ljEQMJj
         6UVIRV0zWFTxwSH+OOqSyN2fq8oH9ixCzmeLC8jiRxg2lO7S9Q/LOS/ly9ulzlQNgiAl
         i7MPl5gt8IRs191oRc0XzHOcMa1mJvIvQvPfui/QcmidlwRy2jUtdMGGFrI0vAAH7vxE
         o/VA==
X-Gm-Message-State: AOAM531aorbJPahG/KoPFhMHUHkMqVJAc/Rz9djANbpwmD+IroyBcSPy
        YbiDylts1wu3dw8Or6y8LWg=
X-Google-Smtp-Source: ABdhPJzIO9me1GxZXSNCR7NdpxHXdxcnYyP3uc3QZBz6aEJV0912UIwloUJFSuLMCdCoSAL1UuMEiA==
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr11495614edy.30.1617297964690;
        Thu, 01 Apr 2021 10:26:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c17sm4377374edw.32.2021.04.01.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:26:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v5.13-rc1
Date:   Thu,  1 Apr 2021 19:26:21 +0200
Message-Id: <20210401172622.3352990-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm-dt

for you to fetch changes up to 3a6c267dd7b8822eb722835b503c5a438cbd3700:

  ARM: tegra: acer-a500: Add atmel,wakeup-method property (2021-03-26 14:21:28 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.13-rc1

This contains a couple of improvements and fixes for various 32-bit
Tegra-based boards.

----------------------------------------------------------------
Dmitry Osipenko (15):
      ARM: tegra: ventana: Support CPU and Core voltage scaling
      ARM: tegra: ventana: Support CPU thermal throttling
      ARM: tegra: cardhu: Support CPU frequency and voltage scaling on all board variants
      ARM: tegra: cardhu: Support CPU thermal throttling
      ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core domains
      ARM: tegra: acer-a500: Enable core voltage scaling
      ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
      ARM: tegra: acer-a500: Specify all CPU cores as cooling devices
      ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
      ARM: tegra: nexus7: Specify all CPU cores as cooling devices
      ARM: tegra: ouya: Specify all CPU cores as cooling devices
      ARM: tegra: Specify CPU suspend OPP in device-tree
      ARM: tegra: Specify memory suspend OPP in device-tree
      ARM: tegra: Specify tps65911 as wakeup source
      ARM: tegra: acer-a500: Add atmel,wakeup-method property

 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  5 ++
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 16 +++--
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |  2 +
 arch/arm/boot/dts/tegra20-paz00.dts                | 14 ++--
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  1 +
 arch/arm/boot/dts/tegra20-ventana.dts              | 78 +++++++++++++++++---
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  1 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 14 ++--
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |  1 +
 arch/arm/boot/dts/tegra30-beaver.dts               |  1 +
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           | 48 -------------
 arch/arm/boot/dts/tegra30-cardhu.dtsi              | 84 ++++++++++++++++++++--
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  1 +
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |  3 +
 arch/arm/boot/dts/tegra30-ouya.dts                 | 16 +++--
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     |  3 +
 16 files changed, 204 insertions(+), 84 deletions(-)
