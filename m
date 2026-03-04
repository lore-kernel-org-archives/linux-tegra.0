Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72083BE15D
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633126; cv=none; b=o7jArv6AvlARGcUlYeQ7W9tCVpRiztPbyMAjK/VGlN1koJOxz8nW7VCF1aAva1qInOCO0gKOKR6DRKvl+uZY8ZnN4DDUOfUCk9U5hu4Tvi4UoENLOoRp4W7IYh3+U5xb3rQQ6gWagRNVRShIebnF32lTfaj/1pAd3hTU1RfLWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633126; c=relaxed/simple;
	bh=/QAQrcofSkdcYW60taE/H4BsrBOpxsnZfDRYlbchvt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLvFZ6JJJ4poGhAYZWEmxDjljaLyjWu67Fq5JJ73LInue5fcIEZYBAK+ivgWqepm12lycPI1dXVt8Lee6YiOJQ867mbmn9loIkoMsgmhR3y9wNh56bTVnhWGcoL4s/2ObQEkRQ1C2FEMc8PGCv524tzLQPZE9QkuKyxLhGouf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpWfGJJW; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpWfGJJW"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70b69ced09so1872857a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633122; x=1773237922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stXnR5qjp5uF3thkM7E5eM57o30r+czgE7QYCN26U3c=;
        b=CpWfGJJW6BoQbe//NpVg3MxifwX5x2vICnwZWvMq6FJOEcJg1zzsg1KsNzHEf5SiNh
         VdfjNRoV9qV+QXoeRnOiHaW9XRLrbURQk0HLbQYA0ZiYqxWpob/5ioq6WhV/QtCNh2br
         OdPfGdb7fUt3dA27h0pE2LasAOFYcLxj1rlcnYc0JIsnNaKSpAv4E/54iCZr4KZ8nVBq
         oBAnp7cUoIXfbQPFO8pPAfKHd2cUVk+/E+IV/4gM2oPPMS4Frr+qfCvby07FCexdEKEV
         6Y+jazCHToR7DWHe7p0G+u1irthkHd1DNQhs43MY6idV8ngFZlauh2Nf3s+/f4v3Y1Kg
         YVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633122; x=1773237922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stXnR5qjp5uF3thkM7E5eM57o30r+czgE7QYCN26U3c=;
        b=v6ePTgqTUvvG6MDihm0IO1jaIpWKPjUHWnLapoHLPeay23hQLcHlWIoTP8HG03wZ92
         ytxUVbLozLqjwPviMS8mg8/egG24K//pOHb06U00cdZm9hyZdszphsMYAksp405c6XIS
         JHTLVkVZwRNn76lozAZvfDEWsNUDv48Qu26YnbH5ji2W0XFiMceXsnYXqudIaKMaO+xs
         S6pnLFDImg7I9vnah8bL7ixVZ62HKQWtetcSbpuxxX4WfHMnYv3SjrIM4o0/zNJ00RiK
         +BGx0FmBYvBnLCqbaorcM6oKKdCWAxlI+2Ohu8k8Nk/RSKquO/lZ2mKyFeEIY026cTkN
         KDng==
X-Forwarded-Encrypted: i=1; AJvYcCUKKHjWMau48zoAPGAtRe3DsXzDyA9bQHCQ6mC95jNsKkcV1caLslKXbyzPMbZ5rNpr2H9HFDuimyeK3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwURpZ52HNSds9NlXHnbU5mp12NIYmyeFj5pmgsymlm90+FRugZ
	dHRRMiCdg4V+soqXxrMctH85M4JwDQqA/zf6vMTEtg599tcc50Psda/H
X-Gm-Gg: ATEYQzwbdMIblyF3CBHVAoVIgDQfa9anbbfWjKe90jW0e5oQFxYFS/YLIKmQVLrRkng
	rpiMX8nh3hqth+r2xmMq6BExJplzbqbeJrcLtuThrRWxd9P57qt9lqLLxJtmM3eygE4clSLtHV/
	4a+UUuUnZdRGKLbw7YIYMxYq0VRqF8X3HIGnF+IK78u0h/WZxoXe6HdZJmi8NfQgpIaGoAbVVO/
	97gXScb/xGMvqZdAaAvj+DD8YATj5P3730y1izilWSXFFgQQfjqZi4UOO8G3kW8qtMsN3ZncZEQ
	g4whWIFiVXM9eicnwMjHhLeOQXeshyYUDALAcGPD4yLx5inm+tz1/8GOLOSvTmfgHy4sJd8rjYl
	pdc5YnbtY70yGwTjzvNSDqkD20krA4V1+pcPwOh6drsBDpYY1si8MbBfXG1Fkj3KwL9e2xqKkG7
	PAJz++0plGmg+5h0OhSo1YhZohT+b4gOk=
X-Received: by 2002:a17:90a:d405:b0:359:8f4b:6ed5 with SMTP id 98e67ed59e1d1-359a69d424cmr1769092a91.15.1772633122198;
        Wed, 04 Mar 2026 06:05:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:21 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 02/18] PCI: amd-mdb: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:45 +0530
Message-ID: <20260304140329.7089-3-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-amd-mdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-amd-mdb.c b/drivers/pci/controller/dwc/pcie-amd-mdb.c
index 3c6e837465bb..3da5ceac9b6a 100644
--- a/drivers/pci/controller/dwc/pcie-amd-mdb.c
+++ b/drivers/pci/controller/dwc/pcie-amd-mdb.c
@@ -519,6 +519,7 @@ static struct platform_driver amd_mdb_pcie_driver = {
 		.name	= "amd-mdb-pcie",
 		.of_match_table = amd_mdb_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = amd_mdb_pcie_probe,
 };
-- 
2.50.1

