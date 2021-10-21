Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15339C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 18:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8AD86109F
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 18:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhJUSgF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhJUSgC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 14:36:02 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BAAC061348;
        Thu, 21 Oct 2021 11:33:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id o11so808026ljg.10;
        Thu, 21 Oct 2021 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KmzJ7Fldl3+PHFFkx5m6zHtzRZgb1z6Rpjy5yivMyhk=;
        b=SsRjBzuzNgZK0pi5JPfQQS1rBrw3o5x5SSvhGTzCm5gvBiq5w7uxf6W+/jWPecNv4z
         CiHuIPQbw3LWsqmex1c8jdEBcJbXDykbM6yhLe8PKAoMrPGLUSQuXZ0oWbb/rToDyH5l
         1YnQeYy1muWraB4CqDPsvyQn+QypeCO4bRXhT5S6zfneEGfAEsHXbODWRYxdAy3pjxBT
         8NzJQ54TJhlAVgWR3u+mXaj1MaejaSgct+bk0vfETHC7tV5pZURg48x43Hy9L9gi1QA8
         4v+VZPlSPSzwgztXdsMCzFaUGy5RXQjfbJ9/NbGe12XQDTn1wMfeTNqY58vKTo6bT1Iu
         zGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KmzJ7Fldl3+PHFFkx5m6zHtzRZgb1z6Rpjy5yivMyhk=;
        b=cYN5pmp/DACcP7oBHg4Se/WuO5aFfI9gjnU2e5G3Y9T3ochzbwG5SrDzz1eroVJGjL
         ygpZsZcS2bTh9GMe9m9KdOw33EJf3Rwr5oSW0TJ/eR67Dng5qVGSkz2pjaKaSD+/VL9l
         1qYZJ9HpuX49OGX4B4M9e/Co8iNpRC3d7e36moDiptJFcMQTc/XPpFEmxYQVsDbe4MO9
         MLNQlXVYudbCBq3ecRGGnkbYxi1ACKd3spPxBGZBYg/z6qlS6Za9zEE3cc6X6t0n1HmU
         Yqxd7dXwLrU+AgKTbCpMb9xjAacVGl7XawE6dkv1pURejyFbhbP1kHy6d6gYdnzQbKxt
         1UUg==
X-Gm-Message-State: AOAM533r9a2Myf8OM76IQhFhNjoVMGI3HYjPKRjap4RRX/rIo3gzBVLx
        a6DrnFi7oCca4JS/ljBxBow=
X-Google-Smtp-Source: ABdhPJxyjpATbRFufA6DS49KfB6fTMpZpQf4+tLYIocvMyAHTd+KAnU0/c/IwTO1HpWe/KfuInyXYw==
X-Received: by 2002:a2e:a364:: with SMTP id i4mr7829985ljn.326.1634841224114;
        Thu, 21 Oct 2021 11:33:44 -0700 (PDT)
Received: from localhost.localdomain (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.gmail.com with ESMTPSA id e29sm520894lfc.141.2021.10.21.11.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 11:33:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] regulator: Don't error out fixed regulator in regulator_sync_voltage()
Date:   Thu, 21 Oct 2021 21:33:08 +0300
Message-Id: <20211021183308.27786-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixed regulator can't change voltage and regulator_sync_voltage()
returns -EINVAL in this case. Make regulator_sync_voltage() to succeed
for regulators that are incapable to change voltage.

On NVIDIA Tegra power management driver needs to sync voltage and we have
one device (Trimslice) that uses fixed regulator which is getting synced.
The syncing error isn't treated as fatal, but produces a noisy error
message. This patch silences that error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Check regulator's voltage-change capability instead of checking
      whether it's a fixed regulator.

 drivers/regulator/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 26bee444fc70..86aa4141efa9 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4249,6 +4249,9 @@ int regulator_sync_voltage(struct regulator *regulator)
 	struct regulator_voltage *voltage = &regulator->voltage[PM_SUSPEND_ON];
 	int ret, min_uV, max_uV;
 
+	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE))
+		return 0;
+
 	regulator_lock(rdev);
 
 	if (!rdev->desc->ops->set_voltage &&
-- 
2.32.0

