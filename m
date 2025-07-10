Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56A295DB4
	for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183965; cv=none; b=Ihnp2y+XyLov4gzLuy0JwqP88orS19TN3lHrTL9hlaJ5mNwJMx228sjczqBXtPQU3/3rhkvDgOD9gmOG/TuxiOZhjq1nGioqTGfVnHN3wQp+I2G4P5Ii5tW59wcoF6J+QDeBMGeyNUUYHS0bmW2ZfZ7DETHDyNtWR1Fz2+XjlIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183965; c=relaxed/simple;
	bh=WwQJN6ZawKi/951hM5T5RhPYqORrBWNZQWoglB5Pfsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmMSegNJ/03zHCirfDeBwm+SN5hFKUiw+jNpYUnJnsKMfggS30GwUg1VfoCXCcaj6YGE9qqmN/IclFpDYh6+v2yMYKzA9ohZnc8zJ2kIJvUtdwT351kPif6ji1y1UnNH12ExcpkgSWyqbSPA/hMHX3yDK9DuiVSoGz4GFg1+Cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QlPBICJ9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QlPBICJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBk0yxGrEunv5/A/4cPrErNnsvMiKw7TX8vV/spqNxg=;
	b=QlPBICJ9ePJdJFxTjE7ZO5RTXi9QQxpucKtWsybIdiPb6OqOvXlP0EpXjBDIcMzBvd8x2v
	ilVeN2wqIQSjPfmi5dWpxEv/ErQlGeh7Bb/seEyZ+ay8LKzxxuBF4jPwMtg0AH1mQVhqZj
	Q8qfeu0jek5JlD0NRaJIiJszLajXWjQ=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-xLfob1HyMW-SHck_eVvN_w-1; Thu, 10 Jul 2025 17:46:02 -0400
X-MC-Unique: xLfob1HyMW-SHck_eVvN_w-1
X-Mimecast-MFC-AGG-ID: xLfob1HyMW-SHck_eVvN_w_1752183961
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40b99df0c1dso446257b6e.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jul 2025 14:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183961; x=1752788761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBk0yxGrEunv5/A/4cPrErNnsvMiKw7TX8vV/spqNxg=;
        b=omiFaH2RNFutOt8m5Wr13yNPnXy4fPoRDlaKeAqOXUwMTNoF84i/dbPyip+hkTKMNz
         b7g3rGHAt+yS0knJo0Sq1hiLPCLcPv/11TvxGuq7OAAggABohBs/2oGgn+xHHa8AS4zj
         NNm8aRkcDGGTY4NgUOXAy3nr9HYY+OLqv3cG3xYXMWl8DUdAsCnGQie7ogw2nxQj8E1f
         jHasY6OHYQExDI88TD9FcLiMeHdKx53XrrqGTfAuvnaXAHgEAXSIogDWOafmAc/0tBMK
         FbEQHHE/H/M7OHIQjeFRCgXVX0zARTqmDuc33VtcIDO7pCNzTg5OtaX7NiXlhalvByIh
         jv7g==
X-Forwarded-Encrypted: i=1; AJvYcCWYQnbdRmCbe+okYS8AYl3jNbVlAeRVaoYItxzwj14gtI6T0N919i+0Mm1YGCvRUtmfvFPVXc1MPpS4Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69P+ZLAwkjpdB6BK+DAYNl5mgjvm5XRrV/RZRJMXepSVC0l32
	+zsJCllR7eKcPrxmYBaXlTp9CI09Hpl2Boe+/X9fuNMKXfySrvbERjHkb1q3h8dRIojwRpsLkIV
	Lm1FwFnKyQF44oi/8C7pF93y++/xPjq8hUjlhdmNbPe+sIzMrAosNZM7OaN7PPuoX
X-Gm-Gg: ASbGncviVt3jxVSVcvr+qG2h20VEmlMmyKIq1MAqmdtCCFXicfU77HGE789J/Sk7LNr
	KTw5mxd3tG4/p0VjTgmr9I9sy3g9F0zJTErAGkqpjmmIwumjJ0n7xY9s2LBBgHGvTVhYw5cY+Go
	FKjusreEQ/OxRjs4youanDEDR0KUQM85z4AerrW0Oh3WlxWro8uLhg+5hj+5k7/YTHUmFZXO0ql
	WLf+Duoshn0MCcvZSbduD0BEk3hIJjuDLipW1lybwWYTK3IpJ1cJDTRrvX0pMjq1XV21XTWZeHo
	TRDp6gLiebDgIt2K8iK4jeOT1ft/5/aDUfVLKBtyr3Dl
X-Received: by 2002:a05:6808:1a0b:b0:40b:9361:cd69 with SMTP id 5614622812f47-4150dc2c900mr839383b6e.15.1752183961229;
        Thu, 10 Jul 2025 14:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaRi2JdektnIiRyrF7MFlrXgAYDJZGe2gepSu0dNLxidhMxjuCa2Kk4y2JM8gnTkqE8elb0g==
X-Received: by 2002:a05:6808:1a0b:b0:40b:9361:cd69 with SMTP id 5614622812f47-4150dc2c900mr839364b6e.15.1752183960869;
        Thu, 10 Jul 2025 14:46:00 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:46:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:18 -0400
Subject: [PATCH 6/6] clk: tegra: tegra210-emc: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-6-e48ac3df4279@redhat.com>
References: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
In-Reply-To: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=2229;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WwQJN6ZawKi/951hM5T5RhPYqORrBWNZQWoglB5Pfsc=;
 b=CVLu9H8KuBI4I8blZ+et/1D2flCxkr06u0XAQIT3E96eHM/iwdbt1AHiUiyMoBmVw91uLXXZS
 XXHUcotXL7SDJKhMQRwAo/LmG74X9VHGq1pvNWaQqus2eL19renJKMZ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-tegra210-emc.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210-emc.c b/drivers/clk/tegra/clk-tegra210-emc.c
index 672ca8c184d2c6e9a7f26c07d036f3359af42bc4..fbf3c894eb56e3e702f0a1f67511463dc9d98643 100644
--- a/drivers/clk/tegra/clk-tegra210-emc.c
+++ b/drivers/clk/tegra/clk-tegra210-emc.c
@@ -86,22 +86,30 @@ static unsigned long tegra210_clk_emc_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_UP(parent_rate * 2, div);
 }
 
-static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int tegra210_clk_emc_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
 	struct tegra210_clk_emc_provider *provider = emc->provider;
 	unsigned int i;
 
-	if (!provider || !provider->configs || provider->num_configs == 0)
-		return clk_hw_get_rate(hw);
+	if (!provider || !provider->configs || provider->num_configs == 0) {
+		req->rate = clk_hw_get_rate(hw);
+
+		return 0;
+	}
 
 	for (i = 0; i < provider->num_configs; i++) {
-		if (provider->configs[i].rate >= rate)
-			return provider->configs[i].rate;
+		if (provider->configs[i].rate >= req->rate) {
+			req->rate = provider->configs[i].rate;
+
+			return 0;
+		}
 	}
 
-	return provider->configs[i - 1].rate;
+	req->rate = provider->configs[i - 1].rate;
+
+	return 0;
 }
 
 static struct clk *tegra210_clk_emc_find_parent(struct tegra210_clk_emc *emc,
@@ -259,7 +267,7 @@ static int tegra210_clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops tegra210_clk_emc_ops = {
 	.get_parent = tegra210_clk_emc_get_parent,
 	.recalc_rate = tegra210_clk_emc_recalc_rate,
-	.round_rate = tegra210_clk_emc_round_rate,
+	.determine_rate = tegra210_clk_emc_determine_rate,
 	.set_rate = tegra210_clk_emc_set_rate,
 };
 

-- 
2.50.0

