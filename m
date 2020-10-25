Return-Path: <SRS0=lnQj=EA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB70C4363A
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B9F5222EC
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJ39vN84"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420243AbgJYWko (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410359AbgJYWjo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0821C061755
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d24so9444225lfa.8
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ekn/3cXlb3tBfMR119hujhhdrQUurBhB45J7ffPKsXc=;
        b=FJ39vN841mnVfnyCVSz+Y+E78M276M6f8HYYX33FyCiLkGFYKeQfdAIkwR6hrZCdbA
         RH9jnF1urCdYL4fZBtB0nC+XiCOI0g2YKKxpv1fNcnTtxcYGbH6y/ECtKU98UQOfbDrY
         7ETcEiCO7pIHEAJ6QnWDjwbd+jYEWz8SE9iBFaTcTw8yVHapn8SBRXJEC8fkajP6+ava
         faO8k+NvvZvFl49/jIx9RJkTn5I/i2fcpsNJODI3BMPpYB+mgHz3mOVAsQ3eBEA7pZ+0
         W8OutFsQsDQC2dM5o5c6hjzUuV4lQSXphsSQipCctkClaP9SYwFOOhJczgKcF5ASR1Na
         YMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ekn/3cXlb3tBfMR119hujhhdrQUurBhB45J7ffPKsXc=;
        b=r1PfHtxuuSd2tuP43eTHNo/EUyZMJJq4FcpTU/qkkx2oMkeN3LuvJFyQ+/iEDwp3EK
         Qy3XmnRVP7YBKS453kDKT6vOFtVSl6f0dn7Ih19uABHWPUTS5eNnFtH3KLCTBd34qJ8v
         jw1HNObQkqC695y0Ncny8xDbx5QWmPxnOYDGMQ4HSkXsk2FvpPu6z+zXP4GH5okP7qN9
         9x1WiH4EIcFwsG4Vnq+4q19UDZpCro+KFy86L7lugP1/zQLi/ZaHMdDy5Qe4RbejQnoA
         L0HVD1qYlFjLxFgsv7ak4eZbkF2um9tTGHVIioa+B1cXMjlAmiLZ2Posit0UWANKQtFk
         PbVw==
X-Gm-Message-State: AOAM5310QmPKJY4lQ4/4sACkOOUAQ8EEgIcxjeSkv9PePIaJf/650+o3
        N6rRnxhmZf919GJAhI1FPq0=
X-Google-Smtp-Source: ABdhPJztdrAYfJEG1Sp8FOd52YyspUxb9nNLsDC83E0B7d6/3FuqNxZx6aO1PMA/1tX1+WSBSo/ccA==
X-Received: by 2002:ac2:57c7:: with SMTP id k7mr4310900lfo.20.1603665581183;
        Sun, 25 Oct 2020 15:39:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/6] Nexus 7 and A500 device-tree improvements
Date:   Mon, 26 Oct 2020 01:38:45 +0300
Message-Id: <20201025223851.6984-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This small series improves device-trees of Nexus 7 and A500 devices by
correcting old and adding new DT properties.

Dmitry Osipenko (6):
  ARM: tegra: acer-a500: Correct thermal zone names
  ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
  ARM: tegra: nexus7: Correct thermal zone names
  ARM: tegra: nexus7: Improve CPU passive-cooling threshold
  ARM: tegra: nexus7: Add power-supply to lvds-encoder node
  ARM: tegra: nexus7: Rename gpio-hog nodes

 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts   |  5 +++--
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi   | 15 ++++++++-------
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi   |  2 +-
 .../arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  2 +-
 4 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.27.0

