Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CEB3B5822
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633850; cv=none; b=GpF5GeaZhxvVe/6UJMjgTsOL21/WOzCTSNbfY6Q0F/MZ6DAlO3WVvepQATz5J7qCuDea1Zxl7cWXN+CmRypIGw5ontQ40+HN7U3xcPHr3cZ89N/SKvzEvtawP89mFobEOP39XqWzFk+z/P44Q8nhPZBEFzew8qq/C5wWCIjvIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633850; c=relaxed/simple;
	bh=PwMzJDaYmT2axJpaHt17C/g7mT2QkkzcDRg3A4Uz6ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAeLcRGR4HYKcRsnqmkpA6j5Yx3cUkY7Rvc7rMt9GoCXQooSbgxxzY2YNYHDK1SAAEc4/RR3EaEAcgKTJgoEhPG7x2/rfJBgfFNF357ziE81A9bvInRuwPDEHEnH9x6iRfA9g1kuDpJa1F2qLmfzamsOevjQn+gplZey7Z39aZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFGgtW4n; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFGgtW4n"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-359866a1d02so3210833a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633849; x=1773238649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=TFGgtW4nMFcyGLiipi2KvaZHmgZG2hvPpb7a1DBC44l2H+5iSx0JbDL5f67mGQVUsD
         Ilw8bNkKP/2kkqcNhaOS67l/fsu6WIB6l8mZT/CmCWJRV4gDxz1Bork3GQLyXrE0Sea3
         Qimt0Xc8EhrNpBEVwfZS/84Vdkz9/pf+BkmTbAS50uJQEY7BFqEHySngvvdOaVF4Xlju
         V3unPLRgb7zuqnPH6fAS26Pu0QAyLxr3eqmQTk6j1fbqeUyNONV4hM2SsLX9j4o5nLci
         qLYqGvJCqJUGJ0wLcSwa7mLsU3CowcsyIJz4QtPzNnowt9xYuqjbwIxfqqAptSmznhq3
         hM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633849; x=1773238649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=aFqw42P4t77tGpcWk8fq041qiJJKWiHmWg7OsRJby5m9ES3ncoU90hOknucrtBGId7
         lMytMUzEu9geAbojNsAlw7TeDle6/6Sz1ClPLkwzQGxE6GmZcLffEfIxDu24eCVGLPGB
         pQ3OYgdLfG2YoVDjz+C4hI6Y4RtXVkI2qqPVb9b3vJwbrRu7kiO2wq0n2hOw4JLL236a
         lSDQV8qeI9o+mamJaGWbzSCFqvYluNf/0QwvepWPGIZv1YCJn+xsDo0IXS/6gE4nefIl
         yOvdblG8tD4ksNnWBXhFXe7ozBNhDRRXS7DpMnC4WoyRtW6ygCVBBHJJ2AdnySx5Ow2z
         4XMw==
X-Forwarded-Encrypted: i=1; AJvYcCWApsfWqtqzJJ5HA2K5Rh/aA942WHoWOrfdVkFPIFjBOoj4aDlUDW8CoVM/G7HGq0vxp21ep1mw5yOKag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS4QCJLDwCQtba67YJeBJymzQ42+6zVo8HQBhCQRS4DZIuA3v8
	cqh9zCnzQX2P9R/Sv/xv9110UEH6IWVYvA1tED7yEW87uQ8BLmIRuNup
X-Gm-Gg: ATEYQzyyGEqoRs9BfJXQi/uhm2e+mBtIBXtqzahmSuOZvdzOTzOoRwqsT31K3wtUgjx
	QalQX1Wj9QnF4bZoxW+dALPxnnLrhSlYeDALFHAp5Pe8cXwxMebILM7OHkgRliM4vy7b/AZWbmH
	KM6JS9NVchDpIGLEl+iZPI9tmont8RwHDnpYl/P3PRRrOQE0Kl7rS1pOz1xE1Hy6j8wGOLs91Br
	34wOK3NnerSYbiDaCDuMJKt+lafyxBMSnnlCEovBox0iW+ovklKUum4YCZrQ2q2xxHAlXMSjaRM
	h/hJFKvG6jIvpXzBBElV91A1Z7zgXAGIdzVabKpNNJ9oQ5hlF9jRAnkU9hLgwESIFq/Qcg5Hmm3
	hDJ7J4bZRJ/fPXOU4CyO8dfEaUdcdPUGjdPgs87W4ZiNdRst9I+v4wxLz9g65BbVK+izym4Wqnw
	HUCtGrKZdjGpX8H1iLtgUv
X-Received: by 2002:a17:90a:d2ce:b0:359:849a:7357 with SMTP id 98e67ed59e1d1-359a6a3bc3cmr1764561a91.20.1772633849089;
        Wed, 04 Mar 2026 06:17:29 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:17:28 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RFC v1 17/18] PCI: uniphier: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:00 +0530
Message-ID: <20260304140329.7089-18-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-uniphier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..53f3bc9f5ba7 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -404,6 +404,7 @@ static struct platform_driver uniphier_pcie_driver = {
 	.driver = {
 		.name = "uniphier-pcie",
 		.of_match_table = uniphier_pcie_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(uniphier_pcie_driver);
-- 
2.50.1

