Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7C3AE18C
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633368; cv=none; b=AZ12cGzItt3mQu/4KqZB/yv8+3G7ZA7MsH6HTH+O0h3osSoVAMsf+yHievgjEm38X7RfY7DgDEa2rQTu/lIJkJVfNbF+RgHk+8FlTYGwWy2w2OWoCN7sEsCQLH/Y80TpvIHL7d3sc4PfPgyFHzzrXtT9hT3ltAA56maLRHK/M2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633368; c=relaxed/simple;
	bh=BgfoZYz1aliRBDgJ1DdD/5E6heRlZbhIb6uE6aX6V8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lsjr4smrqsQC0tyJhBVtvApOMJ5nEOwcnECKNod5AECBc7x8EWdDB3bG9fEryXVIiP9TsIqAttQqofsu5dsMDWnThTZVjCDG2C4x95wFbILFK//b0nCZ7r+MB9GeoD97FaLt6RacCzaenBNgDFOwQgHuXyA8UBnLAN9MJGi/MVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN+Refc7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN+Refc7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35982fd8910so1700713a91.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633366; x=1773238166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=cN+Refc7fn7q43LlZwDVfyzC7ROxPMcCkSfQ9UnWYFa8xB9+s4psaCBMgpNYEAQEDj
         3YIM9wjJkJPraQ0sgdEhp9YRmbIkvnt15XLh4S9e8INGR/PX2vujBZnpxnIM9FQHfO98
         HukjkUSzXi4EVD4+BV0wNxBazf/u7RGYv2PQclUwdocI66/bzBtjoKduFQEFtLYGgGhv
         Zk2iVfuYur5LLhzXb4zxxR4gvDEJPSprFGbM/ammE3ejF+eqCdtk/Ut5TC6wTW4gs/h2
         S+CqeU+x85uJK+/o9Lu11KXJ3e7PWYvFYI9mFbcr8lUTlJU6kJjXsB0ZpQBpG0yrHPTx
         BpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633366; x=1773238166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=ngcefBA3tccNhF4lPb8Wy3KA5p7kilmpVxpVENEYZ6j86QvlDHQuQlmfWDaKatBlDV
         U/KBMx6jp2K+SAYDltWyTCA1mUd41+YUDE087hzhePV32ijew6O2LMjt2ZegDtawhs2E
         pZnWtQ9aoiYRYZ6xjLRRPT5P0F1+GgPLZyDvBcV+oyPF+nzjmInKhr3wk/H07SNLeC8+
         rK/hXD9h3n4g/lYLa/NHIDHMRLjJHwV//e/0EHN8DPGocZSz2ll05e7GDe6VSJD0SBi6
         rH0Ywe43z9yGMqABx1hajyfeYofRVj/CptYYF7l/O1s+2g7Tsz4iPHPzxHM+MLwTP4t7
         AYXA==
X-Forwarded-Encrypted: i=1; AJvYcCVV4ovv+zHpf6MMJ4mWKIrSjzBuCN9aAnw3GYBjj+lqKWkgDjvhaFeSOED4TrWeoIxjyKYIUmkO/TZNaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsFLPPPlHxS+s5n64rglZYcK57ij2xtm1o2Rr914H+fxwWnlTj
	ewl6ZkEoIk0lhnpuF1uNGphsBaHbZLuJRAe0IVxuquQMy4Gy2SeWRCJ4
X-Gm-Gg: ATEYQzxc11i8FOAcyYs/Q2tsxwknxFiaNV4IfA3Pa14aZqZE4L18fQmo3gYdNWmZ4xq
	/MgXYSf7LSiT12md4O+eAlbz4OeH/iY7dAyiv+YiSNSc1VBidJDcry+M/99xr8teyGvIVpB9n5h
	q+Oy0b+7tVlKdd1ReF1EoJx92H4r3p9uqV1hCsZzG+7NH1yfNqE0H6c4XVX/xq6uYyaAvbLqTO4
	Vg8JlO8cgIez7nWD2G4NIRT0YIYzSKLtn8jud5yhD+/1apeAeJGr27k9Ryru83uwGl1a+MQRMz/
	H08HDUKASjXQ5V7bxC0MQtx0sH3+6j0s0JALsy59R++D7I+2SeNfsqX6ShtRETC1XLqYVpAmCwU
	R5akT+/z5KVub6b6eaedvmvKt/9/kuqsN+4BTkcSnNiBwIoSg4d8gx+C4JB0q3l8t0gnsigLWNf
	DLJPTpa0MAxZhTkoigjAdP
X-Received: by 2002:a17:90a:d00b:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-359a6a7a0a3mr1687183a91.27.1772633366451;
        Wed, 04 Mar 2026 06:09:26 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:09:25 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 07/18] PCI: exynos: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:50 +0530
Message-ID: <20260304140329.7089-8-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 0bb7d4f5d784..ee2423e16b58 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -388,6 +388,7 @@ static struct platform_driver exynos_pcie_driver = {
 		.name	= "exynos-pcie",
 		.of_match_table = exynos_pcie_of_match,
 		.pm		= &exynos_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(exynos_pcie_driver);
-- 
2.50.1

