Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79A8C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Feb 2022 16:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242757AbiBWQWx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Feb 2022 11:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242810AbiBWQWu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Feb 2022 11:22:50 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE4C6E7BD
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 08:22:22 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id az26-20020a05600c601a00b0037c078db59cso4696030wmb.4
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnE+WudaLLlXe/21f7Ie3oBqq+MidREoBIhzxdwLp6k=;
        b=jbcrSNaRltckX5lyk408zPe1yRFc0yF0ehFTmMMqBvuqfB3964Lfe48UGW2ylNCe6V
         ucBETD/KR89WLwnTDHWf5+Ex/9leQjnANgYltWcbToF3D/2MCU7eWQ5iVhUN4KJWcusS
         4doEZjE3Og123Ov2E2QEDUX/2vBgeQ0c2D3HXpYzyObp7PJbE09iQHPbYmiwKVUHIeWT
         V/IZ8RF4WRjP00j/lKQ01t9tLMs0B05X13PVhxx0GA5kc3b1Fle+5wOi4+bg3eDpQzTw
         qUZP72njMfYPOaug+bTFMqM5d3lxj9thrWf12CLg7Yvvu/oLfm7q94Umv4rVS80cHQcP
         ao+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnE+WudaLLlXe/21f7Ie3oBqq+MidREoBIhzxdwLp6k=;
        b=bzP+lJ1F1Xg1+8MWy4ligLBOPhmYSM44SuW8aYZk5b6gHl3OEXtmOAjC9TFZ/179gt
         NOvhBUlAUsB1DDTIp9/0MRVRKQ8yPlAPYIburlQsVekA81ZHyo7qtDOkQlR2A43ly279
         5VviwW65bAt4snCiX68uhvFx/mceDxjsy2Z+pe/3CRZ3uM68c52sKx2HBakKRJidOCVy
         uqAmBUoKq+ceGi5b5sE7r71OheK9JjVv+VEtlNmVfCdfpflSW1m7fkZu/uoh1Ne1mUVv
         W5+7Swwoq4XQcfVIq+t86y+cBNRUFauLYToZ2rQCp9Wqs0RffbtnWuXkTbFjcVg77Jgm
         5F0w==
X-Gm-Message-State: AOAM530ZU2VnxwQb4PMFLLCSjl8+eeJIIXkMidMr2OxZZybSOvBb8QKB
        d8mGKDNhtQ5U4m5gcKZ/0uo=
X-Google-Smtp-Source: ABdhPJx6D71sd/JvA/8VP0qsMY062QL9s4mCFQAvm8EGoEifrsmu/+IzHaRDOHy+ddLSUHVKYADO8Q==
X-Received: by 2002:a7b:cb44:0:b0:37c:4e2d:3bb2 with SMTP id v4-20020a7bcb44000000b0037c4e2d3bb2mr8139793wmj.96.1645633341454;
        Wed, 23 Feb 2022 08:22:21 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g6sm150194wrq.97.2022.02.23.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 08:22:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: tegra: Fixes for v5.17-rc6
Date:   Wed, 23 Feb 2022 17:22:09 +0100
Message-Id: <20220223162209.293722-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bd048487af68a9782ebccc3af6606e9e0d7d9f8b:

  ARM: tegra: Add host1x hotflush reset on Tegra124 (2021-12-17 14:55:32 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-dt-fixes

for you to fetch changes up to 8d3b01e0d4bb54368d73d0984466d72c2eeeac74:

  ARM: tegra: Move panels to AUX bus (2022-02-23 13:26:00 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v5.17-rc6

This contains fixes for the eDP panel found on the Venice 2 and Nyan
boards.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Move panels to AUX bus

 arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
 arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
 3 files changed, 25 insertions(+), 19 deletions(-)
