Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AE3F20FC
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883869; cv=none; b=sVAgoIN+3HSkS6c2RUG4/IOVSzqq8diYFwTbn7E71JViUo47y3ln+U/+W3fY4vCA5N1da312gzNgELRQoVhjboiDTRYJQ8sbCPhymMgQ2khK0284lVEQAMgDd0YrhP1yfctB6dGkgc+l2LGc8pYNc6n+0/pegYTZIUpl+ZtA8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883869; c=relaxed/simple;
	bh=qi2V6YqGjc3ox5XSg9D+PgsVQmlPliMSkFPKWxRHUHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJQ2fKD5+fghbozUB+g0j2BS6TrTb/3dsoXaVIiiWcG3MXu+1cAgupvRvd5WIaI6C66pkFwC6fvwp/XvoSOxA4wb0bUssACJSFB1pMFcd/tk0VraUV/eTt+YrKbcJwYYF01CV/TmoO79k+XW3IW24Yj0tiGu6evKhBlrMf5eML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TgZisXPe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TgZisXPe"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f707e5d75so165219f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883866; x=1785488666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=;
        b=TgZisXPed4rf4NaTDmrIv0D/YcRccuclKTPYKRiObeZZDz/DnWPz8+AWW4gKZR+Y+j
         niS3eBKV8x8Xz8JXpQQqlmmo4+NnE168XLCGRcrTMqcocxg8fXR6W5C1YUp7anWjVZg5
         vstue14Th6IquO5d0gdntuwrJyvW/QHfYoKgE/y8GY7nQeVapOJZ6FNVOyEBHRa9c96z
         QLP81qhGtx1EUcLODxVkj20vYF1eBnfzOy/lkhcOTG7Fpey3SYFn2iTI1yJuWMGhOpLu
         NXaSiUqFPTPktBMDU2HSJe6/RxEpRc1/vNLhvtkrs/4rbtxMw8oc9DqzybPsGfOaV390
         hkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883866; x=1785488666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anoKW8qvKaE42kWsvt3mIJI+NxZdvkAtfEA51BXm644=;
        b=Qj/z8HUPY5bLGvqD92E4A+bzmEfe85SkrtxUk8LxH8A1XI/gylcXdeAbM5TT8YmejH
         NEZqFbvoC/gzGI5MVot151dcZc1HFFzNFbHVywdQ2FksxJqzWsjFhLF3HWFphn9GhdAx
         o4NSPrStArrE/OP71osjqn0riG+8YgaLjefkih58rs5wW4HVhlpVy5uXdH0HCaBr4dbV
         e0kVOgYobbv5HuoRN1qM9/v42Nji/Pi7eHPR1wE9mShW5v1sFgGL8R/oI2LGuFSSYPTq
         bbtxalaabQk151yoWrjs2K+FB1LWJcscZi1t1WszCeYClD4DCrbVapqE+AMgyL9S18Zs
         QUjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rohrj+iCp0XRcJ6G4LwbEEJwF87Vqjzix3cvzTKPcETG2U7mnOm+KH8N1C8l/5AvcgnllP6YLJpY7pmrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0S092CqxuhlhCXP/nMzfXEboP3h9xr0rk1/Cewn3chb0Ttgy7
	14eW4S2JLRX68ajHFvLaCC87iKJgWyKmOJrScmwpXGA2u/TQIWAfmYw1s7aHxTRuW5U=
X-Gm-Gg: AR+sD138y3oVNjG9y7S2Q2tUdGBrrF1Ij8zS7CG2FhwDFGEHLc25VE1VTB8mLmmSDXX
	FYzSjurMcMOnLDrSDS1lJjD2/71n1a2LeJ4WPfklIdMziHqrgnTgRb+fLEOc8WhyJe3EFGVs4kQ
	+LA/lfMFa4FiooozdNTxLqJUww42wOvLnloRb2PYODoi5xRgxsXVocFBluiHoDvpcCc4Yi5VASd
	w3MULRSuKA2qVjU32/iMjxpYCAqrU0/APtNxK0YLmGaqfedeI5aznw/Q50mZkQ/qjU84GLBI1A5
	AuOZtnUtVtxW/QNV+1Tsc6qmYNGLOa8bPD+DGraRw07Dh7Uc1cz8V6a4d36nSg4lJ0Is41excQ7
	53vaEYAzuCFn2E3nAj9r0AnHe0E4qvW7lybZLluCsVwVvOtzY8hiPuS27db4ajZxmpIYjMpihxE
	dB
X-Received: by 2002:a05:600c:1990:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-49573cd8927mr70665895e9.20.1784883865686;
        Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957afb4da8sm50979535e9.12.2026.07.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:58 +0200
Subject: [PATCH v2 7/7] clk: ti: clean-up simple provider misuse of the
 consumer API
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-7-56f306156d25@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qi2V6YqGjc3ox5XSg9D+PgsVQmlPliMSkFPKWxRHUHE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqD8X6HJICJaogPLmVW5ml1R75cJutw+gfiJ
 tB0/SaVRoeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgwAKCRDm/A8cN/La
 hZKDD/48CqDz/QRWxvqQiZfXQXrQZ+Wgc2Ef1vVKm04mZiagVtEgtLY8z82Jakzu+XTZ/upstvz
 xSnqrHDzMM2PT/UOqYhUTHR276luuahMFc+5GHs8qgLWSI4K6l1qQpFASzrkFMJ99geCBuSUUkw
 BcC1TcEoLVUZQxMiXPcKB9ZpJkpXEl6c0Iwpdblk7tIihwTXYWc4GLLUzWezJRfgtOuVwc9rVFJ
 8DomqHnipH4Gy56+1W+dWpiNzNXBjL73LXBFhsmlE8aNInLh7EjAGT9bAl8WES5M2ygH2BVuTyH
 BTfCvbPSIB+Janl3MVM/dTv6F/omRpFnOLIBrQtCTdHYGjTkRMJipWghoIvNYAY1fHORlsuyltp
 Ag04g+L7BFDYrlqh90BKDEWELW/DVl1FlzaMR6MAzFyiJ7Ubm2vaUgk4mYL+JnLMB93sH0TVJ7G
 ircePpHwwcUwnjE3cefSvi4pCtmxVrbb3cqGlmjG7fmg5Up2aRTnHHdbzXvpwYFSlYnhHNXfweJ
 0+ya2NqXjGjy8tEODN4dubBw7zAnxm0i+5ovlTpEJaiHLqYet0Inqc63sWoAstKpXL2pHo/9ZUS
 h9pjOdE/2Paxlah/zqAGJZBfh0+/EtVSCbHz/ikGAMSEEjMMkd7RbIiWpBjguLYslB7AnsJ5WiB
 BEqFaw6yMp0mO9Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/ti/clockdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
index c897ad7e681e..aedbe78bf1e4 100644
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -104,7 +104,7 @@ int omap2_init_clk_clkdm(struct clk_hw *hw)
 	if (!clk->clkdm_name)
 		return 0;
 
-	clk_name = __clk_get_name(hw->clk);
+	clk_name = clk_hw_get_name(hw);
 
 	clkdm = ti_clk_ll_ops->clkdm_lookup(clk->clkdm_name);
 	if (clkdm) {

-- 
2.47.3

