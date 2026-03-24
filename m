Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF173A383C
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376863; cv=none; b=uWl2PDHFzbuki1UVYM/AmXUbp9cBD9P+pS78/KGpt314piO8PjbpdbkZB0pO35faQFntOmmsbWCzF3am5/+bzlH37uYHS39vLkGPIY9d+SGxSQT6293h7HhEeN3h8Du39u43GUjuaovC5azcm8ihSJIEhebLJRAvHnmvamGg1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376863; c=relaxed/simple;
	bh=Gi4d0M5a+5Q4+n74Mmna9wNg+TAzJTOOC5zaGKNgvh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efLbrjvgdlpKsWa32YA///OfQXUssnseb2owrU6Cjfh4CiMt69fomKQvw7kiBASN9DbHICeW4L8E28oVe4gHP62cjHB7ezZzTvTidQSItVDO/8CVx5q+tbWzKXPsubOvxYlXiKEZVIqdhKqHcmvn0Rx+U/8t61upbJRLcBy6XvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuMmfs9X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuMmfs9X"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so69536a91.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376861; x=1774981661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
        b=WuMmfs9Xmqa9GVDNOZjmNUordZmBGAfWmTmNyhu7SWk9d1fBi9J7mmm9H+nbdWmyJg
         1oV4WrXltAPUWBmWaeV3MF4z9LIcaBBXfv27e1H5aTbrXLiuOTVeZeUYNA5dqXvE2MJU
         jKDBjTnHVysLF9BRylvs0wLrbkMhnJnBIY8fAsyHFm9e2/GeZG9+RWskGeeOCCs+x4OS
         +oI8wsXi7Q9xh/s1oFEFJGFFoeYKQ4Alkq/jd94/q9rk/kkg/p24Y+cfxQ4QsIYX6Oyb
         fAPXNU1TkvhBWDY7i11v2l9jys2jwmTGmn69A9e4gFsaKPPsObTfJRlijFVXWYkNVOzG
         H5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376861; x=1774981661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
        b=RycBgCkIyv8EAlpVfUf4KoKiafTitXnoq5B3u5pZ1GCah+WWbBYu3FGxhFy7T45lZt
         3Te5v7jxv1Yb8uXT60Z6UMHl7ad/OVeLApLKdwREGujgv6taxwzOS+N+ZClbLU84EGR6
         V6ff2I/qwZcMwY3pga5kbtqB3CxbI3MThpd0vu4HH9jPi6xaNTqnoCj94dXczyLGlyA+
         iXQ9GdaKEjJ0uiJ1VyIyY9PA3OKggXFz1kRfkpnALyG075FRTwgzwdF8F4QuCF9QEGL3
         Sr/hFzX51ak1nOxAvQnAPc6xefgwCkiXS73BhxHJXHdQhOE/NpL99VNtM/VLdAKuWvk5
         6oEA==
X-Forwarded-Encrypted: i=1; AJvYcCWDVwLEZzInyvNsDlWPw3PdCQclD+FW2Zhf8+QAAj9ukgKiNpjj2foLZy1C8KcZZFSW+THX4LmBPLmKUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyziYUAaZR9Yvi7cwJ1lLVH1P4z4vr/gdYc/IBK07RRMtnL3JB
	Cn+rerCqADX21Q34eZp8btHFTAoAQSk61O66YisNPMXI5/wbEUnMdpui
X-Gm-Gg: ATEYQzymAW8s6svevFDb37mhfeOoMvjrBU11DRDiQ8XdSjJJGTlch0dXMjTlB+KoDRt
	gBqXLi+HJoSHHSyM4f6xwd2eo2URfpJ4YBMTbjUFll+AJAxVi8XmTihBZ2kbkb8guHx9Z6lDtGC
	HvTpQSJZSDqn9qXd7n5BNd51X/vtT9uy02qT6QZe+W/QBXzN0CcQahbD3syeFy9RLpkPb+zUASr
	pag0fu/SSClw+DeWRBND/BHX8dKl3jpq3Ldj1cDOyhZym+Ett/lUQpwLSd4T4yNEsfRb90izWiU
	27zElBscy6Y3T6iZ9ZxkjYoTBeVDCrD/xdXh0ArXhl0U3zncY0IqSHHPuD0ZWRWnkoTyasO4pcO
	M1+hymI1kc8enS12UBpZxpBi8pNdRALv2TNdAtxIkwAr5diMzXz4w523+pBDKg1WfNJnBpZZatZ
	qjlpaTfEzBnpVI3OitCoH5tK2t5A==
X-Received: by 2002:a17:90b:57c4:b0:35b:9703:7664 with SMTP id 98e67ed59e1d1-35c008d38f1mr4197956a91.10.1774376860812;
        Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:51 +0530
Subject: [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with
 dev_err_probe() in probe function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=3450;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=mGoeA4RoMr6oMafJS8Wz9uEiYGmdoZGvaadkVl07Ac4=;
 b=mqDXFTn7P7YKfYZq5yfTqBReywbYSNkXTrDiQ10Gxn0U4N3AcD22e4px2/bKmxQtkFRLFhMV5
 D6Rwa2VObbECiZHEiSRVGIVnkT5nDLR0wDkwvKuXdMmJb12BQQQ/qlI
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..dffbe776a195 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
 	int ret;
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if (clk_freq > P2WI_MAX_FREQ) {
-		dev_err(dev,
-			"required clock-frequency (%u Hz) is too high (max = 6MHz)",
-			clk_freq);
-		return -EINVAL;
-	}
+	if (clk_freq > P2WI_MAX_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "required clock-frequency (%u Hz) is too high (max = 6MHz)",
+				     clk_freq);
 
-	if (clk_freq == 0) {
-		dev_err(dev, "clock-frequency is set to 0 in DT\n");
-		return -EINVAL;
-	}
+	if (clk_freq == 0)
+		return dev_err_probe(dev, -EINVAL, "clock-frequency is set to 0 in DT\n");
 
-	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one target device\n");
-		return -EINVAL;
-	}
+	if (of_get_child_count(np) > 1)
+		return dev_err_probe(dev, -EINVAL, "P2WI only supports one target device\n");
 
 	p2wi = devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
 	if (!p2wi)
@@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret) {
-			dev_err(dev, "invalid target address on node %pOF\n",
-				childnp);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid target address on node %pOF\n", childnp);
 
 		p2wi->target_addr = target_addr;
 	}
@@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
-	if (ret) {
-		dev_err(dev, "failed to deassert reset line: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
 
 	init_completion(&p2wi->complete);
 	p2wi->adapter.dev.parent = dev;
@@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
 	if (ret) {
-		dev_err(dev, "can't register interrupt handler irq%d: %d\n",
-			irq, ret);
+		dev_err_probe(dev, ret, "can't register interrupt handler irq%d\n", irq);
 		goto err_reset_assert;
 	}
 

-- 
2.43.0

