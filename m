Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EE3C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Nov 2021 20:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240225AbhK1UrW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Nov 2021 15:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237186AbhK1UpW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Nov 2021 15:45:22 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA27C061746;
        Sun, 28 Nov 2021 12:42:05 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bi37so39133414lfb.5;
        Sun, 28 Nov 2021 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fI+O6/++Z4nOnCnJNHlZT8xBEfNIQq67hRSGfUTNSOw=;
        b=dcjUc/A6G0ntDrZjSz7wX3e3/r7F7SrY+3uMF8E+A93I5xKqW037IMdtOhnlf9vWoZ
         saLvk5YgLOVEO9xWpN+d+F0Fb4FQ4rmT3lgSvDOU0UR8qPhwiB2FwkgtRjoEWbOb2POd
         oePoutMq8Pt4nRoYyx9XLnADX1y04Al60pNPuSGg8ihHOj7T67Mh/hEhqF8XeDlPHjM8
         rs89N70TCQPiCqoZpi/kbrhuMr01fje5vISmI+uxWC04tYRYGxyI3aoMSQ1h0OJKrucN
         ReXDBiMO3ptQQSL8YnxnyJkxUL1NCXmr/u99R7b0PhOuOiX7M8PS+76eVgz24wIpIwTu
         eSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fI+O6/++Z4nOnCnJNHlZT8xBEfNIQq67hRSGfUTNSOw=;
        b=e4mCdl9V1H7x/5thB8jAE1Dr7Ypb+XBkt5EaKwhU+MxPECbubHqCXo+XrCYmQ23UAp
         yEHc8Vo4xLhVaTy8qepmu7/4EAQfsikX4XyeuDFjPNEoZSQEx8HiGpPLLs5B5CxPRvkZ
         2Tx2+69r9JsGHWXHrWPgUZyewGqCJwQoNHZv9Fqn9wgwoobIxWLsb9J5RFDDm6b1Y9Vc
         dhJVgzWxAfcaFDD5+TuckixptSxQLkmpUYG8IeFjwNFm2UUQuJjGZuVoh/y6N0eYroZH
         dxxPRbhhY0VwKvSX16kJWgHieuPATAnMpHOnWvfB7Z6em3pUyPzgkWVnZM7briqc4cjv
         +BcA==
X-Gm-Message-State: AOAM5303lz0up+ENa6TEHz11JMBxsNPmxuXS7D1Uwlh/XFWBkw4cuSbl
        HaRzc+6AgowERtLlggjFn10=
X-Google-Smtp-Source: ABdhPJyAIKXpJ3E6Ag9FzskqRGg6NgpC0ebPL1cvyWfMcBpDV8H2Awtpv2g6p7Ee05DUaxxKA/D/DA==
X-Received: by 2002:a05:6512:3e14:: with SMTP id i20mr43647553lfv.592.1638132123400;
        Sun, 28 Nov 2021 12:42:03 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se. [155.4.221.129])
        by smtp.gmail.com with ESMTPSA id o15sm1103048lfd.164.2021.11.28.12.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 12:42:02 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Kai Song <songkai01@inspur.com>,
        Jing Yangyang <jing.yangyang@zte.com.cn>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] memory: tegra: Constify struct thermal_cooling_device_ops
Date:   Sun, 28 Nov 2021 21:41:58 +0100
Message-Id: <20211128204158.19544-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The only usage of tegra210_emc_cd_ops is to pass its address to
devm_thermal_of_cooling_device_register() which is a pointer to const
struct thermal_cooling_device_ops. Make it const to allow the compiler
to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/memory/tegra/tegra210-emc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 13584f9317a4..cbe1a7723514 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -711,7 +711,7 @@ static int tegra210_emc_cd_set_state(struct thermal_cooling_device *cd,
 	return 0;
 }
 
-static struct thermal_cooling_device_ops tegra210_emc_cd_ops = {
+static const struct thermal_cooling_device_ops tegra210_emc_cd_ops = {
 	.get_max_state = tegra210_emc_cd_max_state,
 	.get_cur_state = tegra210_emc_cd_get_state,
 	.set_cur_state = tegra210_emc_cd_set_state,
-- 
2.34.1

