Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C647FC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2ECD60F58
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhHQCCr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 22:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhHQCCq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 22:02:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C572C061764
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r9so28869865lfn.3
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5ZuXhMpGL5msVn45H7bewBOf3GHABZ4uowOQcIc1Ws=;
        b=Aumw+GHX0XJrGdGoDrraDp+6mv0Ob0Y0mxmRSD1XjfiAv8dK+HJYTq412kzRQZzv7M
         j58GPZ163iczCL2dk8ucYqJ59XJ+b14AGoE6O59TiUR/4ddYbpd/cZxEGtq5hk2AMKo3
         EtjKxNk/QfLOGO/07q1lqdbJbVTaTcSAKK7ydTkuRh/6hmDY5IlvnTxhSILF1p6V9aKE
         M4eDrlEje7FfPtslh+EwywLICfXCJ0baD1QD3pI3GDfKJVS7uUcE4w+dsVgohVRnyFS5
         VkRZoX0IKetrVs9vZfIzkyi15lkWYONrNbm2v34gCjU5HBTqNKvzS4kteFeRSKfCOX6K
         vWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5ZuXhMpGL5msVn45H7bewBOf3GHABZ4uowOQcIc1Ws=;
        b=HbGAkLa4xt4lKSQXCKNjeI7WH5rTnDE0fooYbJl5K/5Y6Tayd1Qv6haH3C6yPHhewe
         kZwZviN1vNnXabcbtgn9YaXf3/m77wpj4RsjIxEu8V/kgv7OgrmzmSN9zBsG6U5rFXZk
         HKBvuVDGFC29QnTCi57UCojHO62eQxqJmo/ILSmWU6QGio7EUlX+WN+q/qJdnqOQr1+G
         ZvcLTBTMaSO6jhdmCtcnyGOI9aNeHoRT90wf+k8lIwz5oVJ4lsoIoUhKmEc0qK7I4Tla
         Nz9DxKkMpC8BW/5089nTT5MualHM6VMrnkAbNhMvtfAUxBsyJEL2/hhmDA2AK/x9Rpw7
         i90A==
X-Gm-Message-State: AOAM533ZZEWSpql7uS3VBV02ooyHl5pKfUSHIxW6yqGz3FxrAgqxEfKJ
        FlxL2UzDH1+HLXuenUh55P0=
X-Google-Smtp-Source: ABdhPJybESbQjTKxFyl1+w7D6SkRS6QDSYZ4mztgQ10m8fpWo0YOWq5IW13UJwyDtlGg6fZd7XOZFg==
X-Received: by 2002:a19:500e:: with SMTP id e14mr541782lfb.487.1629165732749;
        Mon, 16 Aug 2021 19:02:12 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 19:02:12 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] Tegra DRM and Host1x driver fixes
Date:   Tue, 17 Aug 2021 05:01:50 +0300
Message-Id: <20210817020153.25378-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix troubles introduced by recent commits.

Dmitry Osipenko (3):
  drm/tegra: dc: Remove unused variables
  drm/tegra: uapi: Fix wrong mapping end address in case of disabled
    IOMMU
  gpu/host1x: fence: Make spinlock static

 drivers/gpu/drm/tegra/dc.c   | 3 ---
 drivers/gpu/drm/tegra/dc.h   | 6 ------
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 drivers/gpu/host1x/fence.c   | 2 +-
 4 files changed, 2 insertions(+), 11 deletions(-)

-- 
2.32.0

