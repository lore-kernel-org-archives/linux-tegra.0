Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42115F41F
	for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441535; cv=none; b=Vu6IH/Ewqmi/ghQliN9YM42QRys57NeLw4f0i2l/WNaDbPkavCzpuuQpbtDOeZqRIeIMC1l3o/RiR78OluvfxQMlZDva/O9fU0mErrFuqMUTeXp46CLL3g1TC4Ogw+xd/rwqVGK0/6OHaOLiXSFD2tjJJ8vlFtbqIlETTUjjnew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441535; c=relaxed/simple;
	bh=rwb0ErsAMOJOBGTVMRpx900gyCjG88g972dlNjto2GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGgJpHUp3p+8isg/QqLWGoHI/XmInONH3vV99BhrmxS8spaU4SPEKBVeaq2uZp0p5R7mjLYHn4Bqz3xvzha6uPX2cnXtUFHyxwCsP7p3BjPy9cNo40K1OpkVQWZVpiMZkm0ETkpW8WANpNsv63uW4vTfB+R79HLuElIFzdz5Ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xaFG+JS+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xaFG+JS+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed11782727so734445b3a.1
        for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 04:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713441533; x=1714046333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrN5HMtM25sMebZ7OPzRb4bH/7+xLTv/ToBzj1D+nVM=;
        b=xaFG+JS+KxCBZq+MsH/QYDsGN8I5mzF3n/QK+K9CrM2rVljfapgk6Ml7GewxqSX8Bz
         +vbLdev4Bl0Bn1tLYsjAB20vgTM2wfjyQmqO9n/cz1EvLs9ebtsXaDsMj1p2/pplbbIT
         c/s+vBWNGYROin8M27ufh1dUxhrScYlSusxkpeToJdY007m2LOx3L4/YUEWYy4I/LK27
         dL32ON80BUpYj/eUateeeiXZtSG+jtYO+fBuGUJFy254dr4D0Wbb8YXX68J5qKB0+aMF
         Liiqc7Rk/eFP06Wv8+N0KaXsb/qVWxghZamFUslY14O/yNKohouag3OAaRLqKHNRf2B+
         HaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441533; x=1714046333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrN5HMtM25sMebZ7OPzRb4bH/7+xLTv/ToBzj1D+nVM=;
        b=pyHNpMd/2ucsDbtjRvaI++hfSJzreuzhilzOG9pG+4Em6ubRU/AAvxa47Rbadb6s0m
         vsIcVVNojq83un1dggf05zBWmXPXbvONhrF4MJhuI7YB2E/ZO2iu8froLapB1CvIMnHT
         bm1wZ8oC5E/vxXHIIRG8dHDs1cby+7t3hSAlnsmq8v2Hjmb5HsSb861W7QNEPYuEZJA4
         hYMfeeQkZvt/qhJzxLgGMA3WBwo5VqE6ulFb9Uqeu+9AEYkuJSs2nRBnlRS8ShVf6ikg
         9EXqTb9n1/+IYjIwp3s+67DPPM+e7D0TfM8xrb0GcOhze1+w8zlYABUgaIjEYC+ab9HF
         urpg==
X-Forwarded-Encrypted: i=1; AJvYcCX+P0NNYSUQcq5FDFw/QlDpe0rHElyJ6mIemGPFFYFjwgchhRImIfshlGrvEvaWAK2p/fwX3MU6VHDKcjy+tn0gyVHX11IGr8qhMNE=
X-Gm-Message-State: AOJu0YxjmrguASx+rHuMEyPoGjrxRbexDhVVBqjRl9rOxLjfODiDmTMr
	QMDMN/loATZnaDHYi1dG5wSVv3GFhQyAVzxcxM0kAqxBmTzN9FXK/XihjDgvJg==
X-Google-Smtp-Source: AGHT+IG9kXTcBipP2Gwv++j5yx6bfXSo/45ZBOKxw8RMkTQGkrpXHP9dpUWBB5CmHlQYwwIKACpZFA==
X-Received: by 2002:a05:6a00:3a0c:b0:6ed:d164:3433 with SMTP id fj12-20020a056a003a0c00b006edd1643433mr3235807pfb.14.1713441532862;
        Thu, 18 Apr 2024 04:58:52 -0700 (PDT)
Received: from [127.0.1.1] ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id ei16-20020a056a0080d000b006ed06c4074bsm1305512pfb.85.2024.04.18.04.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:58:52 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 18 Apr 2024 17:28:29 +0530
Subject: [PATCH v3 1/9] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-pci-epf-rework-v3-1-222a5d1ed2e5@linaro.org>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
In-Reply-To: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=rwb0ErsAMOJOBGTVMRpx900gyCjG88g972dlNjto2GQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmIQrywUQZ4EOU/A+AC0lu/3GJstzSzgnsSMRIw
 Cbdqkkl+06JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZiEK8gAKCRBVnxHm/pHO
 9R1ZB/wI02PPJ6D+du4yCtEE5xK/RY1PWa2AMXi1v6kvovHwcBAVjhYoA1HNqqGEMdTXRVHZvOj
 3o2Bz3iTvgGW9hdlSIiFgNpqIUYmUSe/Yd66nOZGAR94uY1ryVf/3auhJr7rnq5JdxpTWYqM0qP
 gHmtmy03clIVQUUrYHqFDWKeYzlIILcLJVN0Un5g58JqvTBEWZQmAJv6KBI4kJx1B0fIwBxZ+V0
 +sgykVYYMz4MgwZjEolHARgZC/6j5YEvDBxBhkK7xMnoNszpyEIP8D+Aw9l/2QzEIpKV9cHBZlf
 Ig9p71iFc6buSGb/ijEaNCW94m+ONZJUrxFFYi8gTK4eM6pE
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All EP specific resources are enabled during PERST# deassert. As a counter
operation, all resources should be disabled during PERST# assert. There is
no point in skipping that if the link was not enabled.

This will also result in enablement of the resources twice if PERST# got
deasserted again. So remove the check from qcom_pcie_perst_assert() and
disable all the resources unconditionally.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..50b1635e3cbb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
-	struct device *dev = pci->dev;
-
-	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
-		dev_dbg(dev, "Link is already disabled\n");
-		return;
-	}
 
 	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);

-- 
2.25.1

