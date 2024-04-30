Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1FE3D963
	for <linux-tegra@vger.kernel.org>; Tue, 30 Apr 2024 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457659; cv=none; b=E/xx3GmC+ZMAg7jYrJorrkAFv9bTIHhoOvYBMF0VeOy/NPaGY4B2VBLI23MODB81Px4/wj1JGQ79ElSyoaQVpeGmFFDo+eCbcYxBPjlwaOqv0K5rg0VwJYg7PH1UNqewzxgxGwIc0YXiHH3hL5tHWTX0ne6EIxiki1/WtlD0Ubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457659; c=relaxed/simple;
	bh=m/BK1kL1aRCYhTCw4aRXmvXh94Edt1A2zhsh0TO3Or0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awXzfUZJUZ7qVwe0Sw/7F77KrM5vG3yzpOayQWUxVBCEVMbS3dP8a6xhvCBRHRSn2xriFrwYK5UorXTX26nRdlkl/iiLmLNbEnrrvhtp08Lhc08wMXEVQ7YEtV4K1yVp9yvhYDDqpsUeqe+er676imvQdsOYLaLm2Z7aSfMocy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMiblaC/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMiblaC/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecff9df447so5175122b3a.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 23:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457657; x=1715062457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/H37AIQ5wmgwzS4Pf0bW8eYmacsoQGCozpXOaHqRiEM=;
        b=xMiblaC/v0bG/CREq9DxCIK8of9ttx5OrlJMKygtTU7y0N0fSza5zrQc2g99qHxz8D
         NMNsnW7OfjnM9cahUYGa3tBVL0wLkyGMCiY0aiRXKDQTP/mFnrtKcUZkH5XBYIKzijul
         LeJgNEiKLpqpeAvNKldWU8ffL4O4gsA1SweLOhIklGtxOLXcik/K4qoT7BKPENOGkWPr
         E+gTeXTCoTVthMj15Rx7JUPVFBoKu7ICzRW5LGXPEgHDRMmoZ33h7nACewA0pzNI97xt
         U1j4em+HLbSCIQ9MO0vI5RVgyAqdVSJrClpkCHuRUE4BMxky9cd3JcK/UswPU/J22SZN
         az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457657; x=1715062457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/H37AIQ5wmgwzS4Pf0bW8eYmacsoQGCozpXOaHqRiEM=;
        b=MWF4gcQxa12NkFjCME2xIHEVhJ5+XHAIQBaofp4ayJqaNQKGjNy2ZMHEPZ+aTNYR8s
         +pSNy2fZcp0oezFvVa0v8f0DJ6Pu2UbHRPI942p4n9AfOH+6lnTnjXYhgffME9nIC4iQ
         9wr3JgpPfWq6Sgmg9xtYT6PkPeTd0hmVMUSjbkY+pXbN8oxYRuSLFF3HhOxCZmV0y4nM
         I7Mfj58WN9Gu+E/ywtyVL3GJvM0jYdlepcqE+4qRVXbWUbUyy51hREPO34/BHYkzOu9N
         pI2oxUL3J8nZMCMHgQAdp7exCCChHKhFIuT+XfcbJIsqhLGeQFm8PLzyWU4uKDXv/R94
         w/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUizDE3f8FMYkZZ8PSISTJwsGkLnQ2Z6Yb8M+FFOOaHkzO7V+FtZ8sniZTnryD3u33mxaRvnJfW8Vz40TGhoAs7s2EkelSIE59oLkc=
X-Gm-Message-State: AOJu0YwvoHukNTs7scusX5XsPWonQSOzaF6dNfGXrJfgxqwKyVPIfz/t
	0eIcrJrlyuljiOHMLV4JrQeCUKDetzjvjAIR+5ZXuAxMgnOtSaDvx6vL445/4Q==
X-Google-Smtp-Source: AGHT+IEK21Qn76VtAoqsMJS8BnT1EZxheKPLo0j/8QzYVaALg0yeONBFIjIqq0CJONX0mzP/UwmsUA==
X-Received: by 2002:a05:6a20:5608:b0:1ac:8824:156f with SMTP id ir8-20020a056a20560800b001ac8824156fmr1734647pzc.33.1714457657253;
        Mon, 29 Apr 2024 23:14:17 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:16 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:46 +0530
Subject: [PATCH v4 05/10] PCI: endpoint: pci-epf-test: Refactor
 pci_epf_test_unbind() function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-5-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3151;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=m/BK1kL1aRCYhTCw4aRXmvXh94Edt1A2zhsh0TO3Or0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwb/mmu7l58017dF61E5qAM63lf1diuOo6as
 CMUq7VWEjiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMGwAKCRBVnxHm/pHO
 9S46B/0QbA5KRHn7a3ev7DPHmzfj4Umq59fIuPGpkLtbjIcfPoG/9SUoD8hQOWCP2HZU+oseGQ5
 TSV1jhhuThcZSODFYO7CgD2gUJuLY/fxGXal3mJQhcW5OMk3+DhoMgSmb51hb5E8y88dD6Ep2Rp
 VzpGIa9KgZ4YSZhg7FrQ/4EpQq2p8wBtpatR/fnLOINvB0CKgtOIXWy8PoOifYUEu/rq8/GziMc
 RAN96nx+lbhKZwZEqlicm90hQR/v/ltKLRyR5C2xocVDwofd4sYIDi6fqKfEA0lxRQRj7CbV30R
 SiaTqzeUtnyiS178hHSU84uwPkngYGBUZz1UoHY1qjUUpxvp
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Move the pci_epc_clear_bar() and pci_epf_free_space() code to respective
helper functions. This allows reusing the helpers in future commits.

This also requires moving the pci_epf_test_unbind() definition below
pci_epf_test_bind() to avoid forward declaration of the above helpers.

No functional change.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 58 ++++++++++++++++++---------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 8175d4f2a0eb..2430384f9a89 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -686,25 +686,6 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			   msecs_to_jiffies(1));
 }
 
-static void pci_epf_test_unbind(struct pci_epf *epf)
-{
-	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
-	struct pci_epc *epc = epf->epc;
-	int bar;
-
-	cancel_delayed_work(&epf_test->cmd_handler);
-	pci_epf_test_clean_dma_chan(epf_test);
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!epf_test->reg[bar])
-			continue;
-
-		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
-				  &epf->bar[bar]);
-		pci_epf_free_space(epf, epf_test->reg[bar], bar,
-				   PRIMARY_INTERFACE);
-	}
-}
-
 static int pci_epf_test_set_bar(struct pci_epf *epf)
 {
 	int bar, ret;
@@ -731,6 +712,21 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_clear_bar(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epc *epc = epf->epc;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!epf_test->reg[bar])
+			continue;
+
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
+				  &epf->bar[bar]);
+	}
+}
+
 static int pci_epf_test_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
@@ -857,6 +853,20 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_free_space(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!epf_test->reg[bar])
+			continue;
+
+		pci_epf_free_space(epf, epf_test->reg[bar], bar,
+				   PRIMARY_INTERFACE);
+	}
+}
+
 static int pci_epf_test_bind(struct pci_epf *epf)
 {
 	int ret;
@@ -894,6 +904,16 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_unbind(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+	pci_epf_test_clean_dma_chan(epf_test);
+	pci_epf_test_clear_bar(epf);
+	pci_epf_test_free_space(epf);
+}
+
 static const struct pci_epf_device_id pci_epf_test_ids[] = {
 	{
 		.name = "pci_epf_test",

-- 
2.25.1

