Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2B3B4EB4
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633561; cv=none; b=o678NRgX9Oq9muHo32S4CYLSTzrYv1LRlXGyMaZZrCVv0V1UnbB6INDWwUgEUsDqLjaA22HSL/rl/CvpBv0kmFv2Lql7+NMxA2ggBUxZWXozKYRLkl6JLxlJkukZEK1rnSb+GDMKFUsUJ7wl7ZuPQWGSBqRO14lXc4CUMdOCVDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633561; c=relaxed/simple;
	bh=uNokBxxuyt+zPVO0vcOQK89zVSyGR0Yqq+jATpwqTR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amBYUis2MLSqp0kl8tBTcVgsPM/tYZl++Hw6764w5FTOHmkByXOqL+0e5xeD688pRLuBGfJO6CDbD3Ida4w5wSUQZkEGah1kD0Wc+PBHl7ImtHYR5lqKm71uRAfKRBV8r5s5SHeJFSKocJiLStS/WhaSBWldy2qemUMk3RXIG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaB/qiKt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaB/qiKt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3598c008455so2003391a91.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633559; x=1773238359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=SaB/qiKtUg1EEiMnY+AOLfojjqSUJ/zgyZ1Wl4KBgNMT9p+Yj8LRKxo2pUJFaZ5ANc
         E85LgaMsAND4ZfEMU19YvzxN5e9FmTF/tGVxohrPbzIzHkuC9xwlGg+jEQaXYKQfVZ4M
         H+C0UgQHh3/qyJ0CcJyPnIrlDMDFBpv71CwZY4WPS3cZVzjFA0nbpnH2CalhkWULoV29
         ofXVlYtTMxlznZkt08BKjNRlmK+OsWcHD4Zmgf2tQzObjiTn7+ofIwyzfN/+50BhqRy9
         i8upZ1v7vN91I7pZuIrKpFDhnoX8M4fMuDkSUk5w9ZgrVQyW2I0tyBDBugV6pEVnpaN3
         l3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633559; x=1773238359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wvXorwNx3S8EJD2J965xM8gci4hmlt6ydwx4B/ML9So=;
        b=KlFihpYZm5j+ieYvDR4lhIUZwuFaJ5a1LTlgJWhNSMyuWlnfVhgjL8nbfbHqoi3Eqw
         RTnkh8iJiRa9bYyqbyhYIFAzOzAR3tAdtL1kTgEZiQVCJSbFVr7F/EsmPBBVedMoVP3D
         CEQ3L6utOjVsjVmJdBf4vjMrg0O7tcD5+4bCUyBYc9cabGQwRMZlngnUqhZMsyLYPBKz
         qdRkRdt2bG0dgVu5X9xMgZzJNQyNxjQcxHGB0HZ16Ormdk8vzM9ftFgcgPEsaQlgZxKF
         Y5U92TSizaBtLe8zJ97Wj4g2yZG/Fw7pNGW+hHwof69QZAC6jwmRqO68llS1WMU4uhrB
         81fg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5tQ7JdKQ/Gysh/wtSE3vUfuaVJTsZlDELqLBAsZXiRzRZ5p/sg+Lg2p+ZFJZG/a7Ij6r2pM750MU0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCkjC7sbMv3MJQr1HYcS8PW1nQM1QYrMeLmFYnNAJtiuv1f8rl
	hfY4U3adfzTC5VyX9YgdlydUEMVLA5jS1h4VA4Ik/CbuqlJvJAHfI7Ey
X-Gm-Gg: ATEYQzxhPh7rR0h6MXOftsHO3okA4p+vCFGCZy3O+Cw38z3QmeFU4l7r3ws0tj3E3/K
	tmTag+q+UOVKvogKnziqjOtFUacLEjSPt2uFGFEeU2vP1oQWBRX6+qp9cccyxPVFy4nKEHvMilu
	8kVi6bt2GSj7QiqtBGzNaatXEXqa3UhnT6cnnG/bLk11ndONIffaXzp3hDucn41N3oPMMRGfExf
	9492lLCwBS3zsOnPcqrTsvsgdk07jRDAvbK8KhesX/uO8gmk5gF/tmcHJhpSD2tS5MqwVAnBYdB
	bUlkq+sDexpif8Kg/jAMsuHwZW56PInAnT8sDnJjOzIkn2kcvPCWnrL9UJhqYTOjPlhXIobj52L
	uY4haYSTnQb+AkmW6E7LYcS/C6wUGYFB+6c7Qqba5dEhiqAyVWif4/aJlxac9bX8Eq2RRMlbi5q
	FIp7eS8Whi0yhAu/fE1l64
X-Received: by 2002:a17:90b:3c46:b0:354:9b26:cdf8 with SMTP id 98e67ed59e1d1-359a69c774cmr2111843a91.10.1772633559439;
        Wed, 04 Mar 2026 06:12:39 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:12:38 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 11/18] PCI: keembay: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:54 +0530
Message-ID: <20260304140329.7089-12-linux.amoon@gmail.com>
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-keembay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2666a9c3d67e..a82d69b37e4d 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -478,6 +478,7 @@ static struct platform_driver keembay_pcie_driver = {
 		.name = "keembay-pcie",
 		.of_match_table = keembay_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe  = keembay_pcie_probe,
 };
-- 
2.50.1

