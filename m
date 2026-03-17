Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40B212566
	for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 00:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773707360; cv=none; b=aoeNYb8ePCiqq3u3sE2Zh6PneG1Uclb1+MFYJpcSuBJ3/SLSh2KMnRYnDISf/AEi9yURr4ZUpyPhcB52Y7NeNJHVgfp3I7oHsoHIJ+tYy6PKGrcI8IbqAW2/oHFTwuOGNLCiWukmQBp9ppHac/DNG+C6pvUjKQ7XMI7wa2Jk3VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773707360; c=relaxed/simple;
	bh=Ykl7pRMjv9ddmeTEMSu2XWv5ypxsnnaE2OuTTvdmJf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B15V+1QLHonfoWA1G8I/E0Nj7jZpnc2dMPESnleGKm3kW4vz5gMbAP7q2JyDE4TAO58gbr9PqXwGEB5c0n4xG6o6DKacM9sPxcNEWOtQgt+Jw4490Haz4iUwfwv9d9SxH9NIWe5AM8V3bvzUsATGXwkxhYOX1MV0yLoVgHygtN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKqgHCMF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKqgHCMF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829865a8471so4905713b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 16 Mar 2026 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707359; x=1774312159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEaJEC5yeKcESXwFqV6k9VnziI7uI+jjMq7JZGGKBfA=;
        b=JKqgHCMFSBN2PktyvNv9ikODFsFN4db8y1UDUAFV/l3h66ijBTPp/epT4aUYOshxTa
         /zCbg8ydFzlS1rtWzGwKKDfhw6mcsPjciA88tBxolmK90PX1Xd9qoy5UVXlqwkv31vI7
         B9CNqxKFN6v6yFspDcztc1/MGSwLCQSvZxQhInkWi+RazCtKvOwtq+NLIrfb4vVoPKau
         9+Qcrka58jKKJfCn3zMCdAaD+qXWKWfxvLgIGrPojnnR3XrAgOdvYdxzMLmbVexL73/d
         3cg/KRTHRhC3DuS/UC/C/zWRYnDOkV6SIuyvr/vqpN+nnztK90kvC5GTUeJ5McPGAwXP
         klfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707359; x=1774312159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEaJEC5yeKcESXwFqV6k9VnziI7uI+jjMq7JZGGKBfA=;
        b=AsHwX2uBFlrsd+FEauq6IvjP6K2LkaW0o2ilWhDNHOcPmC5JzV5LHBPn1hO8o/bZ9B
         Li7wMTX7s/HakBhwkmDuWjVWJvwcEIzKOpeck/JqSU1QaCtEeDYoXRwROjibiUBoAT6A
         u2KBitobU1reoeJ8IKL0A5+lP6FK6Y4XSKNqchssfK6EycTnXJeELuNlZtXUj+4m4Du1
         uJHZrW4Px7eKeQrLQ6hQF44JToqgQuVpTP/b9Vexr3y6V0E6UPeDKmRZeJ5DQapzX2cY
         EZENEZpEtV7km5HE6M0uawIhTFqtzBTMDs2YFLzPdy7KbyY6Lm51jqyeyvjmHzOFmHZT
         3rqA==
X-Gm-Message-State: AOJu0YyJTwHhEu44rZb1t4/+mhl1L+az/EbDaNGifV4+e9LJJSkcG8+d
	ff9/0xdDZmVZXZqK51s5Tgy5bdm+FZdLhdEpfmemNXjniK8ixkJUnT6Mrlt1KDVr
X-Gm-Gg: ATEYQzwQkdsN3d/CRa5GuYrZPnP0xm+ymx50MquQIav8vTSkkWnJW2Gn3lD9BufRLmk
	3Zcsgb3K8MpQQRPvNOTYaTfkn7JwpEIfkpdJQ9zS70vpqQB485uqn0edk8UFK3eGigTqQ1DtMts
	+kYq5pjUjOyPmNoN8NmNkJiVua0sAbwef9bpvMbwjOZJaYced13ylvPWPcCVMUl5xD2nsmHsnKR
	oKZak4lvfxsuMp42FnxPRtZ0XnKJLG3IXjHyaPiucoe8M9ayzLsWe12KJ8vl4w1/Fie0BX2kVKb
	xufsR+JGGAXArV6zVHXkmjH5/WJ5oRJNfUhn4Go8NzXfcbUS94iB6L/KtwwseVaUIGPhUJ4fKbY
	TrOpv88dtuSW3eNdZAssQ8qyhh0MqBCCJJDqA4K8GjEzHf/39GCAxqT0rbkObvGxEXSh/meqH2q
	REW1R9UD4jvjWF1KApVnVJPvXqNNP704dJ3mjFf5cdgGxbH2jkUss90jM=
X-Received: by 2002:a05:6a00:1594:b0:82a:778:cd73 with SMTP id d2e1a72fcca58-82a1992c45amr10581048b3a.51.1773707358578;
        Mon, 16 Mar 2026 17:29:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072603c0sm14010022b3a.22.2026.03.16.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:29:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: tegra: bmp: remove kcalloc
Date: Mon, 16 Mar 2026 17:29:00 -0700
Message-ID: <20260317002900.71452-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to avoid allocating separately.

Use __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/tegra/clk-bpmp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index f6d2b934228b..e2d506cdbae2 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
 	unsigned int id;
 
 	unsigned int num_parents;
-	unsigned int *parents;
+	unsigned int parents[] __counted_by(num_parents);
 };
 
 static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
@@ -510,20 +510,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	unsigned int i;
 	int err;
 
-	clk = devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
+	clk = devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_parents), GFP_KERNEL);
 	if (!clk)
 		return ERR_PTR(-ENOMEM);
 
+	clk->num_parents = info->num_parents;
 	clk->id = info->id;
 	clk->bpmp = bpmp;
 
-	clk->parents = devm_kcalloc(bpmp->dev, info->num_parents,
-				    sizeof(*clk->parents), GFP_KERNEL);
-	if (!clk->parents)
-		return ERR_PTR(-ENOMEM);
-
-	clk->num_parents = info->num_parents;
-
 	/* hardware clock initialization */
 	memset(&init, 0, sizeof(init));
 	init.name = info->name;
-- 
2.53.0

