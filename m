Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5703822A6
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710749; cv=none; b=RMgG22u9DSXDq2TBzWqwEp9CATO9nNTxxjSx1A4IfWm+Iyts8mlcnpjL+x1PotvgIJV3/T4Ii1R4JdvQoflPlIZDi07PBiQLdk9UHNTfPLTri7yBY2z+lvkfE3uU7lMiFnsaH928oe9yANyT1sHXs6LREVJkCVCDyyCr6uVk9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710749; c=relaxed/simple;
	bh=hN1BELHe0HzMVXZth/JdE+10ehzOn9zzJk1tjshEl80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pj49zN6kmudrkfyZ6GnYlGGXML+dbdjDUP7kEcLDAeyav6EYelMXrAzLaWpIa/kw/m1HD1CQ1LQ5Ni9AeKfULmZcSSbK32KRTs60Rs+cJCQ3ky2eEp2cj1ndP8001cgQHNMjwv9yPYoAbK4sYx3rxNEp3p4jCCfOVZoe0/yJRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1LtNuqk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1LtNuqk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c86945164so11161281fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783710746; x=1784315546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJQcbXWAh+kWYkQGfCOXff9Cmt1+z/g0OGZkizOIHnU=;
        b=J1LtNuqk6n8d5azrYoyjWTuWkZre6pMJYRBtmR8XgKtXx3qxqHLsbjCTPpM2zWt7pL
         Uow2mHww4Qvv9s+aABPfkgkgq8oMDlMWspNBrt0XLLUIF2X4Z79YKird1vGjqGcDTAc+
         ufC/AY+HB98Ut5Z9ROm5U/7+XAeBaFjb1CeSz6we/bwS80MWfySJhB+KPVSmcS8Lh/lR
         4x9Ap4+Lwndl+hPU0He0VxLzIPu744GwqaSAhd1tXY5xIFrb2rRwI2MANaspwam27ZMG
         Yv5bS0p2NfoX59qBsEwYQbmFlFfnQSljjzNwE/q+5wYTAi3HkmbWCQ0tvanCZTmmsyvz
         WRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710746; x=1784315546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJQcbXWAh+kWYkQGfCOXff9Cmt1+z/g0OGZkizOIHnU=;
        b=dnXv7TGWPa7Du2b1jHWO3MdBxlbnxH5Ri5kuTLAWYSBym14obs8jSS2IusgaaW4KOB
         qjWQlwzw2mVgZjTX4r1bpS8gAk3aRRR5B86QEw7hki7APN7bGjLQY9PU2RJHTBQvw50E
         0yLg7xTMTyAjjVibPpLa8XZHcz8FL+8fmcIUOnrGysuVsGnrTG7b4CBOKqe29Uc9ZEQo
         jt7cxzv10wPoxJpHHk8a6+jcATnL4h6johkcIQCcrmnFQ8yz1Obq/xg1iOHdHr2nLWwd
         gc2CGoob9i/K8FNgNEIdMTK9IMHef53cFAJItpApIprxZiROafyd34Z0g8/ivOAvCS2n
         Udrw==
X-Forwarded-Encrypted: i=1; AHgh+RpbdB9WvSwPxsO8Tp0jVatMWA7r8PWBtg52+Ns3ZLUHTHelMmmA0RfoOEUOL5LehcMyBjv4ypZrzXfRYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6M+odSh9BWLt8Cy3vUKxAyCpTG4oxdBU9hL/qFBKwcE+/NgE
	UDg+H7AGFN8L8UYmOH7xXDQu1ukvf3frwSYaTtiuqXUlXASut4uI5x6I
X-Gm-Gg: AfdE7ckXc1S889SBu5t1RcfsPs+OyisX+grusLMUWUVJDfumP7b9AlghSUu5uhmXLf+
	8qBeZ/6529QI+h4nXL0EGKY/l4SoDJD7MksbvmTxLT1xT4j5tMbV7AAUyej6OCixWwQEfQ/mvj3
	wKYzUy/Bmqw0pFgrVkB8ZPmBLMKzjEZbU5fXZfnJiOSXr88IsCGfGcNikT4rJ6MrighKcG4F9rB
	tI7c1XFPT1wXvaTKCgECEuApqVaHkoR3WurYUkzobOACXbWdkH3k76qcwhxAhIlzdRCnh4qaQKO
	CBTyv4KWRt1dRyl6MSlQYycJgDQwi5V/K8ZIYsrVdfFv8hC1njU65BcStyutVlsP3t+hsYQug7/
	T9Icvdh/LuhG0OguVxP1PiKHApwxxxKvOQc0FG+zxGsCPIEpEGf+6KHV0s6H0ycGA1C+zMZFNqW
	jDAxNFU42RmD2uVfX/aOX7RFfLIaBSc4+mXRlUTyDGdTZ1BYizKtckILakwfeELk0N5nL89aYxS
	zpQzWQ=
X-Received: by 2002:ac2:51d1:0:b0:5b0:bc3:dc05 with SMTP id 2adb3069b0e04-5b02369c7cdmr76618e87.40.1783710745968;
        Fri, 10 Jul 2026 12:12:25 -0700 (PDT)
Received: from debian.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm807683e87.48.2026.07.10.12.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:12:25 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	ac100@lists.launchpad.net,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: nvec: kbd: replace global state with dynamic allocation
Date: Fri, 10 Jul 2026 22:12:21 +0300
Message-ID: <20260710191221.2820-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the global static 'keys_dev' struct to allow multiple device
instances. Allocate 'nvec_keys' dynamically per-device using
devm_kzalloc() during probe, and fetch the context using
input_get_drvdata() and container_of().

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 40 ++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f..4b61aebca 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -35,19 +35,17 @@ struct nvec_keys {
 	bool caps_lock;
 };
 
-static struct nvec_keys keys_dev;
-
-static void nvec_kbd_toggle_led(void)
+static void nvec_kbd_toggle_led(struct nvec_keys *keys)
 {
 	char buf[] = { NVEC_KBD, SET_LEDS, 0 };
 
-	keys_dev.caps_lock = !keys_dev.caps_lock;
+	keys->caps_lock = !keys->caps_lock;
 
-	if (keys_dev.caps_lock)
+	if (keys->caps_lock)
 		/* should be BIT(0) only, firmware bug? */
 		buf[2] = BIT(0) | BIT(1) | BIT(2);
 
-	nvec_write_async(keys_dev.nvec, buf, sizeof(buf));
+	nvec_write_async(keys->nvec, buf, sizeof(buf));
 }
 
 static int nvec_keys_notifier(struct notifier_block *nb,
@@ -55,6 +53,7 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 {
 	int code, state;
 	unsigned char *msg = data;
+	struct nvec_keys *keys = container_of(nb, struct nvec_keys, notifier);
 
 	if (event_type == NVEC_KB_EVT) {
 		int _size = (msg[0] & (3 << 5)) >> 5;
@@ -70,11 +69,11 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 		state = msg[1] & 0x80;
 
 		if (code_tabs[_size][code] == KEY_CAPSLOCK && state)
-			nvec_kbd_toggle_led();
+			nvec_kbd_toggle_led(keys);
 
-		input_report_key(keys_dev.input, code_tabs[_size][code],
+		input_report_key(keys->input, code_tabs[_size][code],
 				 !state);
-		input_sync(keys_dev.input);
+		input_sync(keys->input);
 
 		return NOTIFY_STOP;
 	}
@@ -85,7 +84,7 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
 			  unsigned int code, int value)
 {
-	struct nvec_chip *nvec = keys_dev.nvec;
+	struct nvec_keys *keys = input_get_drvdata(dev);
 	char buf[] = { NVEC_KBD, SET_LEDS, 0 };
 
 	if (type == EV_REP)
@@ -98,7 +97,7 @@ static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
 		return -1;
 
 	buf[2] = !!value;
-	nvec_write_async(nvec, buf, sizeof(buf));
+	nvec_write_async(keys->nvec, buf, sizeof(buf));
 
 	return 0;
 }
@@ -107,6 +106,7 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	int i, j, err;
+	struct nvec_keys *keys;
 	struct input_dev *idev;
 	char	clear_leds[] = { NVEC_KBD, SET_LEDS, 0 },
 		enable_kbd[] = { NVEC_KBD, ENABLE_KBD },
@@ -115,6 +115,9 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 						true };
 
 	j = 0;
+	keys = devm_kzalloc(&pdev->dev, sizeof(struct nvec_keys), GFP_KERNEL);
+	if (!keys)
+		return -ENOMEM;
 
 	for (i = 0; i < ARRAY_SIZE(code_tab_102us); ++i)
 		keycodes[j++] = code_tab_102us[i];
@@ -138,14 +141,18 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 		set_bit(keycodes[i], idev->keybit);
 
 	clear_bit(0, idev->keybit);
+
+	input_set_drvdata(idev, keys);
+	platform_set_drvdata(pdev, keys);
+
 	err = input_register_device(idev);
 	if (err)
 		return err;
 
-	keys_dev.input = idev;
-	keys_dev.notifier.notifier_call = nvec_keys_notifier;
-	keys_dev.nvec = nvec;
-	nvec_register_notifier(nvec, &keys_dev.notifier, 0);
+	keys->input = idev;
+	keys->notifier.notifier_call = nvec_keys_notifier;
+	keys->nvec = nvec;
+	nvec_register_notifier(nvec, &keys->notifier, 0);
 
 	/* Enable keyboard */
 	nvec_write_sync(nvec, enable_kbd, 2, NULL);
@@ -165,12 +172,13 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 static void nvec_kbd_remove(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
+	struct nvec_keys *keys = platform_get_drvdata(pdev);
 	char disable_kbd[] = { NVEC_KBD, DISABLE_KBD },
 	     uncnfg_wake_key_reporting[] = { NVEC_KBD, CNFG_WAKE_KEY_REPORTING,
 						false };
 	nvec_write_async(nvec, uncnfg_wake_key_reporting, 3);
 	nvec_write_async(nvec, disable_kbd, 2);
-	nvec_unregister_notifier(nvec, &keys_dev.notifier);
+	nvec_unregister_notifier(nvec, &keys->notifier);
 }
 
 static struct platform_driver nvec_kbd_driver = {
-- 
2.47.3

