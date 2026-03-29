Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574462BEFE5
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774818505; cv=none; b=rphr/pjDretwI3dhDKLkIdE3Yl0Bi75HkjTub4OxYG1sm0wc88b/2/qeBF4cGT1gqZUbSvY+cfpxejiy+T+lJFlfljRAFoz0AWgmsdrijCbcjWDRbzBr/Ke9nEcIPXsDzXgjamVkO1a2+AdN/jmAnBVcPILDGv//n7vU4Xu/++w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774818505; c=relaxed/simple;
	bh=57DrXeQnUGc6iR/CXOWyyyVZBnQ5MkHIKUWHPpAsMcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fZATnsQVnjAd1p6728uRIuKVvPtYffAvITvhYmXm+WCD+ySf6UbgntOSoZ1hmMfrfaCWNzTx2PLzrdSCeH1dbynQNR7Pz361NUk+5+GX0OF5HLaF4rkrZmXmTH+w+Z6nFb5n4ZApXZjIJ972GI0LtLndXDPY5jCzlt14FGLJbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYBXuNmh; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYBXuNmh"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b65ffbda3so3422708e0c.1
        for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774818502; x=1775423302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVkfdJP2KulZKEM0URtofZekmehI6WAdAhgF+udGJlg=;
        b=QYBXuNmhrEM4+ehc8nYYU3k872EhjxsEghzm5IGgtDH8NKV20q/+ZAkEn7XYXzbbQf
         cLPbR7dLcTa1jDRMl0TfNkUY2QhmayEQobOqI1w4gxGKwKZ9Jbv1pHfX8y8vmEJWtJpH
         omKX1lUorfbUd9PUfy95kWLGNBb72sjleNpcUs8AKGOwrIfqFLNhmQZ+IiijnKEPfib+
         wvq7tOpr+Yvh9W8uw3Kk6jiw1uFLSSNJPdGC3/E7eCi1pEzS8bMEP0KLfyTdSGK6m5MN
         QLOhQOV6Lu3zK6QQevbAL3jUHOo20y38HiceWSGWVMYkUrwy69ktmjC4ohTwbi8xYPh2
         9rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774818502; x=1775423302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVkfdJP2KulZKEM0URtofZekmehI6WAdAhgF+udGJlg=;
        b=KYJcVoChuRJEoUXqJaXSkRUVuw0nTfeRS6C9Nd8P7a9Nt7sUPConyTZCw7Vezi4Csx
         j2ZPzR1Y6OQiJCsfgyhkxVvYea8fHRY0++zmkCJGYAS9rUebBHzW0DYQyQ41mNKyeurg
         4HBB+tqbvyzHUxaPaXqMhiDc+tVMCHAFARF52Cm315+LV7/zc829BpR4Az7t7oZPVkD/
         RvVmw6GrCdFKxFC2bdO0iPe94V3GP47JVQSKVoJ1rVnifrqebWz9KLbET7/VYKFdfRS0
         YqbgTuG+4b4FIHEx+gcHUkM7i6ke0VnsoKDNm4mQwDiBu/neY5u10lNXpn7jeuXhiZjl
         8EFA==
X-Forwarded-Encrypted: i=1; AJvYcCXlBTxozTv0RHHRpLkBedt6DiP3fZVnG/eymTBvRo3dS9OWSRWOSD8vVL0z1A2ZHK9Zs/HYWuyuGgGTqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytGH0E0iwY4Z31L5pfR2yWMSc+Jv9jPvFSBAY4LUpphq9cIrJk
	gOnGO35SsSFX/g5u4noebCZTsLS4u74hSK8M77aw3F+nnfYtzYRMPlw8
X-Gm-Gg: ATEYQzw+/b7gp9VE2lBANQJfMYjY+h2emf3l3bwN3ZrRcJpYTdIlZgkrwEThmtQihhF
	teHU1FqEdLZxLpwd+eFAPnAL/WLYFVVUg5V5h+NlkeMiuwv/gkxa8452UocK1VkLhHmYHRUl+y6
	tFGm82/rSDisLPwaFfdpLUm3QDWI1KS08hQjYaNCaIAWj50QgDpd+rp82CCycq1P2whF3vu28Mz
	oaQe1cp5lFjPuzw+XsWkVWUOQB2artnrV+GoPDWK3UHO9AWTO1fcgsHzfyoadQam2F2o0/vUSzi
	+rkq/xvaSOwdOz5OQwncr2sCIogI+vA+Lt6XL7H0QsPVeGEOYQMkSXh+4sKWpLg9MtCGb46cUCI
	Wavbieep1WPO9CUWIVQOoOChoolXzvGFDgYdA+jwdyM553edLA1eL26PNDvf8FYCn9/FkYLfm8p
	SDM+eAOBlEgEgTPN4d1uKHlmi0LiuZgSX8DA==
X-Received: by 2002:a05:6122:8b1b:b0:56b:815c:961d with SMTP id 71dfb90a1353d-56d4a4d3b83mr4099294e0c.5.1774818502268;
        Sun, 29 Mar 2026 14:08:22 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d77:aa::11:1d6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a46f4dsm6284108e0c.15.2026.03.29.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:08:21 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: marvin24@gmx.de
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH v2] staging: nvec: validate battery response length before memcpy
Date: Sun, 29 Mar 2026 15:08:00 -0600
Message-ID: <20260329210800.597697-1-sebasjosue84@gmail.com>
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

