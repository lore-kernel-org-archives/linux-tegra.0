Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0374D31A059
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501069; cv=none; b=r2Z4Ner+Hx54GPPYE2d5gWr+QFFx+ho1IGJb4FbY+Oksv89N8XhohbKspDZs9K3AyZfn0J8rRI5GbMWLIILHvj4d+gdrHqrF1DDS+rCJsyk1o5E5t7TwoeHe1r5K7MNtk2clhsKryvryuKC9M2SvA5l9SiElLSyOarFPt6Y0gFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501069; c=relaxed/simple;
	bh=Wq0vuHhTAJlaPz6HkeacWOsQOmTgXgsMsPqpxkUBtX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/s7XtnmL3uaoeh4W7fE+4FpAeSo0pR1ZzT+rZArik4JneyDZ6P/AcU/kGZ/Zm5pNBZJgdwUmARHW873wnEeV2gFDVQ4HYJnrjpv8r+hJfT3oshyP/uEfaZj/ROMMmI6RsYPG5uZukvJapH6/drHuZnkDdiT0GG/GRbKrTkG/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiiutLdN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiiutLdN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b0413cda0dbso123453266b.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501066; x=1758105866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sk0N8hWIhOaA0zE24bk/claWEtHXKITnd4Xgk+Np0Gg=;
        b=qiiutLdNnJwSYh+F4T+QmXsA08RwrsqfxgcPtgUQ0YI8FdL7ePMImnUJ2ai+UNwxgi
         C9q+GkgRFNO+ySBglfADK4jauuvEgv7ZpUlXPlqQhEcDHwmuxeK0DkVCy8vRsNR+f4HY
         ++zEHDuPHE7r+Fzg4wxyZLZplNU6eMed1j7EclY8l+539BIHIko7Zvpa0wsQ+V5DFYIy
         m4FzUTqlDONXJoFeJWPXSMWdPwdYKGlG/1B2h8g+1eBB5bO91PTbNImKjDRJuSF4FR8K
         tqahKdWkufMhWWwaEvKViaJsKhHSpaLa38PYBB7GGJp5bnyuyWXaMYswqppqcFh6Heif
         H5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501066; x=1758105866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sk0N8hWIhOaA0zE24bk/claWEtHXKITnd4Xgk+Np0Gg=;
        b=F4lxsVBW/IfGkD94TdAplFkzU60negZd5SEPtgftdnGZGAI4Rr3E2zhBxSFn8VLl3K
         XhSYs+edByNJ61fhYGsdNJ6fh1Jx1nhZehJJ07xkCu3lPrno4HMQhu/Y02HYT9aHI6BJ
         4zLjzEKI6jAu6xeOgTwurLJsiLSft0TY3AzY2JxNZi37Mj1DA6++IWOmZwcs3UTwH51b
         ntoBDnmWWGsbeDV/Tkc91v20cyUqWQ8KNWdMrHJS0BH1QUjeil5f3wyXAfRs819TE9BZ
         Lc3OEpDOw+w8BtWwVDiiaLmOIZ5jdbda8UgFUksmIYo4zQN8cqGuNRSYJkm5GdVGa/Yg
         /f7w==
X-Forwarded-Encrypted: i=1; AJvYcCXl6W1nPHrY12BGeC3HLwocMB2yfRCdajgNgqA44xAGX0Ejs0uSIP/CYp6aP+JzjKcTKMPExsSIpP6Nvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwLwEHA70TLjDRDeVQ+k+RH5n93pqZXNEq0if8nJR+K6fQoQ9
	Ir1q7vkwTqWQJBAL8wumZsXWHghEFOU+7KlW1qIBtWX4LaPx73/pXoYYScmvzWah26DWjZmGZr8
	cAYd4
X-Gm-Gg: ASbGncuK12KodqRT9xQJoiByzValJh70LzgQUlwfZtZI0cwPZWVdi7ZEFj70c5d2Bhb
	NnDzldr0UhMx62knh1oqlt9hmK1H1dgNiFFzVJEMWRma19qnzXraoDedIqx+x/vziPYe1Eh719Z
	fRs0zMtBgkoBNz+zHKa1BYQQmrTO3KzCppC8ynEzkGqIB6QX4dSdMysyky3aDSRUwJBKg3p6lUF
	bnjGLzJUOEx248Tpbiz0MVjjUEFkjCAINbkv10X9pSqOhhU0LhMf8NSDOP7quKY8QwISdWN9ueM
	Lf2nkYlNZW4VdnRFWr3cRZpBhDIXNbmHBzAZibe/Wsv6zZUI2UVfDV07kLeSfFdiN+HeYicKuBV
	g2jhf208ZAu2JYG2cwzkmuSpSRXVp2HH72QVKlSKHeBQ4vAg5Nw==
X-Google-Smtp-Source: AGHT+IFcwfWKWYZW56frObvDREjVKz5uTu21j6RaZXvJLRMYEJI2JkqVO8Se3R+b4vV35iyYOlqO4Q==
X-Received: by 2002:a05:6402:520e:b0:61e:a890:aee6 with SMTP id 4fb4d7f45d1cf-6237a42fb5emr7068174a12.7.1757501066334;
        Wed, 10 Sep 2025 03:44:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:07 +0200
Subject: [PATCH 11/13] memory: tegra186-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-11-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3374;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Wq0vuHhTAJlaPz6HkeacWOsQOmTgXgsMsPqpxkUBtX0=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGjBVnjI2IvsYqiYyv0pRCbNw1ssBZQM2iUs4590HSHcaqjXi
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJowVZ4AAoJEME3ZuaGi4PXIogP/jri
 eTvg8lNymEqXda0LSA2MJ/fWzDkAgvrpc3hUt1Dp4ziZ2CtujieSyZBnriJFHI6BBgtG8dQ/vV5
 P/XOybdwQu1XQxT/6aE9IFmQadK4QJRpi++DeB+OQvGLDrKtcDZVCzrVhzqTcfCA+vjEFbmK+Vu
 q8QxvCoez9BQF2XgASjdDD9B4WfQCAmZtKKp/8em+mI5RZG/DQPHsEDbeu3SmLWQO4e7GsORYPt
 K+JAGVRto+BsoT7TlwBEYPk4OCmQj5pW/V9hcpu2mnR9pX23JMU2w4hnEOhWZwGh/Xktzm/jn3M
 FHeogvttFWb86SOf+yRGztM8KSvSa4vy3NnZvF/pzA0d4giLAmyb+wN63dlkngQObm8X8xfpJDq
 KWXpnb1uNy/LKsrmtcNPiMoKEzI+Ttomy/Mxlt+runpVeqkDhLRMMt4y+qKu6mJwUN3KzliYyXy
 dBVyLtKzF8CGczDljsn1iazYmDvwUBH2GbyJX8q9dUZH9t4Dadh3GsN54f+aiJlxroxchHKqlmG
 MHGCIGHuKeUsJwO5v3E8Ps/g70YE1/+K8CmYTLK83Ivo2qnF0dgXSqdta0w3Qz3mwDK12qF/zN+
 YTCMwo3ct10GmjTeJhDktW249YCgFk9NWnX5VHzzXE/Ci0AA2v3MfC8OfzQX09LHwUyS/IVKbS8
 WhJxX
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace "tegra_emc" with "tegra124_emc" in all functions to:
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

