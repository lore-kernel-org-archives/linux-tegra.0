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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9098C47082
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 12:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D268C61246
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Jun 2021 12:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhFHMP1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Jun 2021 08:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhFHMP1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Jun 2021 08:15:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEE2C061574
        for <linux-tegra@vger.kernel.org>; Tue,  8 Jun 2021 05:13:17 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso1708841wms.1
        for <linux-tegra@vger.kernel.org>; Tue, 08 Jun 2021 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FeihunwIMKI7/M9F+u4lbNvLXuFrJY636ioeY014Su4=;
        b=EvGQAy0ig/kqB6utTO/JurrQ9MQa5CwTxgV3sdiV5+oJpoTjap93s2deS/haLmSNEY
         krIR8Ws2TSJArJFnE9E8YyMXww27wtBDd+Fx9Q1PA4wKJFdov+JITYzUMLuxVAwajOtr
         uUWKVhq3y6oaWQRkIjEkl5NuDmxPBrExElbtL7dY5z7ptT/N5uAptRH4NIsVKRntjMPR
         /uoVmZuH7FLel//6MeivE0WozvE0cYJII+ovMlVGUVmsP7m/F5dlhkbAB3HMjY0abCII
         M/KhWbdV0arIMmWXjwUCm74i3zOAfXAVdnso6jR+DTWDVnRcpGHtZLB3iqfMx+dvZ3K8
         CHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FeihunwIMKI7/M9F+u4lbNvLXuFrJY636ioeY014Su4=;
        b=obQ6ndVP3ob0Yjx1dynrrKJzUvnI5t1Fx6eoyU5ZP8G0DP/6qlOyUPD0g3j5rvCQ0L
         /fsX7E/BYSg7TmmE7doTSjYGm9SX9qzMnAwzCjKKiXXotNGvMZTDpeq8bjDsp31DZsHV
         VL5DpBHvL+yL+FFJCSO4zPaB8k2PbrEku6U3wALFEjUpIbVjd7Q+tM+3+Z3Y+asMEoxn
         1b6MbMdDmAxjDP4P8PM9+W55j4WNtyE26EzY5SrIg/xVPXHyRD8OsJKHXFe8AoleREI5
         ZDigUHOdfggwudYWUFD85RCG5tgOlfP5ZvVRQU720SiQU/MEu9ar8lI3TWO6Hj3Qmt2Z
         Kt2Q==
X-Gm-Message-State: AOAM530FErBkm1J8S9wjQb+qbOAObpwIMo/ThsEEasBNzWjJ21dKg4is
        8VZ6zFZzzLqbHB0X/1mpK3p8HZcVM5s=
X-Google-Smtp-Source: ABdhPJzlNf7ossuAEutPHptMsCAhcoSQO2f9IZYHdnyrWan50tHM/Xmk54r68EJ1CeNz4kcbd8Xj4A==
X-Received: by 2002:a05:600c:3393:: with SMTP id o19mr3992803wmp.163.1623154396375;
        Tue, 08 Jun 2021 05:13:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m3sm20701968wrr.32.2021.06.08.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 05:13:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.13-rc6
Date:   Tue,  8 Jun 2021 14:14:57 +0200
Message-Id: <20210608121457.3202430-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt-fixes

for you to fetch changes up to 9e79e58f330ea4860f2ced65a8a35dfb05fc03c1:

  arm64: tegra: Add PMU node for Tegra194 (2021-05-28 17:45:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Fixes for v5.13-rc6

This contains a single fix to eliminate an error message during boot
caused by the lack of a PMU device tree node on Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add PMU node for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
