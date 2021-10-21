Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1696C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 11:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7D1B61130
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 11:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhJULLS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 07:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbhJULLJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 07:11:09 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A800DC06161C;
        Thu, 21 Oct 2021 04:08:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q16so1635686ljg.3;
        Thu, 21 Oct 2021 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zZrMs3VjgSj2vo9vp8usj2G+hz7bO5ZSGJJyIM4jIE=;
        b=EquSZeiS9fgDers3p1E8Qps0VQMIWhtw6AnoBgUlOJS7apDXHzlUkifkVKVax8lSdk
         fFVgdoOp/nti4RDRk+xmzWPFTv6smHkh1+jSmCqIcbHZzT006P/4dbcc5zVV6zjbZd/x
         JqlLlickznokrLZREulW/R6X3zJti3yGDApO1WUrQXUYobKUyFFs4uLuKni/Zvj1mXTs
         ElRSZ33LOZhwDj2sDthVN5xQI1t7B025RSuAxJhWYHkxY9vBwO0yV1Dae7da8CQaJaBz
         0p2chxgHVjcKP7TYgYg8re0XeAMMWmDfyr+HdO+3ld0gqQZNUqtQJTvmsGx59umtly1v
         +KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zZrMs3VjgSj2vo9vp8usj2G+hz7bO5ZSGJJyIM4jIE=;
        b=bFd5ZmLp/sRgoKLNoRYaNLIzuHejyt3vkv9tx56V9RMWeYTKVMnAbleO8Bn/JkjgRI
         6amD7zCCYpTZrlwuWw+sjA/oE3mt2hxEhqCRBQqsKRZFzDiCYBZQ2ufuCcd/fCCOPeAj
         PqrNH7jMnt2XjwpEOa4QtIlqr0MzQ/Ah03FKLoPTUJoAbeLwE86YLcpS68kQJgASjSkb
         v/VpSyse0oU2nIH2fP5G+1tfxFgqHqapXNNUvLg+al11OsZPL/Hbrm1VzLD2Dka+BoKG
         LR5qNChS4XjfvQ/Outoc2MKLUdi2ma5qCkNQ8dv4gOzU2aWzPdJxmfEHqbqdodlHuJXF
         HWHg==
X-Gm-Message-State: AOAM532r52vSM56X7gqRclfN5y9aXsQ5FLXoYnZ4NmXcJgj0IPM8UNA/
        Wkv3iN2KOEBf1ldkqWlIQ31A3ivGVZo=
X-Google-Smtp-Source: ABdhPJwGL+/0BDb/Ict3KMAcvs0lfmeArGSHSYe+CQcI7TFTKeD7F9BS/bo6hO5tB1scZ6dqj14BrQ==
X-Received: by 2002:a05:651c:b22:: with SMTP id b34mr5140900ljr.62.1634814532044;
        Thu, 21 Oct 2021 04:08:52 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.gmail.com with ESMTPSA id b39sm517479ljf.82.2021.10.21.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:08:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] regulator: Don't error out fixed regulator in regulator_sync_voltage()
Date:   Thu, 21 Oct 2021 14:07:07 +0300
Message-Id: <20211021110707.20416-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixed regulator can't change voltage and regulator_sync_voltage() returns
-EINVAL in this case. Make regulator_sync_voltage() to succeed for a fixed
regulator.

On NVIDIA Tegra power management driver needs to sync voltage and we have
one device (Trimslice) that uses fixed regulator which is getting synced.
The syncing error isn't treated as fatal, but produces a noisy error
message. This patch silences that error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 26bee444fc70..e1324edb3f8d 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4249,6 +4249,9 @@ int regulator_sync_voltage(struct regulator *regulator)
 	struct regulator_voltage *voltage = &regulator->voltage[PM_SUSPEND_ON];
 	int ret, min_uV, max_uV;
 
+	if (rdev->desc->fixed_uV && rdev->desc->n_voltages == 1)
+		return 0;
+
 	regulator_lock(rdev);
 
 	if (!rdev->desc->ops->set_voltage &&
-- 
2.32.0

