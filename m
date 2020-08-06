Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB692C433DF
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE73923117
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIUKmjtc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgHFQ01 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgHFQTs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:19:48 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FF1C00215E;
        Thu,  6 Aug 2020 09:02:52 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i6so9906415edy.5;
        Thu, 06 Aug 2020 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FNqcBw7gbdcsYAj3BqhT8zH10stbn01zoIqVBzt1ndI=;
        b=aIUKmjtcRfg+2LmyFEYG1ZKfDaRGWTeFidf5qZnIa7woOEXLSv/NhvJ5ESpOQxO4IZ
         9MEWqCc2LNCyqR9X9i10xzsTV7daNAESKymqsWecuAPz37090vufVngrd8fK579IWdVu
         sibVIPxcQBqxrlx8FlQVx6IPGHSUgp7YPR1tdGSoj2P8qEOirB78nkmGpX00tvC1axQt
         61EuuGL6Iu+W3cjKrZp8FbM7+hbENEgBBj9RDWxQa0xsMiQFAk95ZSPxn0GXr91S+Irj
         xwZDTz2R/ktqBExnTB1qryOICMOHGyUt81jv7bNAsQxX2azKJloO4Rak1vP3AaDU7i4m
         OyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FNqcBw7gbdcsYAj3BqhT8zH10stbn01zoIqVBzt1ndI=;
        b=SBMMBBa1OKdGYvwRWadiEPx40GloMmjD83YYQduCio1EJZmtI8wBAvrWVW2tqK36ov
         hT0BiCJf2LDqBPxytjHzVZnRhz6QkTFdSH71asSrp6wyfvdaTORJKodJfEQTdF6bv6/F
         dbubRM86QrbPyd5+lm1JthJ2GFdeEAd5O3GeKD8DIgnXOeKF4glG3/eRC+eOV0ppPKmI
         yLJD8BTyDOg14a5+ei9GBILRAZGMqbBj5hktq5knKpHxsPk07QGjgd3GvAkXTwfPJzTO
         taF+hKn+Z0OPvKKauseBR2yfP+NQkTF0dg0IW8ERdBANZklJI0OTdbdvLDD1Pq0NWpGj
         fX6A==
X-Gm-Message-State: AOAM530W/NCdQvAGf0w5pB7i9hXEpqsybMiaBfmJfnLui6Hx/9lLu7bc
        wOWTw7ShLESpBtd6W6AAEmRSs0xu
X-Google-Smtp-Source: ABdhPJxwDwLDDqIGo1x+XgU/Gsphj/4xYfmbRbh1sLk+5KU7qOFlfnLdw9q6QsJUuM2roZoidr6Nmg==
X-Received: by 2002:a05:6402:30a5:: with SMTP id df5mr4700529edb.18.1596729771005;
        Thu, 06 Aug 2020 09:02:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z5sm4005075ejm.111.2020.08.06.09.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 09:02:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] usb: common: usb-conn-gpio: Make VBUS supply optional
Date:   Thu,  6 Aug 2020 18:02:47 +0200
Message-Id: <20200806160248.3936771-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If the connector is the child of a USB port and that USB port already
has a VBUS supply attached to it, it would be redundant to require the
connector to have a VBUS supply. In this case, allow the VBUS supply to
be optional.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/common/usb-conn-gpio.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index 7b3a21360d7c..c5b516d327c7 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -91,14 +91,14 @@ static void usb_conn_detect_cable(struct work_struct *work)
 		return;
 	}
 
-	if (info->last_role == USB_ROLE_HOST)
+	if (info->last_role == USB_ROLE_HOST && info->vbus)
 		regulator_disable(info->vbus);
 
 	ret = usb_role_switch_set_role(info->role_sw, role);
 	if (ret)
 		dev_err(info->dev, "failed to set role: %d\n", ret);
 
-	if (role == USB_ROLE_HOST) {
+	if (role == USB_ROLE_HOST && info->vbus) {
 		ret = regulator_enable(info->vbus);
 		if (ret)
 			dev_err(info->dev, "enable vbus regulator failed\n");
@@ -106,8 +106,9 @@ static void usb_conn_detect_cable(struct work_struct *work)
 
 	info->last_role = role;
 
-	dev_dbg(info->dev, "vbus regulator is %s\n",
-		regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
+	if (info->vbus)
+		dev_dbg(info->dev, "vbus regulator is %s\n",
+			regulator_is_enabled(info->vbus) ? "enabled" : "disabled");
 
 	power_supply_changed(info->charger);
 }
@@ -156,6 +157,7 @@ static int usb_conn_probe(struct platform_device *pdev)
 	struct power_supply_config cfg = {
 		.of_node = dev->of_node,
 	};
+	bool need_vbus = true;
 	int ret = 0;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
@@ -185,7 +187,23 @@ static int usb_conn_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&info->dw_det, usb_conn_detect_cable);
 
-	info->vbus = devm_regulator_get(dev, "vbus");
+	/*
+	 * If the USB connector is a child of a USB port and that port already provides the VBUS
+	 * supply, there's no need for the USB connector to provide it again.
+	 */
+	if (dev->parent && dev->parent->of_node) {
+		if (of_find_property(dev->parent->of_node, "vbus-supply", NULL))
+			need_vbus = false;
+	}
+
+	if (!need_vbus) {
+		info->vbus = devm_regulator_get_optional(dev, "vbus");
+		if (PTR_ERR(info->vbus) == -ENODEV)
+			info->vbus = NULL;
+	} else {
+		info->vbus = devm_regulator_get(dev, "vbus");
+	}
+
 	if (IS_ERR(info->vbus)) {
 		if (PTR_ERR(info->vbus) != -EPROBE_DEFER)
 			dev_err(dev, "failed to get vbus\n");
@@ -266,7 +284,7 @@ static int usb_conn_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&info->dw_det);
 
-	if (info->last_role == USB_ROLE_HOST)
+	if (info->last_role == USB_ROLE_HOST && info->vbus)
 		regulator_disable(info->vbus);
 
 	usb_role_switch_put(info->role_sw);
-- 
2.27.0

