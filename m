Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC524468B
	for <linux-tegra@vger.kernel.org>; Fri,  2 Jan 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767380967; cv=none; b=Ideae1VNG6LNWXS0cJ0H/Ny3puSeLZ+q0Kw95YbSjVZg9WunjzDSdiHwXgtShy9IzgmclqOj9dhUBd0nre5uHD79fMWMM3U7M0XIt+R6jngSLe7RG7UU0l8kz0qxRxX15cT2LhrifrNkYY1o0fHuBDVDvR5xe/WDNe53W2YDqRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767380967; c=relaxed/simple;
	bh=uqhjYNAfkt+82hv9d8ipsovtPfdTiT4fb8TQCk6hsvo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=T61MhcLkgGrjsgN9Wll+kPmjTX6p4Envgg0mAPGA2SLAVDsF67h3J9T6a08kvAjcWhn3IOLZ11GGhgaA8WaV8CBizq6Svr8aFhvI/XMv3O6xEVuveRqkEmx7hRXDEUIAh0qgjI5beBmoh1dNWYnKevvLAW7+lqDtLlmE/E1LrAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BAt/kYyR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BAt/kYyR"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so13732840a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767380962; x=1767985762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=boWXRnCUIOrDsnOWzfp75smSCi194XHHP3tVGseqY1w=;
        b=BAt/kYyRzV2pOine76X7NKOqV14FJE4wJ0AmSU+9nsDPziUD5Nxytj3LYdP+lvUgSF
         MRaEbZ+fj7btIc8l/bOJHAg65oxoPJzHIJTDYruRoaL8QzSwBSnkMAPEOh1/9hRfi0MT
         WVUpiv1nVkeKfZNmc5FDJH4iWgBINF1YKHWwvfLMqae8ukFkMlTMjAK4y8rp1hNfscoj
         W5N4GutL2Fo5FSFnuSc1dx+5NkzWRaA6OSvY7emMkyO4kQxu/u4fa4irc9QaJWasVCOY
         NGiMZPJzJGYX0G2T3zGHnv6V99gExGe2HrRjv+NyxloNDcWBv3JcbM0niMgRxQHWZEfc
         08Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767380962; x=1767985762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boWXRnCUIOrDsnOWzfp75smSCi194XHHP3tVGseqY1w=;
        b=rMCIxQh+xyD2ScWQET8t+0nVAfLFpKMkwaBhXfB0cSfvetcbZTQcifJNH0mt6X6ojz
         kj5W4Ljk2eUBQx26BP9lCfba3Ew4V6ObJUHsBYvufpFI4rqLUpsXVgRuM6B31UT6V+80
         5Rg1ef+xRxAS8+v7smI5fJA5FWKQMp9/8rxigrtbJje+PX9vViP3/FMyfR+qHQ5Z3fnX
         0i3IRfz042e44JSTcdIStiBBsiQWaI/1k4Tk/yVIeUDSNa5AXLn8ehktdwXl+tVP/xwR
         DL8BtqPhJlQHEQFePI/0jb47SP0TIpLCBzJvkpacJE+BoOwg0ORpE+uT+Q9kzQIpZ2w/
         EhIA==
X-Forwarded-Encrypted: i=1; AJvYcCURGPXOzaT4Eirg6APaP8YX5mRx2jonfBEsogutvQXs/NcvMGB/4kZuhWRNtbuLZUgQb20nETH1NEu9BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN8EVOflKaRMVxznKsiPDh1U2Fw1kNqGxjpCH9sm6OtH0TAVdU
	qcMNP8s0qjkuzQCCamUM7H5TnIkmAwF+EYFt2B293qR1gaB08S6MSe7+bac7gMZeLTI=
X-Gm-Gg: AY/fxX4qKK959w3PyEyimy+9bqPzhjyf5JqWxI2IoLEdkPEWaXINfdET76bUhxs0ml9
	kP8Skuf+d8Stf65UnIur6CFxoRhJVESeO55sHTrJWMeBXgzIMo4IjT1QoHpfV8OD+wki2T25DP2
	c0498kJxxvkU2m9gLa7reMitObcPpp6mTgTLb6XjlzilAh90HII7lNpTjrPkNcv0uYN5+PDSbDO
	Wq3H/n5YYDoPSpJKsDVRE/i7U+Ab8Gxl4Zta7Emyl+hSmGtU6fhXqmKoy5+NxW1tUmegL2Gdyqi
	oXQfTATl6VG9CqG2F9eRqTD3Uw3jRzADyFWuvh2oERUIAX3gJryBbyoHtmMGHLfrbbAl/AXiojx
	4yPuaamw86wdM++KhNTzXh1JSB9gXIhCU0L6sjh/DdnUN8qOmkZ2FNLBNWVjIrhNm+Nzoxq99ew
	8+guJARekF2ezPC/dZihvnH5LNxc3jRLRrtZnwYkUBUQ==
X-Google-Smtp-Source: AGHT+IH/FHQJxuFpGgwKfG+OuWaeHjJUGGtTzrfSw7tz+cUbKoWxni6Efe22Ybn4FUB17DtWHMNkvQ==
X-Received: by 2002:a05:6402:42cb:b0:64d:3550:4bbc with SMTP id 4fb4d7f45d1cf-64d35504e54mr36464526a12.30.1767380962504;
        Fri, 02 Jan 2026 11:09:22 -0800 (PST)
Received: from localhost (mob-176-245-174-179.net.vodafone.it. [176.245.174.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm30747778a12.7.2026.01.02.11.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 11:09:22 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Jon Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	thierry.reding@gmail.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mayank Rana <mayank.rana@oss.qualcomm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shradha Todi <shradha.t@samsung.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"linux-tegra @ vger . kernel . org" <linux-tegra@vger.kernel.org>
Subject: [PATCH v2] PCI: tegra194: allow enabling driver on Tegra234
Date: Fri,  2 Jan 2026 20:09:21 +0100
Message-Id: <20260102190921.3765226-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3239; i=flavra@baylibre.com; h=from:subject; bh=uqhjYNAfkt+82hv9d8ipsovtPfdTiT4fb8TQCk6hsvo=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpWBdjnI3SUmx1x6kSQ1AIZAs5kYc93RE0r2OcN qdq2IfhM0mJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaVgXYwAKCRDt8TtzzpQ2 X3PtC/9yWolIEz0mhap55YeZP9BHWr3qbr5yUnkwhAPT0uGOjOB9OBAtFZHGQPUWZMmJWb1Sn8V pxbJSEbqhzjteuUcQQ3mf9hh3Cqe02W7qvZWrVEupclVBAOVP7MWeLc6l+TQlAneJKJedBE6HWO 12R+mo5md64OAr5YJN7wHLiMBG7CQPWP9z4vxBXoddgTeDibGVjlC8ftbdFR1awVRVr/BJ6M4B2 LhcjWNfCb/9kSarRZLEuzR/KKPfZ500oZ2+bCf6gvLecu0M/O6WiC/n4NVBK2rpPQ3VbgNw3Vzz 87Qdz/8nsJtkYQcuDv3hps6K9h3A9Euvc3bHJkcgI/Wjm1WRIxfJGkjaLgzBxUf2gQiiW5nOlZh 6VGAIeMU4S36KBRMLD8fH7ORv9dtriiML5ydu15zl3Rdl9Ve5V5szeYWFAxId4mQCP3kgvdBAUp TgCfpPr+pXN69phKm//Ld0BjBzchsd912kiiNbAEghho1NPiK6/r89hQXd3TWcJ2BehM8=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

This driver runs (for both host and endpoint operation) also on Tegra234.
To allow enabling this driver on Tegra234, add a Kconfig dependency on
ARCH_TEGRA_234_SOC; in addition, amend the Kconfig help text to reflect the
fact that this driver is no longer exclusive to Tegra194.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
Changes from v1 [1]:
- added ARCH_TEGRA_234_SOC instead of replacing ARCH_TEGRA_194_SOC with
  ARCH_TEGRA (Jon)

[1] https://lore.kernel.org/linux-pci/20251126102530.4110067-1-flavra@baylibre.com/T/

 drivers/pci/controller/dwc/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 519b59422b47..cb8a9c049158 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -228,33 +228,33 @@ config PCIE_TEGRA194
 
 config PCIE_TEGRA194_HOST
 	tristate "NVIDIA Tegra194 (and later) PCIe controller (host mode)"
-	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
+	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
 	depends on PCI_MSI
 	select PCIE_DW_HOST
 	select PHY_TEGRA194_P2U
 	select PCIE_TEGRA194
 	help
-	  Enables support for the PCIe controller in the NVIDIA Tegra194 SoC to
-	  work in host mode. There are two instances of PCIe controllers in
-	  Tegra194. This controller can work either as EP or RC. In order to
-	  enable host-specific features PCIE_TEGRA194_HOST must be selected and
-	  in order to enable device-specific features PCIE_TEGRA194_EP must be
-	  selected. This uses the DesignWare core.
+	  Enables support for the PCIe controller in the NVIDIA Tegra194 and
+	  later SoCs to work in host mode. This controller can work either as
+	  EP or RC. In order to enable host-specific features
+	  PCIE_TEGRA194_HOST must be selected and in order to enable
+	  device-specific features PCIE_TEGRA194_EP must be selected. This uses
+	  the DesignWare core.
 
 config PCIE_TEGRA194_EP
 	tristate "NVIDIA Tegra194 (and later) PCIe controller (endpoint mode)"
-	depends on ARCH_TEGRA_194_SOC || COMPILE_TEST
+	depends on ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
 	depends on PCI_ENDPOINT
 	select PCIE_DW_EP
 	select PHY_TEGRA194_P2U
 	select PCIE_TEGRA194
 	help
-	  Enables support for the PCIe controller in the NVIDIA Tegra194 SoC to
-	  work in endpoint mode. There are two instances of PCIe controllers in
-	  Tegra194. This controller can work either as EP or RC. In order to
-	  enable host-specific features PCIE_TEGRA194_HOST must be selected and
-	  in order to enable device-specific features PCIE_TEGRA194_EP must be
-	  selected. This uses the DesignWare core.
+	  Enables support for the PCIe controller in the NVIDIA Tegra194 and
+	  later SoCs to work in endpoint mode. This controller can work either
+	  as EP or RC. In order to enable host-specific features
+	  PCIE_TEGRA194_HOST must be selected and in order to enable
+	  device-specific features PCIE_TEGRA194_EP must be selected. This uses
+	  the DesignWare core.
 
 config PCIE_NXP_S32G
 	bool "NXP S32G PCIe controller (host mode)"
-- 
2.39.5

