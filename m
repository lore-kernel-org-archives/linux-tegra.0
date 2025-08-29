Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D0F314B98;
	Fri, 29 Aug 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756470183; cv=none; b=S6mlmBZty5OSg0LncyhkxkmIU2QyL9V34Uc+hseKIWp2uJLAw50e0+9eZa8WbBnn9V+Zz+2cdtKKSl0UHTmAQIGa5WSJDip25arznGa+FETNMczHU0gpY1akJeh+1Ee7nmKuecTV6rCe/JiQqqezB+rGQY7Hr81E6Qmemntjkmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756470183; c=relaxed/simple;
	bh=knsSMG7mo7/KAkkmud1SDqCz0Z22r1P4AiV/ONgJohc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxMzCi1SPmiNbihaG6q3N5vhBuxdnh+fN4UDTfFL25zz7pwpw6Noh7FmoTgmeDq7rDx5skK82ZF3no9uMeHhn+Ab2qx3gnJEduonKA3RICs/nDe4O8EPJFCjVdtGV34w2Ur6lz6ReWVakrC9o8zncWg9MNpIDbvgQ47ovZvWezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4SvWtbA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4SvWtbA"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb731caaaso303262766b.0;
        Fri, 29 Aug 2025 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756470180; x=1757074980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGpYtw2lXW//8PFOqj/viqbsXc94HfKiF9iNRmUCeCM=;
        b=A4SvWtbAYwjZuW9zwPdirw8nvvw31hNCWbmayg5NT3/vzITAgEu+4rRTULdh7wEggj
         vCy8J4F2lOC7uA6+XyZSulukOM2VS38V2qTth6hMEhIdsUIJy0mm4Sv0Ag49MBnKsQH7
         nHQxJpXhLxADGx+NS/MonVwN/rDY4CH03UJjCdMqvZsx/Kb/+tsIaoXIoZcLgoBrCUmg
         ZNh9ZweAfT1n62Gyu3IExMG1ssi0KMHE4OXCcELfyslywYQmXb9rjePZe7rIQ6lnwPp1
         0ebkRSKk5z7N3jb51ZrP/wkTRC67cB9Qb78tZJ6/ZOFMRMe50wXKcQTLR227TuKmXQOT
         z2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756470180; x=1757074980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGpYtw2lXW//8PFOqj/viqbsXc94HfKiF9iNRmUCeCM=;
        b=NY2Ug991QWHihinRo9X4QzPrvbvYlY3WHFKVXfoiszOENiDwbzU+ZN/deDWQP7OSG0
         rjqKYDJm78RumQrzLyovYczJKVeXPZ6At8RhUysFos07WT6jpt2hcF85xCJIVICCosza
         dkfRXwgSK96YHCgdkMSvFRvXbAB4BrQxmE/jV1hpOuy5xIihisD2FnxLIaSie4oCyDFH
         dDKPnkRjy51eyMDhfQuDdH0cQTm5WFGs3jDcxQOtRvjziy0n2ozaQ+Ii7fngYGdo4qvj
         GoQKT9NScAwrXXbOcSSN4fjXzAFWla/HtuCUE4TmZf1GvLDYU2j3nbKaBvLHKjal+h6M
         ZQfA==
X-Forwarded-Encrypted: i=1; AJvYcCUJT8yWuObc/G10uE/z/BuOX5Le6qWQEZSbmKD6PKsKKvpj6sKi/Uwnd2rLnu234AMbJtdW8Y+8Tlg=@vger.kernel.org, AJvYcCUKd3uAXa6eq0IzhefKwL0y+l4UDdw0ZNemnYNUEzgvpvhJSLAu3r6LbFYYuoizJQ/x3pnaE/UMqptLBU2t@vger.kernel.org, AJvYcCVySOUFLL2Ax4Ap6CQDUgO1dM0BbqaORPZ0LUTLxxZkPIEjUePS/ocO8vmyX1Pzl9bgsz8G48MCKnhbt0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9adhk63KRpqRnxE4bDOOCf++IVqZDHSFvOU8wFaxcM/VMiwA
	/bD77dyyjZfPzJDlZo5kHrj8qS9yEXkNQGfChQZddAVKIjVkH+HTJsjy
X-Gm-Gg: ASbGncu3uR5VJWK5aOp7EJP3Iw/uUWkGj0v+dRNtuZMn4h1yk9mHpfl+v0mXGlHTRcQ
	b/s3MqyZSufZiJUzjRSBXnezq9ueru84HO+EHFRPmF0GK7gEPaCeKGxDb/Lcu+WWGZwqWuyXa9v
	6mwiQLE4qfXasxe17hYwP52eXS6fsOQ0nAExvLMxVVLm9BMBV2djkPGprWoYN82sAQzAWzgx4cp
	yA7rD4gFmBvqOyg1Ml/tg7roJBwRm85rY3b4SH/F3B75h9XHaAC5ZtkXAcaaf4IcKEncj0dYSnn
	tYSQ7M3tYsJOu00g3I1SScSPiWx1YpD53c4ETBDcEEU5yW9/kzgFJ01niPf6bqEG2xzI4NFotor
	u/QfvpN65BkRv14jZXCPQUoU7
X-Google-Smtp-Source: AGHT+IG/85LPj0RxiOsyeRWmpcjD0QZYafof3Jq7J8suPat9E8e38oKNAkWyt/LnVbgKU3hH6qehFw==
X-Received: by 2002:a17:906:b213:b0:afe:f8ca:ec44 with SMTP id a640c23a62f3a-afef8cafa5fmr312588366b.4.1756470179518;
        Fri, 29 Aug 2025 05:22:59 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd7047sm188662166b.51.2025.08.29.05.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:22:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 2/4] clk: tegra: add DFLL DVCO reset control for Tegra114
Date: Fri, 29 Aug 2025 15:22:32 +0300
Message-ID: <20250829122235.119745-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250829122235.119745-1-clamor95@gmail.com>
References: <20250829122235.119745-1-clamor95@gmail.com>
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
index 186b0b81c1ec..8bde72aa5e68 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/clk/tegra.h>
 #include <dt-bindings/clock/tegra114-car.h>
+#include <dt-bindings/reset/nvidia,tegra114-car.h>
 
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

