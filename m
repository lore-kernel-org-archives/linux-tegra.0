Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD4AC4332E
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 18:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 251162311D
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 18:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406699AbhALSPf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 13:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406700AbhALSPc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 13:15:32 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E10C061786
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:51 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id s26so4755362lfc.8
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmlXJxV3426flC9X6XIEScZVjUI1xhJoJxCzxaO19QU=;
        b=mpHRBNE8Zqrl/cKeGtplmH7385gfBvkxDOLO7fQaNM10orQk9DaSZucKRSt8Ibi6JF
         Wa8kqgOuIJdt/GAaGoe0vDhIL9JRunMpvzpP+aInQmt1j5/F6R3v1w7VMWCEavpydKlF
         rnAWSIClBmMm5VwcbsN1UYvZh49paiZLn3Q2u1d5uCiP5oaYzOZFQB9ieV6DJhBW7ChI
         pQGNu+jw5dAGan/0nYzuatENMwNfU1i9T6rKbGwjBx0o37l/frQ1sijXhHLNNcTbpS56
         JChOqiZHr2Rtpa4fzuv+SRAha+1XhAXteyPFtWbsERZCsSMk2ER4lmGvWEdBx6itH+So
         X4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmlXJxV3426flC9X6XIEScZVjUI1xhJoJxCzxaO19QU=;
        b=O1aMUXF3FSnNaIrRMN6eWIgEf20umvIAn60ncQPCqXNCzfByGt/KAZRpaQUECPPZzh
         tkVwS9yvjlIYFLZdx+TsF4rKwouXXfZc0wasUv77F5I7tNgIemrzxqlQ17ngzv3RAadU
         M6fidmlMk/PBwtHBkmlXoZnJrKLZzDoP4iHX/zDjQlanzcDJAefSqEUzhyVJ1UeiSz8T
         Zton4qD5XGnMkKnCCx4Ce6G/F+zVIOSYvD6R+KhezcODXRb8YCUonrAfzSkLac5vlVa6
         bICbWqrNHrWQ2KTi9wmjrr5DkaVXoH9u7Ja+hTn0QMK+RAZbf8e+knr6LVkDorPE3FUb
         KAfg==
X-Gm-Message-State: AOAM5313j8OqM5+coXvGRF8BGwAMnXu2ircquLLYLMa9qK1zKUeKa7OB
        PnyNE7js8Hsa+qjfgCGIe2A=
X-Google-Smtp-Source: ABdhPJwRWJWf2uR9zyaVmRb/EqRQCPK9M4/RpuVB5UAs0Qe/O4slPwwUcPAjhdkAO5hAxRt2B4acBg==
X-Received: by 2002:a19:787:: with SMTP id 129mr79178lfh.234.1610475290531;
        Tue, 12 Jan 2021 10:14:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id r8sm417420ljd.140.2021.01.12.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 10:14:49 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] Activate Tegra114 SoC support by Tegra DRM driver
Date:   Tue, 12 Jan 2021 21:14:18 +0300
Message-Id: <20210112181421.21293-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series enables Tegra DRM driver for Tegra114 SoC and corrects GR2D
compatible entries, which is a minor correction, but it conflicts with
the Tegra114 enablement if applied separately, so I included it all in
a single small series.

Patches are tested by Anton Bambura on his ASUS TF701T tablet device,
which is powered by Tegra114 SoC. Display panel now works on Tegra114.

Dmitry Osipenko (3):
  drm/tegra: dc: Enable display controller driver for Tegra114
  drm/tegra: gr2d: Correct swapped device-tree compatibles
  drm/tegra: gr2d: Add compatible for Tegra114

 drivers/gpu/drm/tegra/drm.c  | 2 ++
 drivers/gpu/drm/tegra/gr2d.c | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.29.2

