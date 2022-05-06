Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EDBC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348368AbiEFOeK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442208AbiEFOd6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:33:58 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D623668FA3
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 07:30:14 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r1-20020a1c2b01000000b00394398c5d51so4484281wmr.2
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvaElvDoQ8pBWySsVTh3qmfFd4tIUh/A43DFaMB1/G4=;
        b=nyNfXaYl1M70mFIzcY1umhpNNlUZN6U7uMj52RGEaHwPD1VOGliGvzxQPOhSOK7E6j
         cHm1nfSj43H/w9cRvky8Q/5UUisoa4GBW+BbSvKPgCZbJF/2kxWLePLrdK7St4aOBfis
         ueRBWtSrM79jsnS6x8FQw5yM2phOM88LArn4ANR/JHL/1CqqOZbLMH6SzaXTpDts2gI6
         j/mJSwfcyv74+ADWwEUSDaCnA9hGPZRIfnkYy3YnByW0iPDMfvtfyxRujm880mtT6b2w
         lrGKAoFfoxR2H86gyqst1VNgednewnhG4HA4M5/nWximR933egj8k9qo9HsAfJuwb+96
         uEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvaElvDoQ8pBWySsVTh3qmfFd4tIUh/A43DFaMB1/G4=;
        b=5jhd0AWW4h6H/zSZu3tpi2rKVUJyge0n8oTJNYryY5ZadUvMcvAifmM0vrMdwQ1FtM
         e+NWisnoXMyQYpmAsxig7jdu9h61/O0EdG0RumwQaV2hEkxvgE+WhcA+s6skj8T61LTX
         fKyoyERBmuvrcvFTOSJnl9plJNjTajGaaFhK5TVu05YsjG3e7L+GrHraZpVO1B1rLaT2
         V0USxQejTjLKh2nFzd3NAOt6sKF+ZkQiyA2zqMKSoN0GswPtbydVXqWL4WftGKjFNXgK
         vk3+lA0tbRvzCNNAhi23Lb8ySSYLV43FjnrAyatCIStwZuzeCiwc2HSY6yi3YPNFaesj
         LFMw==
X-Gm-Message-State: AOAM532zB2E8WJTipDBfar77e4n4/HxB+gChtRFqSy6Y/DVMW8rwh8RR
        TeHodOJDD4sp25YwGDpYu+U=
X-Google-Smtp-Source: ABdhPJwn8YmIyWXWGg4u+lgeafyDX8mby0b9SzbPfCrjclWnSFOZw2+RjI10sXdPPkjuM66pv2zs9g==
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id z3-20020a7bc7c3000000b00389cbf1fadfmr10228752wmk.147.1651847414311;
        Fri, 06 May 2022 07:30:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c1c1600b0038cf0796675sm3918448wms.0.2022.05.06.07.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Default configuration fixes for v5.18
Date:   Fri,  6 May 2022 16:30:03 +0200
Message-Id: <20220506143005.3916655-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm-defconfig

for you to fetch changes up to 39ad93d280506f4953a9d0c545cfffa581889326:

  ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver (2022-04-06 17:03:30 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration fixes for v5.18

This contains two updates to the default configuration needed because of
a Kconfig symbol name change. This fixes a failure that was detected in
the NVIDIA automated test farm.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: tegra_defconfig: Update CONFIG_TEGRA_VDE option
      ARM: config: multi v7: Enable NVIDIA Tegra video decoder driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)
