Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DC368D40
	for <linux-tegra@vger.kernel.org>; Thu, 30 Jul 2026 04:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384765; cv=none; b=pD0STCQi3GgO/Wr9MFS9dRoWaQjw0gsUwdWYHO+Hw/9fPaMEYdCUeU6MQ1G5ysC04WYqFP6mUdQdoUeB6YIIFcbSDimeIX9RmETpwNimBVRjk+7Xc4Lvn3mXIVB/dO9/Rq7LbFxXWQ97l0xLUN39w7P4ZMzFsw/D68LtFSUvkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384765; c=relaxed/simple;
	bh=A8xI8/uO0nyr4mkTXdCUQtJZL8/Y+4SmdbbBQ+cYk9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSLpn+ExjCIERda3FT6RDdwHPJxXfwjpdMjgszsnMjQQlfTSGqr5jSG+plqvGJe9QLB49cf9D6O3lf6CVlIfrmVC7iVspT7kl2NPqRedLYWBRfkAJL9vk4obrDxEtmQDsKLDy7OM3hgs6LDbx2tO0Fu3+ByyYwk1XUJiMwf4XIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6uPMCxE; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6uPMCxE"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca957432c7fso1252293a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jul 2026 21:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384763; x=1785989563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY9HS5XLRtv5Lc9POKc9VtUHE0COzAXpfC43+pdnnFk=;
        b=e6uPMCxEVuaZUQWIGK75wVQKototuFkU2BB5IVcxa17BYoJIZIyygw8VYVV9q1P7Qn
         OhkrwxwQGT9tU3b16qMTDU1Ta09ivox3jtSI2ocksXP31X4FBd+MXsL7ZruuroWAiEWm
         7p+AirUJfFlktyxdVHX+LHVdRMxOYJ3jYy0P9Vg5NmkRXn0Wwj7Yu9DOqdfMegVFLfUf
         91ciLuS2R6qfcOpiFAETFqh71Cs0pxFXT1LAbiiTM3ZHf/8EjMw0YKvPKf6riWpHbc/4
         HYtbEImgnJRmnFKE4GvpIDUy8RUOeIis5Dn549TW5X6eT/BQY/haMhD3VHCU2QpmCKiz
         +czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384763; x=1785989563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY9HS5XLRtv5Lc9POKc9VtUHE0COzAXpfC43+pdnnFk=;
        b=Q9jH61kJ0Nv3iN2teQII+Xr92aOOKD9SU1rz63PCmi2uc6D9p9hk3/k/JWLIxkozmG
         Tm82BuI2aIYCJCBq5HOK63VnWfhRires5FMWmj/QmO7O+2J0kQtHvqthypW47ZId/fzT
         GAAHTBpqWFjitmc6QQZ+omcnfz6XKcf7FT+FfdGQ7BJtTE9PUJJQuhDCoty+6QnV891z
         bkcBWZslpY5O4fajBTag5L6x50NCEfFHDU+L1utybOncQQ5KAB7MMNNLvlLqXkWnWiZ3
         RSK1ahclCaNFsc0sgdgq57Rqw22kOLDMYSCjg3DPvD1m7QTX6p/PENdl/ZRbCvxKfsHS
         wVxA==
X-Forwarded-Encrypted: i=1; AHgh+RrEZV/sfpw8+xC7DfFUoKnOsJ6sPJiIjkhN9FO5htHUu4PqrN/d0MLWdsSdabqXtY0QedpuCcTPjbXwew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBS7je+13wO1bdv/3ADo1KJfUGcYBYCozQ6fr0mk9poHMFRDF2
	35PrlFMt4XIMzmlFEF9vJZsZqbTU6b3b4AQzTNDDOJR6+KTzltjn/ztS
X-Gm-Gg: AR+sD116wiTPOUQQlI2uHBU4x59Ia1CNTqbwn9WH3FFQzK5D/8ULU6p7BrCSc6rpv1/
	e1UD1z/6pZNNBNa33t9UW/KN9rFZnSwWg/3eqZamflFJjp/BXvA9komVs9dc7zeu1vLjdJo8kuW
	0HsWnjVZeDu54hisVdCoFMnIKZtmMI+sYronwBO7WsFAjEnjJWILXCSqFUTQre4iUgXSTr5udNf
	syHcFWVq7/iI+QOFLDUTx/hgrghNzp7/WwYRRNUOABSVPlzH/UU/6ilyO5ZA9P6rzad8/W94TfN
	OLMy33KAwyb2mN1vKwzybRGnmTqKLea339JG63XET9O2jChrZ3O6mokX5iHALMt00mHplLcR3cf
	pwum+oZ3myfG432G6m9DvO9pzwL7yO3SLQlzwkn/pYB6JVA5qUc0wXfk3uEP8dynbzas1brVSSl
	fWWNJPKx2gh8FhpD2uDASw3wJMSe6+Fjb9lbeMQucUyL1AMWBrIiUIAuYFkgLJP4xdNzrok3014
	oPDSV8=
X-Received: by 2002:a05:6a21:b90:b0:3c6:55f5:269b with SMTP id adf61e73a8af0-3c900a07f07mr911836637.66.1785384763304;
        Wed, 29 Jul 2026 21:12:43 -0700 (PDT)
Received: from ArchLinux.taild01bf5.ts.net ([115.76.55.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7262c23bsm13906182c88.1.2026.07.29.21.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:12:42 -0700 (PDT)
From: Dang Vu Duc Hien <dvdh12707@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luquijeffrey@gmail.com,
	Dang Vu Duc Hien <dvdh12707@gmail.com>
Subject: [PATCH] staging: nvec: fix out-of-bounds string copies
Date: Thu, 30 Jul 2026 11:12:20 +0700
Message-ID: <20260730041220.1064608-1-dvdh12707@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
References: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function `nvec_power_bat_notifier()` assumes that `res->length` is
both >= 2 and within the battery info buffers.
Technically, `res->length` is provided by the embedded controller (EC)
and is unverified (ie. a malformed response). If `res->length` < 2, the
expression `res->length - 2` evaluates to a massive size_t value which
is passed to `memcpy()`, causing severe memory corruption. Conversely,
`res->length - 2` being larger than the buffer also causes an
out-of-bounds write.

Introduce helper function `nvec_bat_str_copy()` to safely handle these
string copies by:
1. Ensuring that it returns an error to the upper layer along with a
   `dev_warn()` message when `res->length` < 2.
2. Ensuring that it provides toleration by copying as much as it can
   along with a `dev_warn()` when `res->length - 2` is too big.
3. Guaranteeing a properly sized, null-terminated destination string if
   the copy succeeds.

Signed-off-by: Dang Vu Duc Hien <dvdh12707@gmail.com>
---
Note: Coincidentally, I have been working on this exact issue earlier
and had this patch prepared just before Lucas Jeffrey submitted his RFC.
I am sending it here to answer his protocol validation question with code.
---
 drivers/staging/nvec/nvec_power.c | 41 ++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index c514d51a9e57..12699515356d 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -117,6 +117,32 @@ static void get_bat_mfg_data(struct nvec_power *power)
 	}
 }
 
+static int nvec_bat_str_copy(struct nvec_power *power,
+			     struct bat_response *res, char *dst,
+			     unsigned int dst_size, const char *prop_name)
+{
+	unsigned int len;
+
+	if (res->length < 2) {
+		dev_warn(power->nvec->dev,
+			 "battery %s response length too short (%u)\n",
+			 prop_name, res->length);
+		return -EINVAL;
+	}
+
+	len = res->length - 2;
+	if (len >= dst_size) {
+		dev_warn(power->nvec->dev,
+			 "battery %s string too long (%u)\n",
+			 prop_name, len);
+		len = dst_size - 1;
+	}
+
+	memcpy(dst, &res->plc, len);
+	dst[len] = '\0';
+	return 0;
+}
+
 static int nvec_power_bat_notifier(struct notifier_block *nb,
 				   unsigned long event_type, void *data)
 {
@@ -193,16 +219,19 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		power->bat_temperature = res->plu - 2732;
 		break;
 	case MANUFACTURER:
-		memcpy(power->bat_manu, &res->plc, res->length - 2);
-		power->bat_manu[res->length - 2] = '\0';
+		if (nvec_bat_str_copy(power, res, power->bat_manu,
+				      sizeof(power->bat_manu), "manufacturer") < 0)
+			break;
 		break;
 	case MODEL:
-		memcpy(power->bat_model, &res->plc, res->length - 2);
-		power->bat_model[res->length - 2] = '\0';
+		if (nvec_bat_str_copy(power, res, power->bat_model,
+				      sizeof(power->bat_model), "model") < 0)
+			break;
 		break;
 	case TYPE:
-		memcpy(power->bat_type, &res->plc, res->length - 2);
-		power->bat_type[res->length - 2] = '\0';
+		if (nvec_bat_str_copy(power, res, power->bat_type,
+				      sizeof(power->bat_type), "type") < 0)
+			break;
 		/*
 		 * This differs a little from the spec fill in more if you find
 		 * some.
-- 
2.55.0

