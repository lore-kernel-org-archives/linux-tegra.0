Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D293A6EFA
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485698; cv=none; b=J353r7JUvYjsoSz75ZnMW9noj9QiZF2mDIMGiV0VbdQi4Ml/ICFoVIfXKHxC6xy7JhVX36qmAQrJ8hY/pncsbccbBzmVe+3J+Q/Tkj501GYczKG997KPY+NV6INQ2DSeWk5e+O7FZouyUrE6FXY5OxSGpaNbHESoatqYI2Ku0wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485698; c=relaxed/simple;
	bh=a5IbzyKjLis3eRn8I8yPDJONzC7VptAGC33I38MNFzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWYhPix77qIkKk8XIePN089VFO7+J8gy/FFeJrV+cUcCgymeP8Gw/RY3YOJXdCBxsEEAkXr4UnWOFWXWbgznFX/yBao6KZFXk8G6QaesHaNVZrLJlvJza/81iDHL9hyUqUlH6AFNvm0i7bu0blidk9hxD9zSvRMZXGvV3gqLmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfUUeuA3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfUUeuA3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso3915587e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485685; x=1779090485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
        b=hfUUeuA3gyVafmmLNJovBUH6vaUYDH6soWYf4ieh3dofLwV+G4CkYIJ7KiFuxugo9i
         AHWoy28unYV+FBrzFE2J+VjJ3IvgUfR9h6mD88lPFDPuO8sWg/r5pBiT3UUSNY2jWhdx
         vXr0eTiQLw3p6Ep8Ljvcnm2AdWuzW4My26Xo/50bAa/MUUzqRWJF/iuN+meUKvU9POux
         p1xPyVKsDVbfPlGmsO//P02bIFZQrBXdfzQqQmQwU+ukizuDjtsvS4NsTl/Ugm/1znSE
         ivhMueHRGZnb/TDEijOOnT3F4F8+6B5LnNgeb1mPlio0v+IwATRVYp6NOj4Yu75/xGXH
         q7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485685; x=1779090485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
        b=gIdkinIglgv+qJcmP8Gvb9QdeRh04+gu5tDv09qqwRyaIt397b2KgY6aKQqnjSNxKD
         0wjZGQ0oNjtTFh/6wgf4XJYppAS8w4ty1jTW871X3b8Eu7o8TVS3ZIm3heb5xO31JIXS
         C/WLWumK7sBcXZNcKrVsCs/wbOf8MqdzV6wtJM3as454jqswzXS6Zy5WKYJoBDfRi1rO
         1jqAMvWr3+0+YwhE0xzZqtb+Q+L2bXYl1slzDgcCMW+XIyn7OGdoyi/Y2gfvdA/0SES7
         wyebvdcg/n361ufHxb85dSYTMihI3hi5r2QkKTJRCt9+XOcQkYidkZFwYtcixly1WIRz
         lMMQ==
X-Forwarded-Encrypted: i=1; AFNElJ84Ur2sDLK9OPYqEmPfNCYsto/wF753H/bG01G+Llbe03pQd7PQwABcy6ZMHGVXVqrz8NEpZ0Dbg7IKXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Nqx3+8O6ofpigOxmRtQWDoXkPiEsAMd26573h1f+p1jQkYI6
	KUcMYHVIeXJco1XWjEUjFe7n6tQSvi4AfJ54kGV/Kzv9sluNwWTNHXB438mbLQ==
X-Gm-Gg: Acq92OEJl4dRJVyqgeUyASD5uggN0eY9IEHmudoKdNenKH955aFrXzbAP9FG0zwK8MM
	VC9GsvRg6OmyUFsLcpXwKmNEXqlP4+GQxPbMmLi48LQSTDIYKS/MzS1FH9y2RDfk6YD1uezV4WF
	8fcqF2bbqy0W7D5grMe9XOLhFXXuTTdAlLwtJT7pV74DLCPTurbhkdM5jodZoQeTmePxFp0tk6U
	c9Gy2K+3QrzH2bESzHPNunYtlBv9syDxPEXt6jb0VPvk2Bulf8v5bp3UOcnYdZivlbFd8KQGJvh
	Yu37eBV62ruE79jqoygMqATH6fvrWuMz8NK01o/20zlkKPx/yngEVUZyyT3AtE3qaCyjtPqiwZ+
	RuLuTkj8I9LZ5tK4BOzNALEBSR60zkgMny5GknF/hYHz4FlTDOuoxyifBKrfVzEqDGosdJIYeUq
	cenF5By1N6Op2A
X-Received: by 2002:a05:6512:3c93:b0:5a8:88f8:9eeb with SMTP id 2adb3069b0e04-5a8b6ca29d0mr2370612e87.11.1778485684961;
        Mon, 11 May 2026 00:48:04 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Mon, 11 May 2026 10:47:49 +0300
Message-ID: <20260511074752.24745-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
References: <20260511074752.24745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..551ef0cf0c9a 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -802,9 +802,8 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0, clk_base,
+				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_DSI] = clk;
 
 	/* pex */
-- 
2.48.1

