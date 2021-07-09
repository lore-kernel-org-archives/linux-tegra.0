Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0A9C07E9B
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 14:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44234613BE
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 14:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhGIPCd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 11:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbhGIPCc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 11:02:32 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC32C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 07:59:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f17so12537302wrt.6
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHuEH6VsYLXBeTed01/PCBU/Wx1MdyeMJ1LOOQ3q82g=;
        b=bkLFGL1Ki2kGuJjjxDQAnSYbGZ3QwNv/xzmqVljJc7TYEuwaiWAkewSqwuUHRVnoJm
         qlF+IuWNiJBnERnSAieKDBdRqrRKpBQZFTPWoQBqZqR9jqGplgJIvjljoerqn2TnwuHq
         L7KW1G1de706S0XGM8RLslnu/3sArdx4VJWyrNhS8dhOKUYkBpQJJLrhifq/g9RD703q
         +edKn9DO7WMauCKhLpOPFhBIFXhRAiakvEXO/7k/bX4LojUmja0US0untDgBdowxOGpW
         o2/8RRuDTUlyn2tbpNOG01sirdzo+Y6UjNbih9NgtWDxFVqfOKFGtJHmg+YcKN7ThPFH
         nDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHuEH6VsYLXBeTed01/PCBU/Wx1MdyeMJ1LOOQ3q82g=;
        b=OrrshziBVX+a/hae+cQQ4u+l0Gx93o45k1Mmo1TliRZ0m3KkPZUlrPacp4DMXZnJOp
         DNY/xL57eRT4vGDp11fipxmANhRbNovCt/iehUj8yLfdHJ6plpHmJRNEQeFzhKsUwC0N
         VEqk+PeElbdkXQgrhU9iDkUxvg74ELC3Bi3v4XYGHzBbHU0SItVi5gVP8EJXk9lTayoV
         FnYkG6Gag/lLOQjrWzZhQ+0vjcgG9nJFLhVqOuKiHpthROdQL9Edb9dLnfUs/od9Rb41
         SlMHZuezZkmbrZTe/FydseB7SSsH398jNSOF8TeiyClWhvG4WmIDQRYo0XBZYW6YEJAh
         rI5g==
X-Gm-Message-State: AOAM531Y5zYNKckf8n/7V63G5vk2Hps/tqWEaOXjJEaPaZ08CFnone2O
        8N3XbkNUtWRP4sGwOsOYhO8=
X-Google-Smtp-Source: ABdhPJyE1Zjuu0MGKQaBtvJmvkNkwxiaUJxirymFDhJyeu7I79a7aw1xLbpCLt2jRmKbjc2YGk9obQ==
X-Received: by 2002:a5d:6e81:: with SMTP id k1mr42163312wrz.144.1625842786688;
        Fri, 09 Jul 2021 07:59:46 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y23sm5197490wmi.28.2021.07.09.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:59:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc1
Date:   Fri,  9 Jul 2021 17:02:20 +0200
Message-Id: <20210709150220.2543875-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit c7289b1c8a4e10bbbdb7097a71a90652beb767a1:

  arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt-fixes

for you to fetch changes up to c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:

  arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)

This is based on the main ARM64 device tree changes pull request that I
sent out a couple of weeks ago. It'd be great to get this into v5.14-rc1
or shortly after.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.14-rc1

This contains two late fixes for Tegra194 device tree files to restore
USB and audio functionality after enabling system-wide IOMMU support.

----------------------------------------------------------------
Thierry Reding (2):
      arm64: tegra: Enable audio IOMMU support on Tegra194
      arm64: tegra: Enable SMMU support for USB on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)
