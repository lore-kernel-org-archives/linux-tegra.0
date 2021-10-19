Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40876C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 23:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B65D60C4B
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 23:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhJSXSn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 19:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhJSXSn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 19:18:43 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10E0C06161C;
        Tue, 19 Oct 2021 16:16:29 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o24so7564186wms.0;
        Tue, 19 Oct 2021 16:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irTv5TiOSZ/Hvhv+R6lTxY2eZG4GvO0YoQObjdDBNH8=;
        b=SWV35HIxDuZ77zB4+OKvo5EvdfdLIgkJs9B1ZQUSqNfEibPA5L+Ez/c2gX71zoPZpF
         rjP2IY0h+svVBllnXi67c7xhg2BEg9CVbFZ6nEBvH9O26mAsMw87ZcVkZTjjqaPuZV8d
         e2dEW009zaA9Ramzat6Qco3ePTKLBAxGTb/W2uSIE5f1kDZ4EuWACJydj6wwNJ5uQ+Fv
         t9Vr8mKAUfliYcC883YTiKhd8HOG7yG7HpAe3eyHf+3X5dfOOv8idkEDj9xJTUmViWPI
         C8aAj93nW1LiDeNgG5qv99qoS40V7d8qczFuaREWP3rVqtElQT7nPB9jpCjrcgHfUVix
         B1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=irTv5TiOSZ/Hvhv+R6lTxY2eZG4GvO0YoQObjdDBNH8=;
        b=SBPBGsUQ1GxHIpC4ouBBKooBwUSHy7CQrR0K8tRW+sJnBJ/Azd226gt1nAxMMHCHY3
         Hn2ESWCICz5k2ZTiheAEf8DPN7h7LLfT8nypNfoUtszG0GknUOEWXAnuTu6ive3pQnTU
         IWKc9qfK4j5J+Ci+xSh4mbUoF/55Dl/6t9qFZsZofOJjeZIP5jrE0Ed5KVu3xDVTWPGa
         xu6Dp2QR5043OsEKHNUDLtjnuV+rnAqXjjeTNAQI2FXTYF/8XZ5R7h9vErV2k5H/X3HI
         l5tJ5O0wGVSE1dQB21xE2/1EeyNUamdrcgi3R5RBmJ3i0Zje6ansKQB9NM0F/nwxNip1
         LwPg==
X-Gm-Message-State: AOAM530PE7VpxOTgiAn6g9IMlfdbaL/5Wd2AlCayXuRSgOFMac3Oh0HG
        qGOp5jgaS77pzwKVZTOji5c=
X-Google-Smtp-Source: ABdhPJxu/lK53sY6QzpBywQ95fKffShUdHHjqWiBa7SLhjPtJOFlCOBvvzCVo+L0kJbVNM2AsrXE8Q==
X-Received: by 2002:adf:a1d7:: with SMTP id v23mr47123821wrv.171.1634685388431;
        Tue, 19 Oct 2021 16:16:28 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.gmail.com with ESMTPSA id r205sm426497wma.3.2021.10.19.16.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 16:16:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] memory: tegra20-emc: Add runtime dependency on devfreq governor module
Date:   Wed, 20 Oct 2021 02:15:24 +0300
Message-Id: <20211019231524.888-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 EMC driver uses simple devfreq governor. Add simple devfreq
governor to the list of the Tegra20 EMC driver module softdeps to allow
userspace initramfs tools like dracut to automatically pull the devfreq
module into ramfs image together with the EMC module.

Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Suggested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 77c5cd52d1a2..497b6edbf3ca 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -1288,4 +1288,5 @@ module_platform_driver(tegra_emc_driver);
 
 MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra20 EMC driver");
+MODULE_SOFTDEP("pre: governor_simpleondemand");
 MODULE_LICENSE("GPL v2");
-- 
2.32.0

