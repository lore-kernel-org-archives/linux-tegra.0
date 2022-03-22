Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07B1C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Mar 2022 12:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbiCVMjb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Mar 2022 08:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234933AbiCVMj3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Mar 2022 08:39:29 -0400
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7382BC8
        for <linux-tegra@vger.kernel.org>; Tue, 22 Mar 2022 05:37:58 -0700 (PDT)
X-QQ-mid: bizesmtp80t1647952668t817pwab
Received: from localhost.localdomain ( [58.240.82.166])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 22 Mar 2022 20:37:43 +0800 (CST)
X-QQ-SSF: 0140000000200090E000B00A0000000
X-QQ-FEAT: ypgDW/Zu0kXr1CQDYbMWjnqU05VXdwzKjT0uEplbMwiOr+S68QuMQSVaSOzZO
        Tj4lRUs1T1ZD/yybbZZXr1BFpl7m5GBfVsmz9/H/5KbKjdr7/E7oX/7fYkegVL3ZKPlpnS/
        yha+1R98KejdnOX3ZwVu1wq+KRVcRNIB6+Z8BgBNpZ+0woutmtbgrKIEAPbb2T4qPRJLrF5
        I38mS1ZprNP3d7AFW2I10urC/U/onqAG+5ROe5azxBFmLwMFfNT57OFBDWckDjtBUJHTmDQ
        h/J/yFK3PF9R1a3uTbaJ8WyFBs4EMiEMQZTYqjedibtls6xqXDvOS2sfmw3844EsIjVReMP
        B3cBK6XtJFiLDI9i28=
X-QQ-GoodBg: 2
From:   Zhen Ni <nizhen@uniontech.com>
To:     ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhen Ni <nizhen@uniontech.com>
Subject: [PATCH] i2c: tegra: fix reference leak when pm_runtime_get_sync fails
Date:   Tue, 22 Mar 2022 20:37:40 +0800
Message-Id: <20220322123740.9257-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign10
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The PM reference count is not expected to be incremented on
return in tegra_i2c_xfer and tegra_i2c_init_hardware.

However, pm_runtime_get_sync will increment the PM reference
count even failed. Forgetting to putting operation will result
in a reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 03cea102ab76..4e7e75be58c2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1372,7 +1372,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int i, ret;
 
-	ret = pm_runtime_get_sync(i2c_dev->dev);
+	ret = pm_runtime_resume_and_get(i2c_dev->dev);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev, "runtime resume failed %d\n", ret);
 		pm_runtime_put_noidle(i2c_dev->dev);
@@ -1713,7 +1713,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(i2c_dev->dev);
+	ret = pm_runtime_resume_and_get(i2c_dev->dev);
 	if (ret < 0)
 		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
 	else
-- 
2.20.1



