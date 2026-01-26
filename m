Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71CA259C94
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454140; cv=none; b=XH57oeMgHUMcGLfeJdiESxj2/VXI8P1BNIneEoWiDrcmRRS30ds3Cf+ujIO3E/eC/ajzfk7MMJjL1isGNwwaBAEx+9CKcq2RGwR5B6Kkt1ikmCwbefAOicAAqRmge9OhsVzdG1JqVe0dHpMlnuNVAulawtP55fQG8Ayl6tGjrYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454140; c=relaxed/simple;
	bh=N4S7jkXRIDW2alJXYuZow1k41/hs/gdY6UyaOt2yIeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XW4X/ajy6cKVBWFzzEcPiozLKqznqJUqxDJBDN6SohX43ut+YU5EDHkVD/AurAEbY8QCQOd75za/3bqZGDVK9Qj66LSWoE4Ox36AfNXKKNonr8yhcOfUo+FXm8HRA+tPvBjqOm4sQMFHtju2WPWg4VtKHC0nsYbHy+KjzqoEgB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i24cszVj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i24cszVj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so54200065e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454137; x=1770058937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgMvPg2r6kNMwzvHnwBKLZfDHcu2zIhB9q+xoTr9MH0=;
        b=i24cszVjJfgBr6iX9s7q3oyMVEwfd+m7kJ9fzSUO0XZc47i/XykhTZvsdDWW++a7WE
         XQpjvuvMVX5ZmgrpmrtRc637NUakG7G5nQHtXwaN02fcGSNrv2t88ezxsDSJvcHA14Lq
         JeKXUBKV7t5hpzkQZ0yN0XYWbXNllq5gazYuXH+1+LnV0da81BbFG1K4srqvwlZZrNO+
         l+prWv7r7KmZKprPgbIdB3Nb0f3DiB3z7x4nNI2EDtP1XtpOkk3p+VsYtH0iakyYtEBb
         ANxOI+DkouKCfCZO8ix6XiV4ohKD+/8VfzN7hmnTxFnJ4uprOfIrAowiIXwlNFG4VnhK
         orzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454137; x=1770058937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zgMvPg2r6kNMwzvHnwBKLZfDHcu2zIhB9q+xoTr9MH0=;
        b=EDYdQNIkv0oo37AXW+MruTxfZDZGRrdkKrPxPt9cp3tm4WuwLU++V3CwlhflhO68YM
         QhBzL2PAOwtQKi5cey3kmHIpADMmEuOOAKH3tXQTZIyYvIE6XDZM6iXinTklf5nct/i4
         K7Il85RWKm5S2OSs7QP5SNVzhpEdh4goUJd+Gmx82Ilot3F/WNihBybWQPlVqQGvxPlx
         L+1DlzUnN+A9c4vOdafL3Ecv5aL/SCY5IlfOru8k5qNlDfbya0QDkc3NBYYIAzYbQxHL
         LZtycfI1c8yI0M3fSxdrAE8lPq4vyzgW29Vwu5CAA9/NJy7iNB6vLKjV72AHHftBWkbG
         3H0g==
X-Gm-Message-State: AOJu0YzPwuMZkJJ6SYV2bgSdl7In+EQWFcC5Sn9kHvMWWOE3eIzhtQwR
	lHzS2WYjNI2OG7Qq+nJMdh9RZZTeSrnLjvQFNjG0pppWfeUTo/tgfZubTWVusA==
X-Gm-Gg: AZuq6aIuyoV4iGTowIXj3tu0s4VpvMEP0Aogot2GsfskcOHRy+gGro4RzR/sZKngtAr
	dLpNzu8dizeCGPCqZZZuUjlGbS4MawN+Ts+s70ToqcPccdjnUC2IgfszthOgbLwK8xeupJahBa9
	sA0BxtsfKdg80zOl1TYGYtDodOF1wottsa1l+K9VJ7l/rMRrGeNSh6XpnvEKF1OC/GEa6LVUavH
	K9ky6dTUWMoit5TgraUkYQiivRxVNQseirI5YddUCNh3zSoYAYUQckyVv4wpVEb4y/H7xLc9qjI
	Ls27SUhXeJRDqV/Pp0DfxQ8/hp4FXOJRcWdz9Dh0SsGoHPF/efzFWCzd5M03IFc6qlpD/vsJcc6
	oRxzLguTY3yeI1Vcs3O8msRiXnfjResdxrK93Y//XDMC6jV3gIZY4PES2US6vbOOpmCfm3YyNrk
	+I
X-Received: by 2002:a05:600c:b95:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4805ce3fccamr81020955e9.4.1769454136998;
        Mon, 26 Jan 2026 11:02:16 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c034dfsm7264525e9.10.2026.01.26.11.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:02:16 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] soc: tegra: common: add Tegra114 support to devm_tegra_core_dev_init_opp_table
Date: Mon, 26 Jan 2026 21:02:06 +0200
Message-ID: <20260126190206.78270-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126190206.78270-1-clamor95@gmail.com>
References: <20260126190206.78270-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Determine the Tegra114 hardware version using the SoC Speedo ID bit macro,
mirroring the approach already used for Tegra30 and Tegra124.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/soc/tegra/common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 6292a1c72071..2264dd38893a 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -143,7 +143,8 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 		hw_version = BIT(tegra_sku_info.soc_process_id);
 		config.supported_hw = &hw_version;
 		config.supported_hw_count = 1;
-	} else if (of_machine_is_compatible("nvidia,tegra30")) {
+	} else if (of_machine_is_compatible("nvidia,tegra30") ||
+		   of_machine_is_compatible("nvidia,tegra114")) {
 		hw_version = BIT(tegra_sku_info.soc_speedo_id);
 		config.supported_hw = &hw_version;
 		config.supported_hw_count = 1;
@@ -156,7 +157,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	}
 
 	/*
-	 * Tegra114+ doesn't support OPP yet, return early for non tegra20/30
+	 * Tegra124+ doesn't support OPP yet, return early for pre-Tegra124
 	 * case.
 	 */
 	if (!config.supported_hw)
-- 
2.51.0

