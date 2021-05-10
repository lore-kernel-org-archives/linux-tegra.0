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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2989EC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 003BA61574
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhEJWIZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhEJWIY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:08:24 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA12AC06175F;
        Mon, 10 May 2021 15:07:18 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id v6so22679207ljj.5;
        Mon, 10 May 2021 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilcrEifGqalrK7A7bBBtHS0TKbUU9cT7sHuMPy0qljU=;
        b=aHK8dZiR30/8lRK3z2+LGJlXRLGlX6GkhapyI3JqJhandAoRw/2EtWaIwzYISt+nMQ
         di7fZVwYZN+B+0NqIMl/9RbWEMuja0cw20gfSp+t62jczmC2L9LCzEVwR8ZweqpIbOs3
         7aC0G9jTc/HW67H0Ubx3tvCrWZqmqQnzEPKDT6makcOL8P7bS18bZ9FKqR4wipbQYOTe
         J7fN+dgJ7oRowP1DHVlzt4xrG10ZUdTXUsNT8BzPsfNNfNmKQIdYVrZg3G/kpDVYKGse
         6w1SLyOn/Nl3WZNHoHLTlwsW1Mols25pBuXAoWitWgqoQtObAZ0pH2iAOJnm+sd1e2zR
         RRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilcrEifGqalrK7A7bBBtHS0TKbUU9cT7sHuMPy0qljU=;
        b=gsdjxQVBOuiNcwzcEJcVoAGW3JqhBDXOMB1i9vh3RCjOD8WuaH1CDy88qpUrFWotHZ
         PBnU7Btw+l3d7T5AdCCaRWPMrqNkYdwmmTJ55NDhC4O5pVzNP+/lGyjNsEi0dFoBsw1P
         5sLMIdwNyVZeLKagnkQE1jXvLMVMz7WeZ3cPNsPGecAWwWMyCz7+Wpe/lsE2XGhrEOHQ
         I/JsFxHjE5ApTR2vreXJc/9XZMJkTQfFJ/bP1adlKXhrWj1Igo1G6p9YktlS0+PtPr0N
         HogZ63ErfA62GNAlhbUJlTa7L/jsCa/l+MHrOU8m8+u4OvFiKOYyR1EqAl3M9614ZLzN
         Bz4A==
X-Gm-Message-State: AOAM532+Mjos7PxqBFVlkzTlC3vgP8VVaX/4chXOfMcnCr4Yz49tl6ch
        tDY2x8gPCk5TcTrOOygZeTQ=
X-Google-Smtp-Source: ABdhPJzHGEbCDM9SxLdRq64G0N07VXSJckyF8w0rHbFZzdPlAaWCeEjtnG4HysPzdYBTIfInStEU1w==
X-Received: by 2002:a2e:9919:: with SMTP id v25mr21350238lji.189.1620684437442;
        Mon, 10 May 2021 15:07:17 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id v14sm2390850lfb.201.2021.05.10.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:07:17 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] regulator: core: Add regulator_sync_voltage_rdev()
Date:   Tue, 11 May 2021 01:05:25 +0300
Message-Id: <20210510220526.11113-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510220526.11113-1-digetx@gmail.com>
References: <20210510220526.11113-1-digetx@gmail.com>
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

