Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2E1C2D0A3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51C2D221E2
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO4dgNJ1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgKDOND (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgKDOND (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:03 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6ECDC0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:02 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a7so27289229lfk.9
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z909YoxPk71eocvXiI/YtrY+U+Ju2cM/tflDiUfpx7g=;
        b=YO4dgNJ1g+ocgK489UiH5JSErNhT0qj5RHzZy9dz/Zy785oxgmTY+iYnpQzJp5Ya5R
         nwXKrfFKcE40hXhutH4jbDBbCvLVqLt2VC4+QuoKMkFs0xd5mecoydNODQzkpLMe6NPc
         JxWdCWvDplDeeGYQ8yQY+GUTcPbjLOrRLfF5D/6QDhc4zJJvmWcs33jKAdX0BN0jnvI3
         M7bhSwY7X3PA4HwKwmPMV3gCO9YVITKwnFRjiqqV1fQ4MRdAlfrEdxeFEEU8U9ngnzHJ
         rmmHtxfyqxp4p8mBzcKQDPd5I6qKe3qzzB1bavdrXlffIAGts2ab+RE/yvqo7FZa3buD
         DTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z909YoxPk71eocvXiI/YtrY+U+Ju2cM/tflDiUfpx7g=;
        b=Y1DPYH6qnzMxytpVa4gTwjlC4fuGnM+GzqVI1TKQ0eOq8XVj68AQCZVue6LkjGvM0l
         V4TVyOenW174bhdxLbq43j9TtHJiM4sx3LPRnuWpEoyiwJARgaQLVvgiIDmA3nsOmH+F
         MeraheGEFBJ29UV2UWo1qfIFPZFK/QxolMNKlavfamt47/6a0CJM7oKu1zBB2jmkD98c
         PysMjEIg+KYteXopnS6q+BAgVwnVaQL+jlJllDDI9PSfym1dXHUKTs6h9EvGgZExNm13
         6r+dDP5/dwP36XAzhho+Yg5r3GwAcAGTDT38MQCCMBZwjQUus+3WzATLqFS9+0pB70yw
         2nAw==
X-Gm-Message-State: AOAM5328jhgxgCwpAf0alMVTeO2vIHT8DfP9Js4liQ/UNav2JVsMBgam
        iNJoG149+9TSKXUWiwmu//s=
X-Google-Smtp-Source: ABdhPJz+1PzTwloEqAZ5VnvSABqYkElTQrgRmQcSR7oVAeys3KtoAyJSfwwnmukYAsBkIvve3zYYBg==
X-Received: by 2002:a19:414e:: with SMTP id o75mr1134222lfa.28.1604499181470;
        Wed, 04 Nov 2020 06:13:01 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:00 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/8] Nexus 7 and A500 device-tree improvements
Date:   Wed,  4 Nov 2020 17:12:43 +0300
Message-Id: <20201104141251.25834-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series improves device-trees of Nexus 7 and A500 devices by
correcting old and adding new DT properties.

Changelog:

v2: - Added these two additional patches:

        ARM: tegra: nexus7: Set video decoder clock rate to 408MHz
        ARM: tegra: nexus7: Use panel-lvds as the only panel compatible

Dmitry Osipenko (8):
  ARM: tegra: acer-a500: Correct thermal zone names
  ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
  ARM: tegra: nexus7: Correct thermal zone names
  ARM: tegra: nexus7: Improve CPU passive-cooling threshold
  ARM: tegra: nexus7: Add power-supply to lvds-encoder node
  ARM: tegra: nexus7: Rename gpio-hog nodes
  ARM: tegra: nexus7: Set video decoder clock rate to 408MHz
  ARM: tegra: nexus7: Use panel-lvds as the only panel compatible

 .../boot/dts/tegra20-acer-a500-picasso.dts    |  5 ++--
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 30 +++++++++++++------
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  2 +-
 .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  2 +-
 4 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.27.0

