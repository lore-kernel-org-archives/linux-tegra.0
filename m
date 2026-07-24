Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40853EDE77
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883866; cv=none; b=mnhqqw+6Jouz2O53iYILIGTQwHr+E2xiN6u+VB9/WoYoHAARQRwZlpK82x1tqspb9Ww+TtzsJpecN/Oq4RxFeR/CqNIsW4nkmXbJtZilY4iKYVD2MXMnruIPVdwhK1dgxgvW1CSgb8BbQI3IEb5iaUO2ZeuE/jmCdVWzBEtzHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883866; c=relaxed/simple;
	bh=8ScTk5smx7gkl/cV62c2yigppOTQ+FIzCJYYFT90JYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElLr5oGtkUf2lhGw/2qufOlD60ydveRgNOfljRMaFrejOJHBNSwVYznLzSMTn2fYF2c+c+XqpMhNe8dQGJd/nYwD4XEYMz/cQUPQBV0Hxgmrt/XHDDmAYoC2RNQv2ltt8KPtNrAIDWrqquoIi4ZLA1rSftMreuky72fPAClS5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ne+Bwedh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ne+Bwedh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so1763425e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883863; x=1785488663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHnSuBWNbpbTyZdc+kGUK7XSKGZJQ8XAkxJmAT7v10M=;
        b=ne+Bwedhx33IQfIykl14dOL6x7paZlalwvPuUjfpUsMS/8IRmgpSmjJ4UtOkQTXBIL
         7z64zpXSLIa5q8xCV4du6jHzgcp+IsWv8ZahPxEs+EFuzW7O/K4hsHWX4PVt4arb+YaV
         SGx/WOv2AdJj7JxjVlfigD11rR9dJP61fjIBTMg9nGcWgkAH1BWSHfNEqqmZQbe2mE47
         /jvyO0rl81uGQ0gNTrOx+5Nw92ACoyB14VfoT/imNHwf6XapuE6uZX6r1Pw2rmwUXxK3
         aaAANKUnV2LgCU0H8zX6d12xACHa+fXnDSymLqQewti5AgbWBy+1kDqEKUWXZQi6xqhz
         Fzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883863; x=1785488663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHnSuBWNbpbTyZdc+kGUK7XSKGZJQ8XAkxJmAT7v10M=;
        b=W2VqHWtO6j3hNjHuhUd4CymU9HFyThqg6C1+JIkBue2lK3vR9DNrtuLiM7Fh09PutN
         C6q39g3fVxITTyQZs886rZ5+dU8ZNxx3NnWJcu1n+3Kq8mjVmxzJiQZiDvOAtVabdpN1
         wMHRtbQdoXmOJKRvYPvgXOe+J20FrAnuoNa2s0T/gW6ltqu+Ft51bspZ8maTSIb2MIlo
         9dOt38HFpn99idxIvr3rT3IdkPQv7yQZsLXpuM5A/+Aet1TPm3ITKjK0LwbdPaExFHhg
         PBfzp6JkV9BbelQfG5OStjkMrm6iHtg8HBpoW3HP10GVDXpgdVzL6E1PiucWLdMUVUbs
         NnLA==
X-Forwarded-Encrypted: i=1; AHgh+RpSLPDuWQChdlhELouB/RZ1x8dPgYI/D5LMS1SbYE3Nb8VuRWkAsDWLFJ80Fp1dSjO3KEehRtZv4wAKhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwANcj7fGVj8BBMVIEcQavuOSLRsM1KpWb93oR9dLh6aHYc1l0U
	vOh37VnfPAMWCVN7flyn5X4vY09nejz0SvWW6MQjB58kSYhtd3jmRUP0PsX7fojUzfc=
X-Gm-Gg: AR+sD13wkOxjYqS2bQcoQMOVKDhcp5URl2Gf+8fPIsA+xZUXTZQmkLesA3jP1N66YO6
	4p3bbo8Uj33LQCQS2DXC0lnTMSs/wQvrIlX66xNDHsrutYB9mALJt4ROTMA7VnLlYEfzk3W9vGl
	eor8R79oFlNN8OyVqeA668cBc2wjOyKEI0O+XOaZSh9XFSthqHdAzUdnzXLMLOx9Yphxncc0nuB
	DdKBKNsAZxHlyQMVOWPJKJ0G0lJY5Aa4LK4rVGpUzdGsNdfuVo/4yuRyzC1whn6ZoL0gxuplQFS
	UHUy+QL8YtZy/NHEQX7YYjNLKISIQgZuNdPoO/TSMzUtu4pS86jsYXgilpavaQnJiSDYTmKBbyA
	PTXSbFURDJGuZ9/j68FQuq2gkvyaKFfsVQjlcx6AtfS9PcVJTwrNNhlzdO2uzfz3289fMNXDe8Z
	Gz
X-Received: by 2002:a05:600c:5942:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49573cf0ec2mr50589315e9.34.1784883861704;
        Fri, 24 Jul 2026 02:04:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957afb4e48sm56146715e9.13.2026.07.24.02.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:56 +0200
Subject: [PATCH v2 5/7] clk: st: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-5-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3497; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8ScTk5smx7gkl/cV62c2yigppOTQ+FIzCJYYFT90JYU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqBKY9/Vk8kDgE398fs0o059XkEvxbFDk0sc
 0pKxCS2UE2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgQAKCRDm/A8cN/La
 he3VD/4xcO2E6eu/4/OSXYGa7ndR/i5CWeM9fueSz9wfG+wRyrWEUUaO+rnqwnI1gajCZyEFGc3
 lrU2E+AlDn2a4Y8V6x7kWA2qkMV0jWm6v9aIN7PNqscHa1ps2NMnYCwIdJTDFbwp177j2mDf5x+
 nHdtLUMoFs0y42p3Tv+wg7SQ723imZaR/f/oUgQlLk3uO7l94PQDgI7w74VeIyYMxz5yhVnID74
 6kxXBzfkfuEI+QfGLXK538H/gYeDNRkr36r78UPmD+6ESFLDTiYFsd1s3oLXcYL+qIGMVaXHQqp
 2lSyciBUSIavwAvhDlkWoW6CNCrzRgiW5OjFedzsQS7zYynC+DgjCgskuhjTRjg0IyYS6tZ2+s+
 AJDXpBIEMOiXimegNz//Pq8hXRia9Y4WoEWBq7LD4qvTGiMKee5+xaQyeVstIObFsBIzxQBuJ+k
 me9loWvo79YxRs3X2Rgs9e91OiIE9TTtwMWgdTCYPQgx21ZuiYdxVeZETunwKFIE7XEOX6QNEu7
 2U5n/3SUr1+jp0T3YdDlW0rYPvpgkLSSf4FXWI0Rn5oiuaNejA9bmWtwqpixcWAJephSit/g6i6
 I1EfAGP3kaJ/LglQYCO0b0cJt9qrL2XRipEYQdiGKUZcmtYrko1tUcwe1o0EPmtphuD+4WMyP7r
 86NGuAW7RKxaWLw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/st/clkgen-pll.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 9eb2cb83fa69..17551c6a879a 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -260,7 +260,7 @@ static int __clkgen_pll_enable(struct clk_hw *hw)
 		if (pll->data->switch2pll_en)
 			CLKGEN_WRITE(pll, switch2pll, 0);
 
-		pr_debug("%s:%s enabled\n", __clk_get_name(hw->clk), __func__);
+		pr_debug("%s:%s enabled\n", clk_hw_get_name(hw), __func__);
 	}
 
 	return ret;
@@ -295,7 +295,7 @@ static void __clkgen_pll_disable(struct clk_hw *hw)
 
 	CLKGEN_WRITE(pll, pdn_ctrl, 1);
 
-	pr_debug("%s:%s disabled\n", __clk_get_name(hw->clk), __func__);
+	pr_debug("%s:%s disabled\n", clk_hw_get_name(hw), __func__);
 }
 
 static void clkgen_pll_disable(struct clk_hw *hw)
@@ -405,14 +405,14 @@ static int stm_pll3200c32_determine_rate(struct clk_hw *hw,
 					&req->rate);
 	else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), req->rate);
+			 clk_hw_get_name(hw), req->rate);
 		req->rate = 0;
 
 		return 0;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u] [idf=%u]\n",
-		 __func__, __clk_get_name(hw->clk),
+		 __func__, clk_hw_get_name(hw),
 		 req->rate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
@@ -434,7 +434,7 @@ static int set_rate_stm_pll3200c32(struct clk_hw *hw, unsigned long rate,
 		clk_pll3200c32_get_rate(parent_rate, &params, &hwrate);
 
 	pr_debug("%s: %s new rate %ld [ndiv=0x%x] [idf=0x%x]\n",
-		 __func__, __clk_get_name(hw->clk),
+		 __func__, clk_hw_get_name(hw),
 		 hwrate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
@@ -547,7 +547,7 @@ static unsigned long recalc_stm_pll4600c28(struct clk_hw *hw,
 
 	clk_pll4600c28_get_rate(parent_rate, &params, &rate);
 
-	pr_debug("%s:%s rate %lu\n", __clk_get_name(hw->clk), __func__, rate);
+	pr_debug("%s:%s rate %lu\n", clk_hw_get_name(hw), __func__, rate);
 
 	return rate;
 }
@@ -562,14 +562,14 @@ static int stm_pll4600c28_determine_rate(struct clk_hw *hw,
 					&req->rate);
 	} else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), req->rate);
+			 clk_hw_get_name(hw), req->rate);
 		req->rate = 0;
 
 		return 0;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=%u] [idf=%u]\n",
-		 __func__, __clk_get_name(hw->clk),
+		 __func__, clk_hw_get_name(hw),
 		 req->rate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 
@@ -591,12 +591,12 @@ static int set_rate_stm_pll4600c28(struct clk_hw *hw, unsigned long rate,
 		clk_pll4600c28_get_rate(parent_rate, &params, &hwrate);
 	} else {
 		pr_debug("%s: %s rate %ld Invalid\n", __func__,
-			 __clk_get_name(hw->clk), rate);
+			 clk_hw_get_name(hw), rate);
 		return -EINVAL;
 	}
 
 	pr_debug("%s: %s new rate %ld [ndiv=0x%x] [idf=0x%x]\n",
-		 __func__, __clk_get_name(hw->clk),
+		 __func__, clk_hw_get_name(hw),
 		 hwrate, (unsigned int)params.ndiv,
 		 (unsigned int)params.idf);
 

-- 
2.47.3

