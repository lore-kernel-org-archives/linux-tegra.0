Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C100E24E016
	for <linux-tegra@vger.kernel.org>; Wed,  3 Sep 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912582; cv=none; b=Qx7eG9nnwRuxDDI3EBlEfiMu1sAG0N4W+d7k2pYuutlkBNh3kcJEB1lrNyvLtgecmZZvI1HYc9h/zGNphpZ+auUWhhOlvzMHM5ELLAyiTRHZSl604Xh3nfZTi+7Ujn/ycSpDoSWYX4F5h0Y1OvO7vcHoCbRbc73MsEAvksLPn2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912582; c=relaxed/simple;
	bh=43sEbwhMVLXr4Ugy2k4lhtQIjlFVPQRMntWIuVLuAbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+f59tGaqNv/GDY5p/GRFNmtbJayfoZ+qEKN6/nAPJyMrftt1EU9yUgXEg2eXeWcB/h0x2yFHv2XAkgu81ctuj/nu0LDr74KMhGWRFGTyfsyHJYSab4IH2MF8Dz1weT0nMUH8wstZ4vY5roztVmqTAvjJNBnuEDWaOG+ZHRZ5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjE8Jx/f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjE8Jx/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9cuOYxu0U7DIdqQ6OT/K5slwo9p+cHFbhRnmBL6l1o=;
	b=QjE8Jx/fVfB2qFR5m1a6XhLEGqm7T5o7+dna1xJ6VQOHBKp9qYlgn69Af8Cjn7eO0vjVKj
	7Y/q+x7caFK1ZFWQcLCEb39upgS2F7+HszFt5bQWyAxyyiwOpqwTGdsxz3u/NFAtgM2OHs
	xCr+CDCwrL5JCkdjEExL/g5czQybOo0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-WD2_KqLDNAuhTsfZeP55uQ-1; Wed, 03 Sep 2025 11:16:18 -0400
X-MC-Unique: WD2_KqLDNAuhTsfZeP55uQ-1
X-Mimecast-MFC-AGG-ID: WD2_KqLDNAuhTsfZeP55uQ_1756912578
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-726aec6cf9fso10807146d6.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 08:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912577; x=1757517377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9cuOYxu0U7DIdqQ6OT/K5slwo9p+cHFbhRnmBL6l1o=;
        b=EdcD8zamiAz4U9FHjL+AIIFL00gzm2lwso3k8z+zRw9qULJSsIGr9pzQRNodcYSmFF
         Gp9sd4/yCbMlyqg3bWZGGhTzO/I7SPSqNjgDYFLVbhuy9rDuXuC3uqg1j43RRzNz8y2j
         PW18DKKYGZnRpmH3uoQYKl/Xn+eNh1lilJNt/k0QbbgiVnvWV84ArK8kjPXf4Z6898Jn
         ZtSikfOf/ZEAAXbrvO5iXCoqdT8UijmdJTz4L+giyzITXHgG6Q/7VGP2w9fqBqjlG/0a
         PjOr/ftxjhY3pJQq1QHe4m94XfXKIQNILLkN0tniufYw2XbeV5RyJYUpyHtu3feLRpCn
         Z9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWvcNXlIC0gWgZhyRLMuuz7D0jRjLDkVqQLrfWtG0w3JQAvYRSzl11eh6Tbto/wxOlnfMqZRaOCANmLhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKdNErNevFPnLfORLUTc9yUl8vFzxuN406E+6JVLMNUAtlq3V
	8DeNfT6CzRejdkm7pt6DxAyS1h53baycwYpaYAtwaV86wQp8vKLBZ1GhN371oXtS+q78FdEKzFq
	5jIFJhKOuw3bWJ5bSt74KeOOfLeZPOl4AUp/0Q40w54A+LX57WYJbueyfS0Ww9Y6YZZ0cM34SRb
	w/muCcIPxfFmzBmni4mWTCVhKIOQ/j1P7ESmWTB+M4UOswt0I=
X-Gm-Gg: ASbGnct8IpLh9IqoEzBVJcRJQzCJdoqfDrhN2u6FxwGyskV+inr14lM5yz0kbKO7gsS
	5VvneFCdycNReDl2G9xQ49VmFdzyk6eGX9P1BETVAM3tFhkywoHzXuIUa8YdVu2giNe2ZJVyT+Y
	undvpjpJLop9f6p16vJUVMWUx2HR4Sn8cpcxlV1TfUZ/l+ztEvppLpNXKbj1NqjkDUzvyPsz1Jm
	SWzJTJl5u1JaLygQdTFhUO2PJxSlZ0dPlnIlQWn353JanBh08B+TDyBfLVg1TcMc9usGNG+oC3w
	+GhROn96N9VPgq5IoGgv8oVB32un3NuG3SG5bpGDqfruI+448mrtMdJjf8wRooqut2HXsj2Jeb4
	=
X-Received: by 2002:ad4:4eeb:0:b0:70d:961c:bb0e with SMTP id 6a1803df08f44-70fac9202d8mr197041846d6.58.1756912559385;
        Wed, 03 Sep 2025 08:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqDjIqsiZca+ggH4RMjYaXqAO0ErU7lwak2EX2JoTANTpehd9a2V8hc1liqn8FqdeAjJJmQ==
X-Received: by 2002:ad4:4eeb:0:b0:70d:961c:bb0e with SMTP id 6a1803df08f44-70fac9202d8mr197013286d6.58.1756912536653;
        Wed, 03 Sep 2025 08:15:36 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:05 -0400
Subject: [PATCH v2 4/6] clk: tegra: pll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-4-3126d321d4e4@redhat.com>
References: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
In-Reply-To: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=5433;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=43sEbwhMVLXr4Ugy2k4lhtQIjlFVPQRMntWIuVLuAbk=;
 b=rpRJizWaPvqeE8fyxaXKWGMOtJvlvuOaw1CCwjSgxH0jKIiYpjpuikcEEp7O69HVv0KF16BxN
 TXt73fGvnjOAYUe30HyZWWwnRS3516J0fBBdhdXNA86DnGkXxGPj02D
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-4-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-pll.c | 52 +++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 100b5d9b7e26e906f71963152ad50bd0a89d14d6..591b9f0c155a033ab46fbb0a1de742efed560b5c 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -840,8 +840,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
@@ -849,15 +849,20 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (pll->params->flags & TEGRA_PLL_FIXED) {
 		/* PLLM/MB are used for memory; we do not change rate */
 		if (pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB))
-			return clk_hw_get_rate(hw);
-		return pll->params->fixed_rate;
+			req->rate = clk_hw_get_rate(hw);
+		else
+			req->rate = pll->params->fixed_rate;
+
+		return 0;
 	}
 
-	if (_get_table_rate(hw, &cfg, rate, *prate) &&
-	    pll->params->calc_rate(hw, &cfg, rate, *prate))
+	if (_get_table_rate(hw, &cfg, req->rate, req->best_parent_rate) &&
+	    pll->params->calc_rate(hw, &cfg, req->rate, req->best_parent_rate))
 		return -EINVAL;
 
-	return cfg.output_rate;
+	req->rate = cfg.output_rate;
+
+	return 0;
 }
 
 static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
@@ -1057,7 +1062,7 @@ const struct clk_ops tegra_clk_pll_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 	.restore_context = tegra_clk_pll_restore_context,
 };
@@ -1195,7 +1200,7 @@ static const struct clk_ops tegra_clk_pllu_ops = {
 	.enable = clk_pllu_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 };
 
@@ -1353,15 +1358,15 @@ static int clk_pllxc_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_pll_ramp_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
 	int ret, p_div;
-	u64 output_rate = *prate;
+	u64 output_rate = req->best_parent_rate;
 
-	ret = _pll_ramp_calc_pll(hw, &cfg, rate, *prate);
+	ret = _pll_ramp_calc_pll(hw, &cfg, req->rate, req->best_parent_rate);
 	if (ret < 0)
 		return ret;
 
@@ -1375,7 +1380,9 @@ static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 	output_rate *= cfg.n;
 	do_div(output_rate, cfg.m * p_div);
 
-	return output_rate;
+	req->rate = output_rate;
+
+	return 0;
 }
 
 static void _pllcx_strobe(struct tegra_clk_pll *pll)
@@ -1598,12 +1605,15 @@ static unsigned long clk_pllre_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_pllre_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllre_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 
-	return _pllre_calc_rate(pll, NULL, rate, *prate);
+	req->rate = _pllre_calc_rate(pll, NULL, req->rate,
+				     req->best_parent_rate);
+
+	return 0;
 }
 
 static int clk_plle_tegra114_enable(struct clk_hw *hw)
@@ -2003,7 +2013,7 @@ static const struct clk_ops tegra_clk_pllxc_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllxc_set_rate,
 };
 
@@ -2012,7 +2022,7 @@ static const struct clk_ops tegra_clk_pllc_ops = {
 	.enable = clk_pllc_enable,
 	.disable = clk_pllc_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllc_set_rate,
 };
 
@@ -2021,7 +2031,7 @@ static const struct clk_ops tegra_clk_pllre_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pllre_recalc_rate,
-	.round_rate = clk_pllre_round_rate,
+	.determine_rate = clk_pllre_determine_rate,
 	.set_rate = clk_pllre_set_rate,
 };
 
@@ -2321,7 +2331,7 @@ static const struct clk_ops tegra_clk_pllss_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllxc_set_rate,
 	.restore_context = tegra_clk_pll_restore_context,
 };

-- 
2.50.1

