Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3103B7B83
	for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 21:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349932; cv=none; b=MYKaqlSTCOcOx0Djub74tnhiAIrntLt1ETLanDTdLimCnCOYjfM+S8FfSR+QU2IXvhc3GZyoOoYReIdfdAi8EMBXK1DtpvzIRcXUSkkbV3LAgMTOmNSs6xvaCdKFn+YgcluncOtr67lXO4/1HhW11tBugXr8ZO62tmEKEgav4vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349932; c=relaxed/simple;
	bh=XPa2fHPiFNHgLb9BQ1hCubAtkAhzSQ8PE4/mHmpaoDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZS1prmqjXhMkj3K9d2EH4b0/4Wi8hgEd3O0874rNvRnXotok98nQ9OmO8WxIOvFRD1tPd31Bg3/oyFRIbLzyIUwFjsnUY8B9GHNlgi+UlzXk5qXXAmVW+lIzKBthfVk+CdkQdFIkvAa13mURZOU7gZ26efg/M7BZ5fsApLJA8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8c0WHa5; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8c0WHa5"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so1149584eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349926; x=1773954726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4/g92r097+Q+bziB8D1wE9RZ6HdjWV3zyzwkFevGgw=;
        b=j8c0WHa5G6Ii+1KxSduxyP7yRN1EDurtOwdTfHY9dF3kHxH3J2kCwRWbepblTjQuMQ
         hevncHHNTIzicA47KiMCfT92f7OrkxQbvz3YMwD3adDBVecTYqsrewYsU30DI2Bs0N/N
         41XCWY2VPu0qgXuJSOO064rNkTGdN353Hnn3vjuORpSHNDflQ5kG64RzCrKpa58GIcNi
         NuFv1DMPOgCtqaER/Lo195hm6D00Hh83LQ7OBi1Elp+YbZWXuFGBpm0KYWLgHuRjeS8S
         wzNmHlQFlTRz1qLCjxQkCaP7H+AxGBVWVwHqcDWzpxXbw8i2wh5sv+p9l3J1ewA0cy+B
         +RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773349926; x=1773954726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4/g92r097+Q+bziB8D1wE9RZ6HdjWV3zyzwkFevGgw=;
        b=g88g2x4N4f4MWZsfSilmoHMys5q8kNDHZBArrYoadf+s8U2awNnn0/dffIsL6JaFfz
         hBaUpJT00qm6FbmCubQSHABvLRJtABrWwf26hqGxNSPzAttQ6ltyjGxJABcQr9asO7IP
         G85rHzvwFTiZnwuM0SB30RFufnYB4ZlUt7vQ9lfPeXPo9+xv13LdOqLdQt47ZBxPjpub
         lEnRg0vzAD6xQTYu9IqliEDRxiz0zYF/vH8XMqN7s03XOZjFsoCVBZ46Vjz2L+cQa9g8
         nXSsJrRVnGwMjz8lswfbwp4QBbKd34UvqODagN2+wycZoXxUoLeX3tka5vw06GY4Ql26
         z1EA==
X-Forwarded-Encrypted: i=1; AJvYcCV6J014fuv3j1hg22pnWaa/Y9YiCnLsYi3RwrY6jej2OdLsoV8yBvgXgGTZ0l4CPOGFH7I/J9dDhJTWYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+WKw+V2mkZiuY+F2pAH8JMH80MR7egqT7nFbZb1JQD2ZReHA
	5nEw94p2N8mqLqgOAREaeF0beNwm5UJ95VXrqa4ORibUagWUy4/5n1PPrmTK8g72
X-Gm-Gg: ATEYQzxeDZMwPpzVorErjDUyOZbYQtpYIsm7EB1gbMst+gX6GRjV+GFUoyz7lF5Mi2j
	uRksdXYV7PuPtQDkGyBgRnTkMPPBv4zay0432yjuT7p8Rwqya4GlYu14wDTeuh9ovjeWQrsVaI4
	q+And3QuMvv7jmp1o6mr0FHSBY0NXuc7XsiSyXtTBPSzc10xustJzMng0OIBomtAGyKN9FNUWN9
	5G3y1FlOI3EWR8fTqG21diRIdB0IScTmIuvZRblT0YFiB7uTGNHCAKL8ShDjE4hMRP/UL7ynzZR
	YvbXU4IhS74+OCsLXky6d0aaFsmxi8nVeTyoR6JtY7KEcHvXzZ9ThqviStIAdAJk6kmBrANXPlR
	8qVQFXMDZSNgcQ65zwDGziHo3kI8v9408SZqlDclysnaqOEQMTGJK4f9gKJ8Xzkk/EXRsUa9eTo
	9Ut1umDtHaYJJ05Reo8YgvPlIfM9ExaA57k0vtFXqDiEI=
X-Received: by 2002:a05:7300:4348:b0:2be:140c:bc4a with SMTP id 5a478bee46e88-2bea53d7473mr594194eec.3.1773349925598;
        Thu, 12 Mar 2026 14:12:05 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a83514asm8422272eec.4.2026.03.12.14.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:12:05 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dev.gustavoa@gmail.com
Subject: [PATCH 2/2] staging: nvec_power: stop EC queries during system suspend
Date: Thu, 12 Mar 2026 18:11:51 -0300
Message-ID: <20260312211151.85379-3-dev.gustavoa@gmail.com>
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

The nvec_power driver continues to schedule its polling and battery
metadata work across system sleep, even though the parent nvec core
suspends the controller.

Track when each nvec_power instance is suspended, stop scheduling new
work once suspend begins, cancel the pending work items, and restart
them on resume. This keeps the driver's EC traffic quiesced while
the parent controller is asleep.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 52 +++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 6b3235f41d07..54e5c5cdaf63 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -25,6 +25,7 @@ struct nvec_power {
 	struct delayed_work poller;
 	struct work_struct bat_init;
 	struct nvec_chip *nvec;
+	bool suspended;
 	int on;
 	int bat_present;
 	int bat_status;
@@ -158,7 +159,8 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		if (res->plc[0] & 1) {
 			if (power->bat_present == 0) {
 				status_changed = 1;
-				schedule_work(&power->bat_init);
+				if (!READ_ONCE(power->suspended))
+					schedule_work(&power->bat_init);
 			}
 
 			power->bat_present = 1;
@@ -398,7 +400,9 @@ static void nvec_power_poll(struct work_struct *work)
 		dev_warn(power->nvec->dev,
 			 "failed to query battery status: %d\n", ret);
 
-	schedule_delayed_work(to_delayed_work(work), msecs_to_jiffies(5000));
+	if (!READ_ONCE(power->suspended))
+		schedule_delayed_work(to_delayed_work(work),
+				      msecs_to_jiffies(5000));
 };
 
 static int nvec_power_probe(struct platform_device *pdev)
@@ -471,11 +475,55 @@ static void nvec_power_remove(struct platform_device *pdev)
 	}
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int nvec_power_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct nvec_power *power = dev_get_drvdata(dev);
+
+	WRITE_ONCE(power->suspended, true);
+
+	switch (pdev->id) {
+	case AC:
+		cancel_delayed_work_sync(&power->poller);
+		break;
+	case BAT:
+		cancel_work_sync(&power->bat_init);
+		break;
+	}
+
+	return 0;
+}
+
+static int nvec_power_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct nvec_power *power = dev_get_drvdata(dev);
+
+	WRITE_ONCE(power->suspended, false);
+
+	switch (pdev->id) {
+	case AC:
+		schedule_delayed_work(&power->poller, msecs_to_jiffies(5000));
+		break;
+	case BAT:
+		schedule_work(&power->bat_init);
+		break;
+	}
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(nvec_power_pm_ops, nvec_power_suspend,
+			 nvec_power_resume);
+
 static struct platform_driver nvec_power_driver = {
 	.probe = nvec_power_probe,
 	.remove = nvec_power_remove,
 	.driver = {
 		.name = "nvec-power",
+		.pm = &nvec_power_pm_ops,
 	}
 };
 
-- 
2.53.0

