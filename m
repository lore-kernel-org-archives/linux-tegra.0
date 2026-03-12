Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872023B6BF8
	for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349930; cv=none; b=a2gmigGolQtKElxeLWvn6DrwT0vaO88/NLngXYfIyBTXYtcLNB24NIyic+I+BTI/8kjjG2/AV7pzok5Rom35wt3xln+eVm5UB9Hx6VBlpCzX2+4hH4O14PJfjLwuYBzl1bPQMIJys6SufkRdkBYpoej2yZ1IYWKwlBMmFGeSgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349930; c=relaxed/simple;
	bh=5b/6GD002MR+eoOsPs5DQxi2rxO2VnEEpDkYvEKDilU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCE75itbj8R/KPmSXMz7SEDJdqwFLI9YMn633FvLRbKRo1e6cNd+TbUQ0JEPeitw8HBwNswGiAS4QcD2ozLjQKetHcIBcwRKxNWxMTO7gZ1vCRONV7P8NgPhjjC5qZCT8sICNx2dhmnaKGa65TdeeDR41sHtB4jaC1MHy7x0/78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPrrvnmQ; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPrrvnmQ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12732e6a123so876836c88.1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349922; x=1773954722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCcxD94e+pZHMn3iBx4K7NeqBTodfkJrHpwmp+Hbtls=;
        b=PPrrvnmQInsGMwIMhPGCi/vzW5n3///I9W2e0uP8ki1JNxHO7s2eTy4p7wFNewRa3G
         w9C5AjGTLiOMIBkc8tvkhekVjecAheRX+Z996yj6ChFpDO+1Tb3jzVtv61d7MCwZiiwt
         o4PW+7VPLoQHha7bPq/14ovjS171nRo8tY0rK+ORDP+ZaXfm+VAuufEqfci9zfnz2WFl
         kKbuQEEX376KJvPUldgx6B1vdX7xJ2H3E/K6cHjlTv5yBN9KxtkQZ50BCGMvxnxxtPF1
         7/EhumOsG9c+1TECR+a2Vwkf9vSsg4EhBxkCfoYJYOQ6GAkS/hiaK1knFTFt1DeP/Kne
         AXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773349922; x=1773954722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QCcxD94e+pZHMn3iBx4K7NeqBTodfkJrHpwmp+Hbtls=;
        b=Pki6vniTfD1G54koK57NEuwxU2BeXjAtcJcXp5iTp+docWhOSuerRDIiZJvobMSDOK
         krjdGXk1c1eDX3IC05bWAQZMWuMkY+pjLCtzWLdSuCsJLjK2QYawPKZS1+RmDfcYQ0cZ
         sdfHM4ZJOcq4uOZWoKrCpFNZfPhNi3Nziqnx+jF9y3Ht3DmZnOAfgfm7qPn0/tsA0ilT
         MgGSjusX+/K6mi5TgWf9x1Q2N33RQ+jkXhPf0wlzbtCIMhpAfiRWfhroEgSvxmhnRO4T
         W/CrlQXwAyy/093hLPw3pFkItGtvm5ZiVxo8bLUcKaCnA7ILBMuIrnq4WjD47wN3Aa8q
         VPpg==
X-Forwarded-Encrypted: i=1; AJvYcCXehll3E1VabXCEcpjDUGrYvztTvX7GsztM5l2bicjUn0SyUCYRMQSS6GF2qeKDOem9NneubMy08IMLXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Is+U17z3A5RiZ82HV95B4o4uvD2pRmUTqyr0zyK5aJ8fPMZA
	4jSfnjNPKSN95/4trnJYSa+5asDwM+Adtbha5RvsRXZhPKVOC27IhLbirD08gDAW
X-Gm-Gg: ATEYQzwt0rjc46Ai+HpXfaSgwj2LrQ7yHQVspZdQW3Wr9P+mjOMqL2BZHCTBRlaBHiD
	Ir5ftbmJierhamHP5diO7F+P8dpo2rO2uwBJN/NkK9XrfDN25f3usajiiELiAlwa4hjWzOiutdh
	e1t3maSIdZMJlT/quR/rekfxq9i4l1ZR40FACew5HSDyIS0OXbDg7do5TkO57uU35nqi38TJ5tP
	U3V05g98kktcbKA38I6Wk6YrBJmYiMDsoJy+YMUTApIsvkFKvCi8YY5qMMbWAM4sxSvy1xFLMBp
	LJMdibsxEkv8em0FnPOW/xa3tbiwOPTQm6pGvzo0GIjZviIoCPwE4sQx18Bh9ZLEctftZnz4vKh
	L1g43hBtfLV918PJzUifEXp+V4LOnDcEVijNQwrDwpkSnxRqIEtC5KO/Fqs2Zmc8jsoJjqGPcSa
	xBx6o0696i5ZXS4q+uwrzqGo35Hb51ZvpyuMq76VCxg8I=
X-Received: by 2002:a05:7300:2389:b0:2be:617:2dec with SMTP id 5a478bee46e88-2bea54973f3mr548232eec.17.1773349922061;
        Thu, 12 Mar 2026 14:12:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a83514asm8422272eec.4.2026.03.12.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:12:01 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dev.gustavoa@gmail.com
Subject: [PATCH 1/2] staging: nvec_power: make EC queries synchronous
Date: Thu, 12 Mar 2026 18:11:50 -0300
Message-ID: <20260312211151.85379-2-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312211151.85379-1-dev.gustavoa@gmail.com>
References: <20260312211151.85379-1-dev.gustavoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nvec power driver still submits its periodic AC and battery
queries, as well as the battery metadata requests, asynchronously.
That leaves it with several independent request sources and makes it
hard to quiesce the driver cleanly before system sleep.

Add a small core helper to feed a synchronous reply back through the
normal NVEC message parser, then switch nvec_power over to synchronous
queries. Move the battery metadata requests out of the notifier
callback into a worker so they can use the same synchronous path.

This keeps the existing notifier-based state updates intact while
serializing the driver's EC traffic.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/nvec/nvec.c       |  7 ++--
 drivers/staging/nvec/nvec.h       |  2 +
 drivers/staging/nvec/nvec_power.c | 70 ++++++++++++++++++++++++-------
 3 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 952c5a849a56..cb1d92769941 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -408,14 +408,14 @@ static void nvec_request_master(struct work_struct *work)
 }
 
 /**
- * parse_msg - Print some information and call the notifiers on an RX message
+ * nvec_msg_parse - Print some information and call the notifiers on an RX message
  * @nvec: A &struct nvec_chip
  * @msg: A message received by @nvec
  *
  * Paarse some pieces of the message and then call the chain of notifiers
  * registered via nvec_register_notifier.
  */
-static int parse_msg(struct nvec_chip *nvec, struct nvec_msg *msg)
+int nvec_msg_parse(struct nvec_chip *nvec, struct nvec_msg *msg)
 {
 	if ((msg->data[0] & 1 << 7) == 0 && msg->data[3]) {
 		dev_err(nvec->dev, "ec responded %*ph\n", 4, msg->data);
@@ -432,6 +432,7 @@ static int parse_msg(struct nvec_chip *nvec, struct nvec_msg *msg)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(nvec_msg_parse);
 
 /**
  * nvec_dispatch - Process messages received from the EC
@@ -459,7 +460,7 @@ static void nvec_dispatch(struct work_struct *work)
 			nvec->last_sync_msg = msg;
 			complete(&nvec->sync_write);
 		} else {
-			parse_msg(nvec, msg);
+			nvec_msg_parse(nvec, msg);
 			nvec_msg_free(nvec, msg);
 		}
 		spin_lock_irqsave(&nvec->rx_lock, flags);
diff --git a/drivers/staging/nvec/nvec.h b/drivers/staging/nvec/nvec.h
index 80c0353f141c..d6854c9d629d 100644
--- a/drivers/staging/nvec/nvec.h
+++ b/drivers/staging/nvec/nvec.h
@@ -168,6 +168,8 @@ int nvec_write_sync(struct nvec_chip *nvec,
 		    const unsigned char *data, short size,
 		    struct nvec_msg **msg);
 
+int nvec_msg_parse(struct nvec_chip *nvec, struct nvec_msg *msg);
+
 int nvec_register_notifier(struct nvec_chip *nvec,
 			   struct notifier_block *nb,
 			   unsigned int events);
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fdedef..6b3235f41d07 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -23,6 +23,7 @@
 struct nvec_power {
 	struct notifier_block notifier;
 	struct delayed_work poller;
+	struct work_struct bat_init;
 	struct nvec_chip *nvec;
 	int on;
 	int bat_present;
@@ -106,14 +107,38 @@ static const int bat_init[] = {
 	MANUFACTURER, MODEL, TYPE,
 };
 
-static void get_bat_mfg_data(struct nvec_power *power)
+static int nvec_power_write_sync(struct nvec_power *power,
+				 unsigned char *buf, short size)
 {
+	struct nvec_msg *msg;
+	int ret;
+
+	ret = nvec_write_sync(power->nvec, buf, size, &msg);
+	if (ret < 0)
+		return ret;
+
+	nvec_msg_parse(power->nvec, msg);
+	nvec_msg_free(power->nvec, msg);
+
+	return 0;
+}
+
+static void nvec_power_bat_init(struct work_struct *work)
+{
+	struct nvec_power *power = container_of(work, struct nvec_power,
+						 bat_init);
+	unsigned char buf[] = { NVEC_BAT, 0 };
 	int i;
-	char buf[] = { NVEC_BAT, SLOT_STATUS };
+	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(bat_init); i++) {
 		buf[1] = bat_init[i];
-		nvec_write_async(power->nvec, buf, 2);
+
+		ret = nvec_power_write_sync(power, buf, sizeof(buf));
+		if (ret < 0)
+			dev_warn(power->nvec->dev,
+				 "failed to query battery data %u: %d\n",
+				 bat_init[i], ret);
 	}
 }
 
@@ -133,7 +158,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		if (res->plc[0] & 1) {
 			if (power->bat_present == 0) {
 				status_changed = 1;
-				get_bat_mfg_data(power);
+				schedule_work(&power->bat_init);
 			}
 
 			power->bat_present = 1;
@@ -347,15 +372,19 @@ static const int bat_iter[] = {
 
 static void nvec_power_poll(struct work_struct *work)
 {
-	char buf[] = { NVEC_SYS, GET_SYSTEM_STATUS };
+	unsigned char buf[] = { NVEC_SYS, GET_SYSTEM_STATUS };
 	struct nvec_power *power = container_of(work, struct nvec_power,
-						poller.work);
+							poller.work);
+	int ret;
 
 	if (counter >= ARRAY_SIZE(bat_iter))
 		counter = 0;
 
 	/* AC status via sys req */
-	nvec_write_async(power->nvec, buf, 2);
+	ret = nvec_power_write_sync(power, buf, sizeof(buf));
+	if (ret < 0)
+		dev_warn(power->nvec->dev,
+			 "failed to query AC status: %d\n", ret);
 	msleep(100);
 
 	/*
@@ -364,7 +393,10 @@ static void nvec_power_poll(struct work_struct *work)
 	 */
 	buf[0] = NVEC_BAT;
 	buf[1] = bat_iter[counter++];
-	nvec_write_async(power->nvec, buf, 2);
+	ret = nvec_power_write_sync(power, buf, sizeof(buf));
+	if (ret < 0)
+		dev_warn(power->nvec->dev,
+			 "failed to query battery status: %d\n", ret);
 
 	schedule_delayed_work(to_delayed_work(work), msecs_to_jiffies(5000));
 };
@@ -394,13 +426,13 @@ static int nvec_power_probe(struct platform_device *pdev)
 		power->notifier.notifier_call = nvec_power_notifier;
 
 		INIT_DELAYED_WORK(&power->poller, nvec_power_poll);
-		schedule_delayed_work(&power->poller, msecs_to_jiffies(5000));
 		break;
 	case BAT:
 		psy = &nvec_bat_psy;
 		psy_desc = &nvec_bat_psy_desc;
 
 		power->notifier.notifier_call = nvec_power_bat_notifier;
+		INIT_WORK(&power->bat_init, nvec_power_bat_init);
 		break;
 	default:
 		return -ENODEV;
@@ -408,25 +440,33 @@ static int nvec_power_probe(struct platform_device *pdev)
 
 	nvec_register_notifier(nvec, &power->notifier, NVEC_SYS);
 
-	if (pdev->id == BAT)
-		get_bat_mfg_data(power);
-
 	*psy = power_supply_register(&pdev->dev, psy_desc, &psy_cfg);
 
-	return PTR_ERR_OR_ZERO(*psy);
+	if (IS_ERR(*psy)) {
+		nvec_unregister_notifier(nvec, &power->notifier);
+		return PTR_ERR(*psy);
+	}
+
+	if (pdev->id == AC)
+		schedule_delayed_work(&power->poller, msecs_to_jiffies(5000));
+	else
+		schedule_work(&power->bat_init);
+
+	return 0;
 }
 
 static void nvec_power_remove(struct platform_device *pdev)
 {
 	struct nvec_power *power = platform_get_drvdata(pdev);
 
-	cancel_delayed_work_sync(&power->poller);
 	nvec_unregister_notifier(power->nvec, &power->notifier);
 	switch (pdev->id) {
 	case AC:
+		cancel_delayed_work_sync(&power->poller);
 		power_supply_unregister(nvec_psy);
 		break;
 	case BAT:
+		cancel_work_sync(&power->bat_init);
 		power_supply_unregister(nvec_bat_psy);
 	}
 }
@@ -435,7 +475,7 @@ static struct platform_driver nvec_power_driver = {
 	.probe = nvec_power_probe,
 	.remove = nvec_power_remove,
 	.driver = {
-		   .name = "nvec-power",
+		.name = "nvec-power",
 	}
 };
 
-- 
2.53.0

