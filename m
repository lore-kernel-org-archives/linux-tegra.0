Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832E7C07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59B906102A
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhGKX55 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhGKX55 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:57:57 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B932DC0613DD;
        Sun, 11 Jul 2021 16:55:08 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id z12so12588887qtj.3;
        Sun, 11 Jul 2021 16:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3Kzwz+jAKCyGoxvHGSC8ZzVekBmr3R22rOzOHE74rM=;
        b=sxnw484eZz4a21ez33Fk70FEiTaRiMH5Pm1o3DCGoheBo8p82YZ2T3pyI286lwifsA
         kn0rZkeaPxVBytyPXd+y08s1CnF2lErQbproM7P9+J9HXKasgVpsyYD3+EQOlo5fHsnR
         JYRBNAYLO6U2dgWISYnsIw7j+8GI0zexnq4D4s4k/tPopSBL9xNEU+Yo5CVm4pt3Cpni
         Agf5fzbhRChItd5KLNF+vGx/jhDMM5SqCZJp9nCfWf/R2dGkgOiMZPvtmYu819yZ07Pn
         EmH0ecHBOGUgeWkMv9ydx0LFyTat1XcPuiOG/17tQ0aFFBZr+pd8rv9cLAC3dKDoeWsN
         deHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3Kzwz+jAKCyGoxvHGSC8ZzVekBmr3R22rOzOHE74rM=;
        b=kZyUijEBEv9GHQ5WqNyzCrUuozTNVxPH1n7L/4T0GDV3YhQUTCm3pj3GcRWX/sfFqu
         HzT7LaglNnEvl9zO2PsBjq75IURNBSxRZohI6RAStRJUdl/p4ocsRSSyxUe9QdSuNXrU
         jOWGJMuYza1jligteJoyB82s0ZavHIMN4wAZXzqioI8LVk7wH2DgYOFp0EJJeZMPwhD9
         Zx/hCh11Qd1zbVcWJq5AtxBXxO6JHzlwz5axUPkaySeJLE7NU5MIw7ubeQS2C+ptk1x8
         ye9/7k/o1SrtwKqIT3c7rY4np8klpoKQ2bJ/FNEZalvQM9wGHRzE4t1etwUX2iDnx4LC
         y/9Q==
X-Gm-Message-State: AOAM530qgyNoLrEfMNa5f9/tTPe5B11h/z/LOYloaZmm24O8bxDzTO4a
        ozl0KkNZfcOUTgoZhCVBqOo=
X-Google-Smtp-Source: ABdhPJxZ6EgiPJi8m9R+0ahvHcQ7LxrJcxRFYvGO4oSQ0Xp1Gsl4nKqlYumXCejNHiB6WBRfc9FawQ==
X-Received: by 2002:ac8:5e12:: with SMTP id h18mr45858797qtx.365.1626047707929;
        Sun, 11 Jul 2021 16:55:07 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id h10sm4963133qta.74.2021.07.11.16.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:55:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/5] Tegra Kconfig improvements for 5.15
Date:   Mon, 12 Jul 2021 02:54:30 +0300
Message-Id: <20210711235435.31165-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series enables new Kconfig options and fixes CONFIG_FB that was
broken sometime recently.

Dmitry Osipenko (5):
  ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
  ARM: tegra_defconfig: Enable CONFIG_FB
  ARM: tegra_defconfig: Enable Acer A500 drivers
  ARM: multi_v7_defconfig: Enable Acer A500 drivers
  ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR

 arch/arm/configs/multi_v7_defconfig | 4 ++++
 arch/arm/configs/tegra_defconfig    | 5 +++++
 2 files changed, 9 insertions(+)

-- 
2.32.0

