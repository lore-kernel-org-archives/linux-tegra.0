Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E53A1D9
	for <linux-tegra@vger.kernel.org>; Mon,  4 Mar 2024 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544262; cv=none; b=n5eQ1jSSLGx1Jy9s8jHwwr6quTjTrc1AvT+TmAI+Vumli/ycH+okkFOWwqBAaea55gd5uxp0An9MqKlxJ2FiCHLT6LprDScU/TDHLTsWTMa/Xt6BHwfLHzINLCuu8kXnKoJqPAwPykSretsZl7TyRjf3ZHzYRJykGQFi/lBXxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544262; c=relaxed/simple;
	bh=lMx8jaitSygvuxgneq9A64SvIefKCHyxvtG/ZW2Dw20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RF2wRXMgnUs5hHPROWD2241Ra9+EikAnN9MFv0VJtLRgjv1GoDnx7GG2dCsqD2zX17iW/FLLNpOR6gj0c3yw3GXnI0mS9TTxmxQTIioysSIsOSpyez4IS1GHsyjsuYeqAltR0gIOyLS6QldcZXivD2nm6xSbiGhJ6yBYdgSPSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hf4tPyb1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hf4tPyb1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dcd6a3da83so30674465ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 04 Mar 2024 01:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544260; x=1710149060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWp8V5CHI0uxSxSBbNBsR7PWeN0w7yn0quv2v4HN+ko=;
        b=hf4tPyb1Tr9rDMxCfv3ID5HR3sS5o6BxkpW/b3Vbp4R4meLKml1D2C92O+pmUlIzmo
         XsBT2lYB/bsvSVzLE2yqBcxfW4nut9nKRZlWji+0IXBk56Y8TJjUtmZAMYqaFuBA5V8z
         t3r5GryXt8BZJVAFg+zh6qwxyCW5L5D/tFdUR32cw8yYIP2XX/B099XlWDFEIEY5RKFu
         o4KHitOfqP0uPRRwi+Pay3UemzH4nPBlR3XRi356nu+6RoTXnVUugo/FIaAY8enRdvPs
         SWKFoQGzggCR1JKNUt7Gm4LtU4+VH+J2lf34Awlx3hD22UK4qsvcycrfjSPATizZKxrH
         7qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544260; x=1710149060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWp8V5CHI0uxSxSBbNBsR7PWeN0w7yn0quv2v4HN+ko=;
        b=UpIW7BJafCOXq2Yc8nriHdlIn1JtOjnYHtNoDbSeP0pywRhTPWQe9ZppUJJ/u4oiRi
         FGTz2Z6ecLLsVvTe3i1462ttf1niRokvLL42TQHnjY3uKdSyV2D12WH6X9q/FK1wvRMq
         PdfLo/TI1VDZPoLof6R67KFO3DQvTnxnSo9PqqEcFQgHACaPn03KVVVYtTXDn9PTQalP
         mtCCy66kiiO72wMLJzea2oTVRN5NPfEjx2K8b0DcZlBYqIDdFxVeTamUydFHBY5jPE6F
         nJfSgmPScrNP2iTLcC3zOZkRWqzmo/1Zd35uxxsfAbaMSRPLGdMCg3yQUj27ggTuvQPi
         ufKg==
X-Forwarded-Encrypted: i=1; AJvYcCUXY+KU9WFybek1hiDBZNTiR77W8xX62GVGnevCb3S5mhSKXFmzn5W7SaVH+sv7MYxJx/C/nzZRjfzjgRf+oybcQvlQfKLtSAcxSnA=
X-Gm-Message-State: AOJu0YwUkVxqPoUguCb7gLQVMv+UNl+QynfM9t5i2pd/THcJ7ygsntq8
	42kZqTDgWSZgx2qyxOugI7esHUtP6SHFG+73/nsHiinWNu54wIo69hFfgBsGCA==
X-Google-Smtp-Source: AGHT+IGd3RHrhG0REOqzg7vvID2C11PydWNUBtWjBBEsihn5ssXizL/KxkhroPZebfnkGcMR8XmjXg==
X-Received: by 2002:a17:902:e843:b0:1db:cb54:5e77 with SMTP id t3-20020a170902e84300b001dbcb545e77mr13621075plg.22.1709544260163;
        Mon, 04 Mar 2024 01:24:20 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:24:19 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:21 +0530
Subject: [PATCH v9 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-9-29d433d99cda@linaro.org>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=lMx8jaitSygvuxgneq9A64SvIefKCHyxvtG/ZW2Dw20=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLYM+2eiwjj5RRthnOv98Z7OtxGghplNJTiy
 GQRM84GrQuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS2AAKCRBVnxHm/pHO
 9dHhCACbE5J9y0XzNdYDaP9MkdaF6BTTU7Te5s2Rjsn1arZfo/PurJr7HKfWBVt8SR3xny3liv7
 nQC+stRAzfGbP4hMtKJCWlEyC1QTHu35Bs2mp9IC55dlurHRZopufYF7QoqIhmAurClQ7/cq1nr
 U8BnJkfY1ky5JMTrNAZtwWqc/E84ehS1gBQzNv1+kcyLll0rYCFsFcf0BNOkc8tq80FsWt+rVOY
 wThHyO5DOD7cT5a/oLbwlIfMB4Xxlbw23ysjE2CIono3ovFtPNHCYRm85rgwGWS7CjCZcYY8zqa
 op88X4U0dgv8mHlGG6mNc/DzL1Ri6woSmEUdN7cf0h1AosyE
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2fb8c15e7a91..4e45bc4bca45 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1

