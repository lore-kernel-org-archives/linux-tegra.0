Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A038F49A3A6
	for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370189; cv=none; b=U9n9iJ3k8rW8CwuYLiOcGxTqjtuRSHIbQdbiUaQYHMAyiILB2eBVs49jU3JzsmnSqsZXTI17TJ3fe1nkYPQ9qHEHe9TNGuQ5uoh8OPF2ySDZMt38lpmXfwAv5vsmNxNG1tV6dvBQiFXTr+MNDcB7VK6h+YMKG8DKQDX0hVK+6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370189; c=relaxed/simple;
	bh=xgVe3/5ChIxKHbtLau34tuV4XNPB7x3ojPv2vZnUFME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9H5c5wo6Ziq9UsrL13PadnI4LjE9ytF63iRI0Bn4znhOl8i9YwUeHeoc0SiKg1XeUrWEldXw0CKbZzrspUtySjBGrZEhmZIkp1RW862c/XKD5x6arrVXh2X4oo1DPB9n3sFSTor+29VhfyiwhVhl/RnmoWzxx8axRWBo7Q7k+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvSmA0FR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvSmA0FR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a706146559so1441891a91.2
        for <linux-tegra@vger.kernel.org>; Wed, 07 Oct 2026 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370139; x=1791974939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9e+3jmJX4LTPI4etQxzprcCTZVbd6Ws0ithfkyYyE0I=;
        b=nvSmA0FRbXqc5/oDtGDkyVQO2bdR7TsiVdpsoxGLZPTz6odvbFzPXZQzHY3Z5sn5xu
         q1zKp/Ka8B9UXy4KcDDj3itHeWCozt8Z4P+IWDl9fKNKUaDOI5qHsSncYDpNM2OEHRRA
         qngdQpPrnyDnLQhgOMwYFYm49YW4lP0EC9hVB89yf6VJIw9LBb1gRNjI8/UUe794TsOi
         AS/y/jC6jq7diW8pOOOwYry8OohSMsFTxUjxbAzipZ3zoYxg+tnbgHR3wZVN9sfsIe2V
         NAeANelQZcKSF0ha8hn+Q199eyagBKI3CtSwfpm224sMx+v0QstSB6VRI5B/IZDe9ScV
         aHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370139; x=1791974939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9e+3jmJX4LTPI4etQxzprcCTZVbd6Ws0ithfkyYyE0I=;
        b=Lg4Fv1zdZhHz7UBAowO1JwIrvsPBqfG7+uu/L4stzgx4KRsRgkNy+UVdnZ0476ghQA
         ikjbV3mRS1tqSHoSAR6iWFc6HGwGpwxcvYlq3mr16FK7+l1Bj3n0P/jebOQGMlsXtX6r
         oRU4S11niWOCkEK66TxPkgfT5M+kWUodlq4DR4B2u2jOVGCyN7+KAlSBedKuRp/wLnCd
         QrGb9gajKqrnIfk0+AUAPXOqB2/OlKFWegxKdaQyg+l7uyFXVCXrXWZMKdauu8I6HiBC
         dubdW48X9tO2KEXfsjMRTu3dcPfmKUOBG6BnUSgnKdcF1wD34WEykbtaO5kfga1LrIN8
         mNJw==
X-Forwarded-Encrypted: i=1; AKwUvBxcIlnlWcBSzPBgXf2BHDqBQBvg9rQWv6nKQGetor0noGFVJbK8oS3r2tsjiNbRpJgiuomMyDVGGvPoIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4F4ZUoBOb8GiFabLM0kcWs/6/oreL1xyylB+VQgVJb8A3sJiY
	mduWsvwfiI/Gw6ixoW+FFV2NNxTCl2AFhC6NWyDj/QmM6DVvhelGMBn2
X-Gm-Gg: AYBFou2OBDFYBqW8V0UOldvbOWWNihHKAxxA7OOb+sskt3nB9uh2BizgZRVAHt7PIVK
	wCtqAy0SiV+zsbaMcC+D1fvETmOlsSfQ5vNLdqrej4pY8c5w3z0OZulET6iLi47LqaNNx7h5TIk
	85AbmpTl1RIWHDXLNCQiP+CoMQ0lISYdardQPN4iYsPwX3l74UWFt36T2hSB1MZGH4u7pE2RtZN
	DkJIPYoW0LKA1uJtDWYCrY4AjhQFzP9s41CkUV0i8WqxErQObaacGAzj9DCdY6FnGeKBgJWgalT
	O6g0tn3T+Ma0VoyUwyvpLQOqQQYlKL1jMff56uVIIOKS/oT0RQcAaYemnsvZkTGgPbQEYRE/vPt
	OdKlUQHAdEvgPF48Q1UJWR2b9fTDgKrL9AxnFVSJ+Ka9FwwIK/F2XTuyaBTkJ4czI7OLZ7/076z
	wJ2VWyRkSfEeBtMP4KP6RU+osZUS5PiM48pXCzju2Hy1g4B4ktTJTMenNTAluQQUd9gJHxChZ/u
	tIiQ4j6STxKQJCfvV26vz/PEsusIa9ThpgdFal2veokb4thMtnFXifSkcTlv21hfdjZlMgjFR9k
	vtPoRiyEUVI1Ig==
X-Received: by 2002:a17:90a:fc50:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3a89f649791mr1506978a91.5.1791370138770;
        Wed, 07 Oct 2026 03:48:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm9119961a91.12.2026.10.07.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:48:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] PCI: tegra194: use dev_err_probe() for PERST GPIO
Date: Wed,  7 Oct 2026 17:48:46 +0700
Message-ID: <20261007104847.507776-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when getting the PERST GPIO to simplify error
handling and properly handle -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 63a0f56cad8e..767e11216196 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1200,18 +1200,9 @@ static int tegra_pcie_dw_parse_dt(struct tegra_pcie_dw *pcie)
 
 	/* Endpoint mode specific DT entries */
 	pcie->pex_rst_gpiod = devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
-	if (IS_ERR(pcie->pex_rst_gpiod)) {
-		int err = PTR_ERR(pcie->pex_rst_gpiod);
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, pcie->dev,
-			   dev_fmt("Failed to get PERST GPIO: %d\n"),
-			   err);
-		return err;
-	}
+	if (IS_ERR(pcie->pex_rst_gpiod))
+		return dev_err_probe(pcie->dev, PTR_ERR(pcie->pex_rst_gpiod),
+				     "Failed to get PERST GPIO\n");
 
 	pcie->pex_refclk_sel_gpiod = devm_gpiod_get_optional(pcie->dev,
 							     "nvidia,refclk-select",
-- 
2.43.0

