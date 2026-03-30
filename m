Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C303D1716
	for <linux-tegra@vger.kernel.org>; Mon, 30 Mar 2026 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875139; cv=none; b=BlNz3QyxdKyzYdaPMRFNJBeC2fQ9aKD9ULPJ7+QvhU4Dc4+sW1bwD7+74PiAqZ0oB3Gr6ArUb3PpHiO79HqYB1VP9BHW13Lt1zqbc11WrGmmoUHkR+wB19zKABJth0JUOZItYTD62iz65BVklTzGhOuE8rJYx8Rz3pHjeHhVQQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875139; c=relaxed/simple;
	bh=X0XeqVk1okPDExPdxveHKfJoDl26uOIaeLMRZyIoG0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hA2CddFRCTDz6ARhiRa0C9qs+uMxh90842FhKng+MQpDIu8rlIAsBp8UVvIHz48nVrcvZrxJst6oyjgX8NOe44o0Nut/RRIi7wNPkTKDiH9hdME/42R7ZkpWPtK0YYEnTkElDb+Rt9Fvpwn8FlCGa5uPniTaZ0Us4HVf/2UDcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ20CY/V; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ20CY/V"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-60328e74517so1327196137.1
        for <linux-tegra@vger.kernel.org>; Mon, 30 Mar 2026 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774875137; x=1775479937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2T5sC1X4d4lvAdzHYW3GejS6hGTQduK0sRiN708dk4s=;
        b=QJ20CY/VupWwefOFzUflZGWD7YDVGN0rsW0a6JkR5HOAnCeXOqlbx7Ia7qZ42J5OiY
         z7FaZ/ZiDUAM53+CIjxKEprQlT0U9VocUzppHlBHyE7D9k9YcuuZuIixL2DKow9uzt7n
         rrG6lHOq7osTr3ITC4ORahVEVInVkn4+INIih0Sk/z0juCRmpU1Hjd5dE/IpR9hcFNDr
         fDaPVsCCqkyPLpLaR9320C0BATVMLpVCLfKONUANa8oWNz65GOp6/f8cjCCZhRlxKnAn
         f2bMgmA139VLFAeU5WqpiVJSltC1VKcM3n7WMxi8jdySXOOG5E+BA34XUEIjrnkAkrOO
         lZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875137; x=1775479937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T5sC1X4d4lvAdzHYW3GejS6hGTQduK0sRiN708dk4s=;
        b=g7uh6syAmv09fC2FQVLGpGRw6BdNK0HaqRw221x+Rztg0Wk0tgrC4lEBJkyhOEgXsL
         0wGXXm03lfblOZ/tbGsNTLudpWOfVU5uX2NIZ1swUiptLiXYA9kcExNhjsteGNi6cgtW
         mijj6pP1rM82oSQrUtOPKhECJJMPrTAQhcOKeVFej0iNQOE1MAoGqNCHtjm0Z6WmGMMR
         U6y+GXbmsw8WEA1HD4+XH7QGc38AoCU5i7rSzOxm9xOCGrWX7TFRZ94wsW37mSihT7W6
         yS/XCW8nCo7mEwEk+Mjbb9co8hQ5oLaPNDHAl1gIDdpGu2YP3Xuk6pclHb2B53RNf80t
         SVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG3N7XAJbcst4OgieVHIYGao5dbmGDuKbmednfGETR0ZftWizUmgebpN2blmW8e7HOo2Vrbqs44bjB2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YycueSdcmLrKZEnzitFpmmf9QkbKQqHg0qeNrhNG/e8PRMK+jYh
	n9cwSASji5RHfHfDzjvUT2h4Qg2R7W/cOLkGdEKhy7kKO8n3loiPW87N1KISOS6tP58=
X-Gm-Gg: ATEYQzxp/yrBfxOvubUpiYmGIRRp5K7aRtrfdH7RzH5qo36x6zUjnAUNK1GeROZ72px
	VUArH+jM5XDC5mq+BujNAToxazIjufZimacIQbiZr0F830K52giLECNzfdrGiewoOpiQ+H/qpho
	+JZnhGalp8H+9IwrVjOQgU2rVCSh2hjPI2sgUCB/JtYa0WGBGghDSS+STZESWdEE34dw65HwCX+
	wuSvsSNzAYKB8eNmN24mYGghPsDDjjyq4lILApzYyaBgxxNqBKiCcR4+fj/MKd2BoPVQCIn78GU
	EtVwL6f6pi27P4GK9IokFV7o2/1D04wJ4tC5vuNRCctWKveHI81rw/w80043d/0MAaDRbDrBZ92
	9/jg58pQuISrIPVgvwob7WhCPEmdyr1wiQyCPfGByDjGRtUj6FAaUd9icjSDkxxPZ6jSCTQLQgW
	vVExLSKIDp6/8qMBSg1bcSBPhK
X-Received: by 2002:a05:6102:26d5:b0:602:87b9:89ba with SMTP id ada2fe7eead31-604f925ae38mr3523377137.19.1774875136516;
        Mon, 30 Mar 2026 05:52:16 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6da:aa::11:1d6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e4420d9sm6888389241.8.2026.03.30.05.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:52:15 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org
Cc: marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] staging: nvec: validate battery response length before memcpy
Date: Mon, 30 Mar 2026 06:52:00 -0600
Message-ID: <20260330125200.820693-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

In nvec_power_notifier(), the response length from the embedded
controller is used directly as the size argument to memcpy() when
copying battery manufacturer, model, and type strings. The
destination buffers (bat_manu, bat_model, bat_type) are fixed at
30 bytes, but res->length is a u8 that can be up to 255, allowing
a heap buffer overflow.

Additionally, if res->length is less than 2, the subtraction
res->length - 2 wraps around as an unsigned value, resulting in a
large copy that corrupts kernel heap memory.

Introduce NVEC_BAT_STRING_SIZE to replace the hardcoded buffer
size, store res->length - 2 in a local copy_len variable for
clarity, and add bounds checks before each memcpy to ensure the
copy length does not exceed the destination buffer and that
res->length is at least 2 to prevent unsigned integer underflow.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603301722.axpoITcy-lkp@intel.com/
Tested-by: Marc Dietrich <marvin24@gmx.de>
Cc: stable@vger.kernel.org
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
v3:
  - Fix build error: add missing closing brace for TYPE case
    compound statement (kernel test robot)
v2:
  - Introduce NVEC_BAT_STRING_SIZE constant (Marc Dietrich)
  - Store res->length - 2 in local copy_len variable (Marc Dietrich)
  - Use NVEC_BAT_STRING_SIZE in strncmp call for consistency
 drivers/staging/nvec/nvec_power.c | 42 +++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..30719e142 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -19,6 +19,7 @@
 #include "nvec.h"
 
 #define GET_SYSTEM_STATUS 0x00
+#define NVEC_BAT_STRING_SIZE 30
 
 struct nvec_power {
 	struct notifier_block notifier;
@@ -38,9 +39,9 @@ struct nvec_power {
 	int bat_temperature;
 	int bat_cap;
 	int bat_type_enum;
-	char bat_manu[30];
-	char bat_model[30];
-	char bat_type[30];
+	char bat_manu[NVEC_BAT_STRING_SIZE];
+	char bat_model[NVEC_BAT_STRING_SIZE];
+	char bat_type[NVEC_BAT_STRING_SIZE];
 };
 
 enum {
@@ -192,26 +193,41 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 	case TEMPERATURE:
 		power->bat_temperature = res->plu - 2732;
 		break;
-	case MANUFACTURER:
-		memcpy(power->bat_manu, &res->plc, res->length - 2);
-		power->bat_manu[res->length - 2] = '\0';
+	case MANUFACTURER: {
+		size_t copy_len = res->length - 2;
+
+		if (res->length < 2 || copy_len > NVEC_BAT_STRING_SIZE - 1)
+			break;
+		memcpy(power->bat_manu, &res->plc, copy_len);
+		power->bat_manu[copy_len] = '\0';
 		break;
-	case MODEL:
-		memcpy(power->bat_model, &res->plc, res->length - 2);
-		power->bat_model[res->length - 2] = '\0';
+	}
+	case MODEL: {
+		size_t copy_len = res->length - 2;
+
+		if (res->length < 2 || copy_len > NVEC_BAT_STRING_SIZE - 1)
+			break;
+		memcpy(power->bat_model, &res->plc, copy_len);
+		power->bat_model[copy_len] = '\0';
 		break;
-	case TYPE:
-		memcpy(power->bat_type, &res->plc, res->length - 2);
-		power->bat_type[res->length - 2] = '\0';
+	}
+	case TYPE: {
+		size_t copy_len = res->length - 2;
+
+		if (res->length < 2 || copy_len > NVEC_BAT_STRING_SIZE - 1)
+			break;
+		memcpy(power->bat_type, &res->plc, copy_len);
+		power->bat_type[copy_len] = '\0';
 		/*
 		 * This differs a little from the spec fill in more if you find
 		 * some.
 		 */
-		if (!strncmp(power->bat_type, "Li", 30))
+		if (!strncmp(power->bat_type, "Li", NVEC_BAT_STRING_SIZE))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
 		break;
+	}
 	default:
 		return NOTIFY_STOP;
 	}
-- 
2.43.0

