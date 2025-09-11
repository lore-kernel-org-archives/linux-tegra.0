Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BAF2EB5B7
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583823; cv=none; b=XjYJGE6C7T5Zg8yOJOoIICuaGEkTrTU71kG6BFYs1lEDNYvHEx61aj6jjwYpqfWpzWbpego3exXsefKizn0efKZDgrKhVA/ZYkWErDPVIR+Qb10AE9xcaM9K7BA9q80jF6pydfoeAiEDm10cGu20Ic5P7559jHrzZW1uEFk/3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583823; c=relaxed/simple;
	bh=GAd4svxSVgnkOhIwOQn+NSNpac5IpOx7copCWoIZ7eU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gitnSS3Cdn7LEQkjZXJDzmSaT/y9IE1D8kAxBgfuqd9mN2iixLpWKfX+hPhxtK2Zo3TVlNWbn8iwNbZo8gLOp3G+ConsnlnJyp+txqKGnhoEbp8KXbXxNjMTZ8g2xNYrZnEEJ7vF5q9R22Y0rbYZl5LpRMJLtcRmLKmylGnAEqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOtAJS+t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOtAJS+t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so406105e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583820; x=1758188620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U80QC7ZRGmD2zeYUt/JuyYkH4QiRinpLjt2jmWesQl0=;
        b=jOtAJS+t2JwE/VUyABZnkB0QVB9r3W03lnlnBkJXnxhumuCXjeO8WIbfJ2uFJB1Inx
         M7clHP7qg/dmlx4PmW8fQk2BVClj26fqL2/shw8rs1r/eihm0a0ru/E1RAPcvRMBxy45
         xYe+JpAdHl8geL6n9ZMo6EDBu8twrgR1HtfnsbmIGFBowSwydlOybXPZ2qotJ54kGQ0Y
         V+rOr56u18F5d2XythCHUGrXU11aL//PXp0pRGTIvar8eyC6uDG5KOg4lO9EuuPlRTAs
         ga5U40oSDJdu22YeAuQW/9HvkO2Oyzc0WxwyZwegkT1nzU4h4eJjotRvSc8tt7kU2bpt
         hXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583820; x=1758188620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U80QC7ZRGmD2zeYUt/JuyYkH4QiRinpLjt2jmWesQl0=;
        b=N11F79ol5wRCnniIdv2KMoJ+xnNoJJ0E9WUl8OWyWTl6OtgEFchtZdo6q7+KFguX4s
         uvfn8fX6ZygdZRBCa/DzfD5lc/DgLy1Kk1yAk1rUgiqC75Efna0xMe1CaCn70IPSUGt8
         YPxv1vx3L7IfCgW7nKl6RFjjjhWArdpMrWJMaVwv2yA13rRbRTqX5/GJasIxOYPPD2F6
         od2mJQPCJskSyAbXPuVlzqSzlK99hPcNhtTybeN0fVurpYGQo/iO2TU8xC1YJKyVVG5c
         TYUCucrV7CCnWDYZoTqnHJqLLVWOIHHoSxpldUn4FmX9QCsTzalaYA9gTeTXkzOxRpeV
         PviQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9wrMp7RiLv5L7Nu/Ar23EQ9Gt2+XfS/ipz9pTA1GUuBnYCIkjX/Z4QNoOFfb40Tsi6/xuY9LpNGYDkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCL/5MCcb1x87/VdHx+g7i6axzEKZkfS3tfSqPnyWIRPCVgxhX
	kYfv8B+6kbPRyGuBF0U/bmuThV2lqWR+J8wrfWL4KOvUd6MQp/FetKthvUCAxwxd0fH3vu525ky
	j08J1
X-Gm-Gg: ASbGncstMLSWbnOJjk/EwgaUSWbaMqimET5klIgxqQku3mZ5GdK79L+KCYB5hoUgrP5
	0PbmLEW+LtemdwU4XRGcU0HLiLUu7XrkxhXw5QH1F/KfdG4oY3FORBOLu14/ZYrSpoq6hZW2oMk
	QbmRV+G2zV40yU6ckjHCYZ3MkkyYyx7SU72neuO4nLnej5P71bx3VNP2MxyhHT8xP5vSwg2Z5W4
	Jd88Y1VvY0x/fwJUuMKz2s/M+aT+Smk6CYEX3AY5h0R+tqsyZkMPSqpez+wTsEICTVFmj8CAjnG
	nyfsgSmc2u1xeB7HwbRWk4+IKhmi50YnO5oCHP0O2ySOL517/ND5PO1eDe8/Q+kFyK3KYLDAW7U
	JPNmywjiJNPB1cgwyZDilpGTUAiDZgr64PDVuV6o=
X-Google-Smtp-Source: AGHT+IEh/Uq9AaVnfyJLiH7s3S7h4eHgrMQvqFPZnx+khD3aEY9xCE9DokvzHDxbUHKjVpIvYM7OLg==
X-Received: by 2002:a05:600c:3ace:b0:45d:dd02:cdc8 with SMTP id 5b1f17b1804b1-45dddee9ea4mr85213625e9.3.1757583819813;
        Thu, 11 Sep 2025 02:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:22 +0200
Subject: [PATCH v2 11/13] memory: tegra186-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-11-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3374;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GAd4svxSVgnkOhIwOQn+NSNpac5IpOx7copCWoIZ7eU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm7pEGQ9eJRN63t83Qgfbkb8IpSkIxS2GIRT
 pAlyLWoypGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZuwAKCRDBN2bmhouD
 1wHgD/9FA8yMCbzeCJ2kUBrBApGFPUxEeTzyXQTwodPDGp+v9l0qqfhwd8Wl8UEpouNQgu/rXRx
 DqDp1qWgeGCZzbvfdPS5z/6IM1Wo4ScOa/UlsIZgPLHU14AtW6dRw5AnD11WgNrbd4uonc0d8vA
 1QNI1OXS0buVAtzvOcv9yMkMuSH/+o+VxZm/qOd1ruMgFAjY1kMG6Zh3EHPlm9Oip1IfSGHwIks
 KVr9YfsURMA6hXfcrsd/Zb6/zTPj2TmlHbfJN5koE1+JSIAroTaPDIck5ehB2CIdtxUPJtW2Wf2
 URd4p5a1KDWm3a5tzJGOJY0F2nQqfovwQrUoJOlTVnR4Qmn5i5olypldZqgsRv5wToAwxyxOrXQ
 KgZx7ihdx49OU3H/a1r0dQ24hCrcQgtT/t2BFxNm7Y99IIHL41HNTLMd9wYwBatzXNuAzz5Yz5o
 Reuzzlif+XhkGXmqI9OMvqfmJPlQa7GUfiDC3uTyDyYXz3Z7pzQtiuTc2EIdnYtS069ZFPOJTOz
 ALOLNLqZGeyMBHgcj+cVJvtUCCa3yL4Kwjc7XmKUAD82qDKMMeLZQgcDmPlogg9Qza6luGVMY6y
 rialgVt4G00z0M5dqo5mTfdQ8XTh67Ou/CLssYvmQjxxJEKFp0MIFbMblPlZookpo/XyJR8pKf+
 5g/wfaK68HWpaCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace "tegra_emc" with "tegra186_emc" in all functions to:
1. Avoid name clashing with other Tegra EMC drivers which makes it
   easier to jump to function definitions,
2. Decode the calltraces a bit easier,
3. Unify with other Tegra MC and EMC drivers, which use the SoC model
   prefixes.

No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra186-emc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index a0de80afe3e90531fcfb29d20773aed0d04478c5..9959ad5804b444b269456d1fbae87b4bc111661b 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -218,20 +218,20 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
 }
 
 /*
- * tegra_emc_icc_set_bw() - Set BW api for EMC provider
+ * tegra186_emc_icc_set_bw() - Set BW api for EMC provider
  * @src: ICC node for External Memory Controller (EMC)
  * @dst: ICC node for External Memory (DRAM)
  *
  * Do nothing here as info to BPMP-FW is now passed in the BW set function
  * of the MC driver. BPMP-FW sets the final Freq based on the passed values.
  */
-static int tegra_emc_icc_set_bw(struct icc_node *src, struct icc_node *dst)
+static int tegra186_emc_icc_set_bw(struct icc_node *src, struct icc_node *dst)
 {
 	return 0;
 }
 
 static struct icc_node *
-tegra_emc_of_icc_xlate(const struct of_phandle_args *spec, void *data)
+tegra186_emc_of_icc_xlate(const struct of_phandle_args *spec, void *data)
 {
 	struct icc_provider *provider = data;
 	struct icc_node *node;
@@ -247,7 +247,7 @@ tegra_emc_of_icc_xlate(const struct of_phandle_args *spec, void *data)
 	return ERR_PTR(-EPROBE_DEFER);
 }
 
-static int tegra_emc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
+static int tegra186_emc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
 {
 	*avg = 0;
 	*peak = 0;
@@ -255,7 +255,7 @@ static int tegra_emc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
 	return 0;
 }
 
-static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
+static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
 {
 	struct tegra_mc *mc = dev_get_drvdata(emc->dev->parent);
 	const struct tegra_mc_soc *soc = mc->soc;
@@ -263,11 +263,11 @@ static int tegra_emc_interconnect_init(struct tegra186_emc *emc)
 	int err;
 
 	emc->provider.dev = emc->dev;
-	emc->provider.set = tegra_emc_icc_set_bw;
+	emc->provider.set = tegra186_emc_icc_set_bw;
 	emc->provider.data = &emc->provider;
 	emc->provider.aggregate = soc->icc_ops->aggregate;
-	emc->provider.xlate = tegra_emc_of_icc_xlate;
-	emc->provider.get_bw = tegra_emc_icc_get_init_bw;
+	emc->provider.xlate = tegra186_emc_of_icc_xlate;
+	emc->provider.get_bw = tegra186_emc_icc_get_init_bw;
 
 	icc_provider_init(&emc->provider);
 
@@ -354,7 +354,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 		 * EINVAL instead of passing the request to BPMP-FW later when the BW
 		 * request is made by client with 'icc_set_bw()' call.
 		 */
-		err = tegra_emc_interconnect_init(emc);
+		err = tegra186_emc_interconnect_init(emc);
 		if (err) {
 			mc->bpmp = NULL;
 			goto put_bpmp;

-- 
2.48.1

