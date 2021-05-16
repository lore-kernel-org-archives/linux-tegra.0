Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557DEC433ED
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 22:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20BC361166
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 22:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhEPWWn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 18:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhEPWWn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 18:22:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210BEC06174A;
        Sun, 16 May 2021 15:21:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id r5so5968631lfr.5;
        Sun, 16 May 2021 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4wjkerGjnODWZW9w3YSKmK8x5ot3hbK6hwMuTDmldcE=;
        b=SOFgZmn4qkUCUJb8IOMOqFEFhYzwal1lq5N/vXTLu+ANousD4LTnbUDm86jL4ogkC4
         /r52orR7FvXRMlV5zEKJaV6Ao3odh5Wg9gLGwqXhdx/blE7iQ0nraSWPcQt3PJ9A2YFb
         hirtYxnr3zgPvuVdD5fbw8nLAuzcyfvtf+6X1/zOBNPuo1V+WgtUezxLwDNZALSHgpEw
         2xF/21KpTnBGyK084hdnga2Sj8duMiHw96/QvRHSYb6ndET9iCH3JKwBW6fdrR9nXj0w
         04irwrd+5gk1h4aBf2oo3/DCZoqMQ8YTmANX8WJy94wS+ZKMYXhHJwTZ70ttjd2yzKhU
         dyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4wjkerGjnODWZW9w3YSKmK8x5ot3hbK6hwMuTDmldcE=;
        b=C62r8/lxnx7aFfPXvfH9WJR66QXMP1UIAs7jodemJYVfdxPOQkbzLQZm+M1JnR4ECl
         CESr85IydCMy2yycvOzNG0jQr1vgAogQcUhbr2/auHGh5HIGQCgPnPUu+lD2k+HvUfbs
         FDjX6ll1R0WP+YjCQJVMxPo4KNXRS64erCm+A5XiCO932og4yqhCD61ei2Ndwg+C/kWY
         oX8DQIF9MgyQ2FSMtXSLCPC5DsnE2abuVcyGn52suN0O0GBF6lQgh/puVxYQas27US1G
         6OcDmRDqFhyumJmSMaxdh20+MQBbUWFvVJRS3c8txs8G9uRGheSai0AgBpL0HItoICxQ
         WBwA==
X-Gm-Message-State: AOAM530y538NNWgEVQo4Eo2RKOzMJfX13JINs9ANFeBEteDOLK6hoopU
        dehF6jaE6w4oTr/HjDj4ORM=
X-Google-Smtp-Source: ABdhPJxvpWyWfEg6OiQgcp+LtbmPZhJLGYVB+1F6nDnJCVddTxwcKNWk9+z+6IFW1gTPav7+7Mz68g==
X-Received: by 2002:a19:3813:: with SMTP id f19mr3914481lfa.120.1621203686681;
        Sun, 16 May 2021 15:21:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id q27sm2680275ljm.127.2021.05.16.15.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:21:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/2] regulator: core: Add regulator_sync_voltage_rdev()
Date:   Mon, 17 May 2021 01:21:01 +0300
Message-Id: <20210516222103.28595-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516222103.28595-1-digetx@gmail.com>
References: <20210516222103.28595-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some NVIDIA Tegra devices use a CPU soft-reset method for the reboot and
in this case we need to restore the coupled voltages to the state that is
suitable for hardware during boot. Add new regulator_sync_voltage_rdev()
helper which is needed by regulator drivers in order to sync voltage of
a coupled regulators.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/core.c         | 23 +++++++++++++++++++++++
 include/linux/regulator/driver.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f192bf19492e..ead0b6d2af45 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4105,6 +4105,29 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage_time_sel);
 
+int regulator_sync_voltage_rdev(struct regulator_dev *rdev)
+{
+	int ret;
+
+	regulator_lock(rdev);
+
+	if (!rdev->desc->ops->set_voltage &&
+	    !rdev->desc->ops->set_voltage_sel) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* balance only, if regulator is coupled */
+	if (rdev->coupling_desc.n_coupled > 1)
+		ret = regulator_balance_voltage(rdev, PM_SUSPEND_ON);
+	else
+		ret = -EOPNOTSUPP;
+
+out:
+	regulator_unlock(rdev);
+	return ret;
+}
+
 /**
  * regulator_sync_voltage - re-apply last regulator output voltage
  * @regulator: regulator source
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 4ea520c248e9..35e5a611db81 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -540,6 +540,7 @@ int regulator_set_current_limit_regmap(struct regulator_dev *rdev,
 int regulator_get_current_limit_regmap(struct regulator_dev *rdev);
 void *regulator_get_init_drvdata(struct regulator_init_data *reg_init_data);
 int regulator_set_ramp_delay_regmap(struct regulator_dev *rdev, int ramp_delay);
+int regulator_sync_voltage_rdev(struct regulator_dev *rdev);
 
 /*
  * Helper functions intended to be used by regulator drivers prior registering
-- 
2.30.2

