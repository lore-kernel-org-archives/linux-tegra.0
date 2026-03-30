Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185D278779
	for <linux-tegra@vger.kernel.org>; Mon, 30 Mar 2026 06:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774851013; cv=none; b=hBxhsS4WXOdfc8jc12a0QoEw/8JySh99K5VRkc7+TLlAKhbqtvZcNuWWmPXth9/2M2DV3XqI0UIGD3Sd29BeC8NpFlKdWo/04gJlM03mLST74NhcsW5k/9ZYPa/SCz3q1Shh5P7xZ+NQpsMhN3J6mFChcawFXQhoGk79UZNH9Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774851013; c=relaxed/simple;
	bh=57DrXeQnUGc6iR/CXOWyyyVZBnQ5MkHIKUWHPpAsMcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DlmigKqIHa4wPSQpm5BB3Xb0DKNy04CEjOeTJJRg+9wYIJwAM9MbCmItrh2vEes1pji7W/WaDAaQJi6936IM0nRBLA2yZu2SiIIqsnZoMp3nHbqQuXSmgWQytZx6Q3GCoTCa81hyICfvZRReiitpdF6n3jIiCMounfw6hhzMIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs4qHoHG; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs4qHoHG"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6052f9376bfso159220137.2
        for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 23:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774851011; x=1775455811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVkfdJP2KulZKEM0URtofZekmehI6WAdAhgF+udGJlg=;
        b=bs4qHoHGkb7YdhSUMkLyR+fYZeSFTOyp4dW7olvEW9+8evk+HFAWsU6JLCVPjeHJoA
         Q5xxHR6Nz9RorRUQMREo0aDKfEZEShpTdNU6CUuoykOV1qfNAbVaJzhyNsMFJe+Dilb/
         1x9I4XwVTRhciWZtTCWv6ovp4wrwjlQYDyKOL8fXOAiC7rFjHI4Dj2+YP+Pq4QBFv+nl
         D8vYMgZX4imi+/6XhRZJXow5hBRVb4QQVn7anFYyRnGH2SeSdlIkleFONdXOGkHxkuw9
         feA16jCUxVLnmhRC5bgWpjz0Jq1fnHjbqlhAUeRVrPjGJkVckorUgpxK7bkpB9jgimsU
         JVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851011; x=1775455811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVkfdJP2KulZKEM0URtofZekmehI6WAdAhgF+udGJlg=;
        b=UmkzSfIcsZQKfqfqDDIji9shgEIFhqNLjyHIQsy9mwas2CBifBlFowVIWDvoTUXQOt
         Sj8W/YSGOkDgRUrDJ05OApNK+QCJrAiAX8Mcr+6565RNx2ZCroLh4IdfaHwyGNMYS5u+
         0EhVXGBdDS9lIs0ZJ9Hlu9qCV2CXt9MIA0zXgDgKFLb6JN4+z2vf5pxZ8c2YvSy9z/cC
         iLTw5YI28ALHIPzrd5bDznN4O0UFtve2tZfWbZqKSNlFfTKapY/1GDLM10dBQS4YEDR3
         9E4e+1S3kltADGx8OvueHrsqryvU4Cabzg3LyP5pp68boChoVCir3ABc7WimIrIuVHzH
         rHCA==
X-Forwarded-Encrypted: i=1; AJvYcCU7oieq3KIQ6aXeLujgteDUVcrywCAgjnVCDrRw9besnrtPBJuEZZKiETmB3w48bdJe5kUiTmzbvjW6lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQzOn5swRlYXkll7EMUd+oL8KerxU8MOsVjj1HsNQqZ9+NsxY
	qDz1cPXuA4aKxXBTxsXFnnyfaXxtnogJHCn3/fQM9hSiL5GIVwbOj+yW8ox4VWp+ZKE=
X-Gm-Gg: ATEYQzw+pf5bFYMuXsZqMyBk4MWIHYpE4gMvRTsR385NQuMFf7Zcjg8IuQOXHRLc0XM
	V9e8/Y6TmqylTbDVm30694BHxAevqBM68p0PmhxcDJPGNer4JRVq39sPOZd2UeST7APvBQVJrPz
	IMKspUGZ2cSU31DW4A+7LZLz9fD16X4daKAb0p/utp2X0C9uTxrj578c9T7BvZKy2K44NLwudf0
	uPHeyEPSui2Tu+gkaFxuwfxJMv5AwWXrdtqlCAqjrYU78g8H2LjN6+Ff7u0kXG/FtwDwkSNHxoH
	TPS2sOGsd9VrPxIkqBWtQmczrYeOIKMathSGeuH6oTjNVafYz2mjxYB8GMebpPbz4T54ES+YaLZ
	mm+1QDk+H+iyroDDdtuqj3ENQst+hLVeaNWJD2uRhD8v+Dx89HxYdFCvBcBA1tLgI8dnks9I+Qc
	wuHPX7wJQbGj8FbMR0AuCm4e9f
X-Received: by 2002:a05:6102:cd0:b0:603:2173:d75e with SMTP id ada2fe7eead31-604f8d8b751mr3805351137.0.1774851010812;
        Sun, 29 Mar 2026 23:10:10 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6d9:aa::11:1d6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm7133561137.9.2026.03.29.23.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 23:10:10 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org
Cc: marvin24@gmx.de,
	linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH v2] staging: nvec: validate battery response length before memcpy
Date: Mon, 30 Mar 2026 00:09:26 -0600
Message-ID: <20260330060926.751031-1-sebasjosue84@gmail.com>
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

Tested-by: Marc Dietrich <marvin24@gmx.de>
Cc: stable@vger.kernel.org
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
v2:
  - Introduce NVEC_BAT_STRING_SIZE constant to replace hardcoded
    buffer size (Marc Dietrich)
  - Store res->length - 2 in local copy_len variable for clarity
    (Marc Dietrich)
  - Use NVEC_BAT_STRING_SIZE in strncmp call for consistency
 drivers/staging/nvec/nvec_power.c | 41 +++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..7b7980127 100644
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
@@ -192,22 +193,36 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
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
-- 
2.43.0

