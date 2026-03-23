Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B73B27F9
	for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274585; cv=none; b=uHK2cf9KhhjZ8pgaht2mw9U8eM65YEdXzmL3f7trIg2CGX9+EW1o6S/zVKapuJTRm0d+T3uufeV9WtIblXxc2OSb504dT62B20+tJ//EPnxtqdRe8pPS8YgYOF79Ygv8ayOqr4HIermLTmhX/V7VPfrfPopRuZ0YrHZt6Vk8fEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274585; c=relaxed/simple;
	bh=74nU+p4AvwjOMMyaJKS8cH28y3pbGWscg6d7b4xTKtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3UkWfl5uB6hiMoMRF8lHQvqfmV8giREDe5vpLURT/C8/XpqNVLaC2EuZJWHWRIwbJNE0a7dv7FqcAoZg4z3I4oneNE1t3Bifnd5mF2jZL8qDOVHrffSC3yEMqVCfONhul9sGfiTgtOFIBXhYGGSWmDXeGGPE4YKokm4VQiO9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1xGzdxl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1xGzdxl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so3943236f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Mar 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774274582; x=1774879382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP2z4EeTIErAA0SCjA9USYIYpOzE49JnT+Yi7rCFLbY=;
        b=k1xGzdxluxr1LoG8GVK1bTURerq8V+XXte5dhkp8eZ5eoIJlI1zbNfeKeveSKTuS39
         5nWgwrj5gtvtdP6W9TKk9NyA/Sc/3ytTD0VmRWWgDmqE1A0sJl/KfeJV6RTwypepH0Wn
         4jnwLzJS8b9SwT8gYEXTnslmrXakYNOBen9LHI4TgrB4VSyknXty6jFshpQC3TFWSiMk
         Q+P6o1c+3XZsi0PXRzqOoxZKaahyZl+FEPI1jleuehk8xVH11Z5sJEpnmWaMdeG8spDA
         UTRAuhpQWd0B3QwlVlJwylmDZkqjNhI2JPZkF5ud64cBzcboVvUXMWinQO4aTMjhGS6m
         ZG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274582; x=1774879382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XP2z4EeTIErAA0SCjA9USYIYpOzE49JnT+Yi7rCFLbY=;
        b=W7SCnrickuNlgKNSs6pSoYb+7ytSHWfw0XArm+4FWKc0Za1sjtJaOtbZFdEXMl5+Ov
         Z8uWzaxmxxoiyFjJ7bmqL/fcnge9OuQq1AWbtObPb+4y4YqtllNWt6jdHQbwEH8lmHV1
         0snQvjpvMClz8Dd7sCj7w/6FB8DZ8C45hymBwW8gBPmj0qCMwL1ZW8bhxkJ0RakGq9/1
         5LSmyxa1pIZvnB86562WHiJLB4rmECr4bpEJuiqK3ICsvcaS5W00AdsxHl+dmIFGv2Ln
         w/VuIfA608z8AfwaXdLVJXdVPFBDNcx3iE6Raa1anWCSh+stOjJq5wt799yvfyCCsSPr
         WUnA==
X-Gm-Message-State: AOJu0YzGzQWRCNumvgJwb6/9dwsovjvAviir/nlsbHTG5cZshVyjNHRh
	W76PYLhcQmWgtFxYzbkBnlbwGo4FquQNSZXCq3YRU4I/dumn0ebd4/4Y
X-Gm-Gg: ATEYQzwgossoYkAcQb8EOu0H4k6UVz+/+zE+3WSe4Ro6QH0EPKtm6ha3TYSJCSXzwTK
	ibcbb5ZvmMGrJBI/YkzShaM0zC1iA9kKaQFBRkyIzv8kcYR6cXPpse0d1JeSuRnbieST73CPSau
	+PJ25DFJLCFvwVEvXEza09UTyg1ncJAkUkE8KcCK/b2EDCaf25tuphQz63VvRQ2bvI0hlV3zHvt
	g/kILP7XPf72we/AyDJ0cNY6549jfiC3NG8JbdeSUbQUCSZkAFsq6irYyJgiBTeRWREQEF0kHwX
	DvG49Gdyb5Hqb6eBCQ570QWwuYdZzLf4hqQoJk9/zFRn3yZBel1JTnNGxLEzQbNkJqws2DXoE1D
	svu+OIVAoHuR1l0+alpf1fteTGxjvkpp1be8/YF0jhJcHztPfa2pVc5JhuDj+iepOw+oFUzD+Kv
	BLt923oB/6ulqDq4FgxwS3zE/t/kU2M8UIQdtxQiJDnmc4YnohxsDoN2q91zX3Nt5Cjg==
X-Received: by 2002:a05:6000:270e:b0:43b:3c32:d901 with SMTP id ffacd0b85a97d-43b576fc6bfmr18592076f8f.11.1774274582040;
        Mon, 23 Mar 2026 07:03:02 -0700 (PDT)
Received: from arrakis.kwizart.net (82-65-38-83.subs.proxad.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm30440010f8f.20.2026.03.23.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:03:01 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] usb: tegra: use MODULE_FIRMWARE if SOC is ENABLED
Date: Mon, 23 Mar 2026 15:02:49 +0100
Message-ID: <20260323140249.173603-2-kwizart@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323140249.173603-1-kwizart@gmail.com>
References: <20260323140249.173603-1-kwizart@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to reduce the size of the initramfs by only selecting
the related firmware when a given SOC is enabled.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 3f6aa2440b05..5587302a69dd 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2566,7 +2566,9 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) || IS_ENABLED(CONFIG_ARCH_TEGRA_132_SOC)
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
+#endif
 
 static const char * const tegra210_supply_names[] = {
 	"dvddio-pex",
@@ -2604,11 +2606,15 @@ static const struct tegra_xusb_soc tegra210_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
+#endif
 
 static const char * const tegra186_supply_names[] = {
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
+#endif
 
 static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
 	{ .name = "usb3", .num = 3, },
@@ -2681,7 +2687,9 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	},
 	.lpm_support = true,
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
+#endif
 
 static const struct tegra_xusb_soc_ops tegra234_ops = {
 	.mbox_reg_readl = &bar2_readl,
-- 
2.53.0

