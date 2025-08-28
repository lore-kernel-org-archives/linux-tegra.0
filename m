Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057D273D9E;
	Thu, 28 Aug 2025 05:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359869; cv=none; b=ZahbTeVPjom3GQ0BY/gC7tUQQ5v42so4nBuR9v5Bzixslan3sP9XzW1+x6kS1aGs4HsOvRz+Z32BYiLwNENpWUtBFtYt20YezJmxfMWt0mwy5D4WswinT+Q36PnvJJzpcm871WfM39r/niAH+uzNiM/2SINUgTe4eUix3E1ZOxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359869; c=relaxed/simple;
	bh=GpRd2cpH6bm74iiJrIiNj/rI7kKtJ+ilaAS95vZnTNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0K6LPFa7oWoOno0gLHgOBe703sIG13RkzTc09++DYNfd29LHS30WWXJZLp7nRbcvfKHvtR2iKS6MQNqm+eoM55NR8MmWdFGlzU0xpOY62oY9B7a/imHbheAnWm/8hi5LePINQBSjwvji9SjVqJ91CujZe8UrBLjtJhUcRE8i5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwgZw2jJ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwgZw2jJ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf0dso924428a12.1;
        Wed, 27 Aug 2025 22:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756359865; x=1756964665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+qNC6Houx0KRgodlm7Y1i9Tpp4N5G2Y1//qJ64dYy0=;
        b=TwgZw2jJIYj7n7OEyrhashbboH6EC0zGc+8AgRvv3u2Yg9KuCgUzuzRLcS9qU+dwb2
         XFnQwrA/Dc4tadwQsSlqHrXGZnAN2MAlV5HDE2M4NoekTSieaUEkoHvCeOAT9lG93oef
         p33sB3s8NZUOEUjWl38mg6ZIdH+lPNOsbQFB70PM5fhfGYoAr3qaTWBJ3jXaMZeXGn09
         IglMSa5OyT5cOW5gVYpXv1cdTNOiUTBQU8/mhUuzciEriNpJevzEkgM1zZz3ZJUjLwL2
         chTNYoRYh+l2TgRbRgO5BBycycJ+7tSFN8AAXyv0xo/xUtzNzjsqTsRBgicgeYL9gn8l
         eIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359865; x=1756964665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+qNC6Houx0KRgodlm7Y1i9Tpp4N5G2Y1//qJ64dYy0=;
        b=cHSJIR4vQ2leHyX6IpOvHrWrNb520VY8VS788hebHs9xlkT+oYBvrhMQ9GK25jjc7D
         Bz9AjiQ2OUb1RpyL/p2ex8EVxhiaZmNVsi9QfsHW9ArMYjhTwNG7+ocoh9p6qQdbliUy
         +tLTu+JRGo74Bpgr3FKR/ZR/IgqdbZ3v932dExKDVCdlGL8/jh47sUCGt+kqpC6/R+L1
         5q17OhRqm4rSOU9qHYFAkXvv/Ns7xbxgD3EU2kuT2UqwXGI/v2dUGmM64QiVF1AriW0D
         IhclTXwsDZ11sL3nQyJsQUHAi4EuY7hTHf0EHvfsZbkifUyaChEy+rxpSMfQL3H/rf3w
         +Brg==
X-Forwarded-Encrypted: i=1; AJvYcCUeS/AeC/IQHbjzRqcOZeF4TokQa3CaSkwjnj3MMzxcyiWSvwOljCb2NnjGVpEOirekYMfHJETZW0ewouTa@vger.kernel.org, AJvYcCV1UyWe6+lUmtAUEz+y9H8sgYZAWikIgwlTNv9kdfrDHqPZWfiUd57B8lkvYnAnhw0euDiWH8kIfio=@vger.kernel.org, AJvYcCVYA0l1kccLmVBAnTCwiM5tCAIfxwmIMs2Mpq1yiPnth4ubZGCKawSpcfJU1ILhNw6siBhHj6bN1BvMOXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb/hA5jWFX0ymGu/GOJNukKt6D960SrQcY1UuUB7ObIE0Pisid
	qSRK6SrdxzXewxSFemvrIwivH+JTyVHR7nN5M+ukA4+oVE8IjHYMme3x
X-Gm-Gg: ASbGncugTpwxTOLZ40twEAg4xMmrU+Cwvgz4Et4L6vi+ucL8lZRooMnwfjCrTsu9pNW
	zmOAiGvLTNYMToj5LAgyq1zCfraBvzympSHrFDAOiXT8CT+fXAWRgcui18EYtnchtNua89kAA5Q
	bPqL+AIAhrz7r2+l4ajaIMz5mEgcPpw+sf7na6l3zoBqzXD+bFSpV1L29+CuSmoHPwXGR8m8etc
	r866uA3ADSOHJqAFSKo5wtsiec3c1VN2nX9STC3gzRAJz7yGbF9PNolW9LF06Bzw7wvhpKDlOUK
	gKu++SMINQ06E81LMGYFz/NKHX44aP3Z9CtiPIBI1eWqrPnJrZp0gszPZ3mIVpLjs1y5h0ojHiI
	8n3mO7Vzx6TPTCpPoiGl2Anhu
X-Google-Smtp-Source: AGHT+IGGy9zZsTgJWfxlccngGFi62cdbcQfuehK7s3yXAK/qvKmMerp+GXrggcwKdHC4lHY74p4Bbw==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr19880869a12.6.1756359865506;
        Wed, 27 Aug 2025 22:44:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cbbdac051sm2102841a12.29.2025.08.27.22.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:44:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 2/4] clk: tegra: add DFLL DVCO reset control for Tegra114
Date: Thu, 28 Aug 2025 08:44:01 +0300
Message-ID: <20250828054403.7112-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250828054403.7112-1-clamor95@gmail.com>
References: <20250828054403.7112-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DVCO present in the DFLL IP block has a separate reset line, exposed
via the CAR IP block.  This reset line is asserted upon SoC reset. Unless
something (such as the DFLL driver) deasserts this line, the DVCO will not
oscillate, although reads and writes to the DFLL IP block will complete.

Based on a3c83ff2 ("clk: tegra: Add DFLL DVCO reset control for Tegra124")

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra114.c | 30 ++++++++++++++++++++++++++----
 drivers/clk/tegra/clk.h          |  2 --
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 186b0b81c1ec..3eaa97c7d79e 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/clk/tegra.h>
 #include <dt-bindings/clock/tegra114-car.h>
+#include <dt-bindings/reset/tegra114-car.h>
 
 #include "clk.h"
 #include "clk-id.h"
@@ -1274,7 +1275,7 @@ EXPORT_SYMBOL(tegra114_clock_tune_cpu_trimmers_init);
  *
  * Assert the reset line of the DFLL's DVCO.  No return value.
  */
-void tegra114_clock_assert_dfll_dvco_reset(void)
+static void tegra114_clock_assert_dfll_dvco_reset(void)
 {
 	u32 v;
 
@@ -1283,7 +1284,6 @@ void tegra114_clock_assert_dfll_dvco_reset(void)
 	writel_relaxed(v, clk_base + RST_DFLL_DVCO);
 	tegra114_car_barrier();
 }
-EXPORT_SYMBOL(tegra114_clock_assert_dfll_dvco_reset);
 
 /**
  * tegra114_clock_deassert_dfll_dvco_reset - deassert the DFLL's DVCO reset
@@ -1291,7 +1291,7 @@ EXPORT_SYMBOL(tegra114_clock_assert_dfll_dvco_reset);
  * Deassert the reset line of the DFLL's DVCO, allowing the DVCO to
  * operate.  No return value.
  */
-void tegra114_clock_deassert_dfll_dvco_reset(void)
+static void tegra114_clock_deassert_dfll_dvco_reset(void)
 {
 	u32 v;
 
@@ -1300,7 +1300,26 @@ void tegra114_clock_deassert_dfll_dvco_reset(void)
 	writel_relaxed(v, clk_base + RST_DFLL_DVCO);
 	tegra114_car_barrier();
 }
-EXPORT_SYMBOL(tegra114_clock_deassert_dfll_dvco_reset);
+
+static int tegra114_reset_assert(unsigned long id)
+{
+	if (id == TEGRA114_RST_DFLL_DVCO)
+		tegra114_clock_assert_dfll_dvco_reset();
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int tegra114_reset_deassert(unsigned long id)
+{
+	if (id == TEGRA114_RST_DFLL_DVCO)
+		tegra114_clock_deassert_dfll_dvco_reset();
+	else
+		return -EINVAL;
+
+	return 0;
+}
 
 static void __init tegra114_clock_init(struct device_node *np)
 {
@@ -1346,6 +1365,9 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
 					&pll_x_params);
 
+	tegra_init_special_resets(1, tegra114_reset_assert,
+				  tegra114_reset_deassert);
+
 	tegra_add_of_provider(np, of_clk_src_onecell_get);
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 5d80d8b79b8e..58e860b18e5e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -898,8 +898,6 @@ static inline bool tegra124_clk_emc_driver_available(struct clk_hw *emc_hw)
 void tegra114_clock_tune_cpu_trimmers_high(void);
 void tegra114_clock_tune_cpu_trimmers_low(void);
 void tegra114_clock_tune_cpu_trimmers_init(void);
-void tegra114_clock_assert_dfll_dvco_reset(void);
-void tegra114_clock_deassert_dfll_dvco_reset(void);
 
 typedef void (*tegra_clk_apply_init_table_func)(void);
 extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
-- 
2.48.1

