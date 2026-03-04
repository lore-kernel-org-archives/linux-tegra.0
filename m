Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854223E33D
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633657; cv=none; b=SN7M/w+/UhqwrlBacEjCHjtgMxdgSHWYMQyqQQs0p7FWz/JGeGy7vknP9rMP36caBVCqUA7jVAqa3P4GZhNoB9IAX39Su+RtJEjyk5PyHYmrfZqBQ12sfpmHqFm4Xs9lMjL/b+bfMkS0M8jSp7u/uvCsQcb8miuipRh76iBgdKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633657; c=relaxed/simple;
	bh=usU4AsKxYiL9wPQdX55tLEiVuRtsJkW47W4gt0QH30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gp5RkJhv3Bwziet1wefyBA7GS2FTCDCOjZBCVI9+CH6y+a//KC56/NRI4/p7Smo4g569JOkC6eBQWVX6APOx1rbTmPfmVCCySoToITqisKL9QAixwkukpHIV4lsoGucwuxPGwyB+u9HhiLp+rQZzTXLeMrigX2pRfJOkxH3HDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArhD8jr8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArhD8jr8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1408192a91.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633656; x=1773238456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=ArhD8jr84XISWVl9gGSrPW55hIVw3gBtgBKt477yhgWT45O36LWXe4aN0XIP6hcMj8
         mWAhK5n4JzP2AqnJsXs4O030F5lYx2A2hpJzmZ3eb6IqV5/CfnDzAHXTAS+t3L5l+N/4
         hmeJ5uEe1eia/mOH+QE6NdrbbXCZNK/H1oLcySWmwrRT7MsONmFNQ1nugQl70PiAwsIO
         UUuGDBikvkgVk5C+OJD9oxCwxfBKoQ3nsL1ApAwqPAg7EscfkUu+xwA5Oej/AXO8+NE/
         UwA9TY+F8i60eZH6hA7lFUTGC4B13JysNYlw52Dakhrzktky1O4vu/s5CIBbaeFaO0wA
         jG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633656; x=1773238456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=XyYhkjSzNpR/CQxi5fTcAOS8VFGrwAn/dsbG4Gvr7Vvffpt8NRJNwU6GLaQAwbG7fX
         vB3w1a8vi62oygfSFuaxGgdbYg/2QVzOV3Ytdk2VspGFYx2wm1QkyHyBSOKyFJeG3n2L
         LZHd+/1PX+WI36qZ/9Hg3mw0JVVJZkZnhgLRE/KqB17alx4FEKa7WKVIHBNiTK+N/kMM
         5SjD/1FmhSEnd4MN0EzMZ4PKFsmkkPspRl20ZE9NdpW7QYdkSVkk+fUspgmk8Rm73XhN
         4OJBsLYRzQIsP/DugmktrySfgR9ciCcN1s4aGEzmatWIDEYBFhwdahhQw+5swhBtcmM3
         YHFw==
X-Forwarded-Encrypted: i=1; AJvYcCVaXYvzlm6eWK0GCMAAFgyPklcWG3huXHs/gUOHfr9Qbz7D76Tm2d5lJHoiLjbHTtqPQivahpMHEPYbKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDupCyC5qgaEby8J398aNH5719Hb7V7/PcQB62VAIEKLvNuXD
	E5Y2aNuinZF7Z8+8792ZqhpmdyhW+j99oFdrfcGw5jpkODY+XVqXW0Mz
X-Gm-Gg: ATEYQzwkT+Oa8m3ivMGzfEiJ9PCbuxZS+JKtJNT9l3ki8TmHz7Qm4DNt48hUmsQHtxO
	OqePXDSlSjmx13tE4kq+UvAGnt4KShaaiBCUXuRqshz4P+iRbZgnWWNsMC8Igic7so+0+iAR3H/
	VW13wHrBgJUNWXXg8wQqDJHEeLif3m2fpPuhxW05X9G0ndzDsmeLfI3yNfFgBrX2MFA9su8XSor
	JImXH43iou9flKxhM6R44f6Ea5OiqV7WAIkLQtXzV/kQYy3K/H4P1ANy/e4dAf8klHyctdNaUtg
	DrR0j6vJQ31wfeUNa/uv0nu+jcHQ/N/raf3v5S2QtVN+yTH3jBaKbxscb1DtFnNv81V5gBUGx70
	yU99wZZMd3Hs2ZYxBGkbKOEdus/981mhL69ZVnaMgjfbMAyRLpOwc7whkbqo2ICIFLC1Tt4WhZp
	UYgR+qeUjNGKQOormFMiqd
X-Received: by 2002:a17:90b:278e:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359a69adc3dmr1844903a91.5.1772633655971;
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 13/18] PCI: layerscape: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:56 +0530
Message-ID: <20260304140329.7089-14-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a44b5c256d6e..43a28d9ea7b0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -410,6 +410,7 @@ static struct platform_driver ls_pcie_driver = {
 		.of_match_table = ls_pcie_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &ls_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(ls_pcie_driver);
-- 
2.50.1

