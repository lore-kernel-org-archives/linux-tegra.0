Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F593B892A
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633175; cv=none; b=pbMV8VgNFholv+nqUpqAxaztWmLdGe9/VxmGLyqqBNAhgp4qb5EVVjz1otEybCBCwV2gMe14k9tu5+eMKmoTN0jcjnn3vweodOHCktGCrsa3hvOaTJ3/m9xR3EL+oKv4bQhiyCMr93eoR+OxMezIZTw2pP/iBA+3/iXkQbNnh70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633175; c=relaxed/simple;
	bh=IoX1lY8Yyzmbm1I9IV2ELUEQxT0pxCd3QQREluW47Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBB1ARA9CATSmn0XjgQImgToY1pNULZpFR8J1Yksw3LZioBb4kLDV9WpIw15pLMk6vtpn+8mKicfy39HI2GW1OfQQbmyOyMjFxudl+r/lLGiFJy/LSBU/zG9dSPMmg0dqqRZBtf8CJOUvhRfftS1n0x4Wo5mQXsnf+QSoXgybRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJkMFrCO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJkMFrCO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4144427a91.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633171; x=1773237971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=XJkMFrCO1iVKZ0jMZF2txTQgXtd4dl/KXihiOoxMhOflFE3ciqYKTmYMaIGT2H1ZuZ
         5Ni4q7adDZf8kndVvssS0oRP+UjjqvzYCH9D26tRvBm/z1ZgnLg0bLN7R6KQL761oSi8
         5WY5AmL4BcCZOfe6Tq2bts2rDLwJsPe2V1InLXYVaYsjbB7VuUTMbOplZB7gwMMMBQwP
         jT+w7pD4rSmZlpZcfwzvGnZR7hxMLN1Ub5M8ALz43DgsLBU4BB0wJY9OI9YbBnEpstvz
         eU4vAZg2AAi6rOmk/qW4lSoPweExFxIDWXTHILWDJ/OTTsor5VY2JQGXgUIxYqKEaPGY
         +81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633171; x=1773237971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=MSUbIuyuv92pDFhfJbuF/n6yyBAJhb8BDUF6BoAhzXPM1tGumh0Wg1K9EQ0ODeT6PK
         uphLWu5yqqR3EKrzB6/ziM4wGnj8LPmpQjVwOeEuWF4rr7rWRHfxOD1sRu5yxzGcTTNV
         T5wmJOHEu1Y9ZfuvbIh+QZNAQPWZD3KAMuy6J64HUoyFC1XN+USJvkcQI403LYPpi7LM
         Q5ieHZVl56sxi9EygdWmphyjebKhAxPzJIfrMz7Pm9besT49k13p3pcE5FxLbqqRZFx4
         dxF3VyybVcOVBJZZLpex7nQdbXFwHSlC9ZtmcC2AWtu6LwI4NZYtIwp+z8iXxI9vZCmZ
         hMlg==
X-Forwarded-Encrypted: i=1; AJvYcCWLNvOAOgg+UpMTjyetDIvQnk6mbfAYBqguJ82jPpcOBCSea8m8vAZmMOKxl45NmLXygnpelzDN0se76w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4WOhTtpmXH63Qn2tVc/3ZxUT+taQlx+G22O4aHatSAxTftW9
	p/dl2RqfxUGDcRljCsnOIKawDJflna9xr8sw7odLe/ISykmij8+99CN3
X-Gm-Gg: ATEYQzxEbLjhqAeR4Mx5n4CNvDiwxY3TwXNzuEJUU/J2+obKK/kq/qf+aBRGvrrNXoZ
	E6A95GCE/GdHAmy84dT68BmrNS9THWLZx051RSHhw6JHuNW0uWvWXrVviHuGL2Jk8tnWJ42EAN2
	ro+LN62gskamEGLqzL+Rt9U3OkMv+TRPRBverBZvbPKGvCthmTPMrch7vAImkrGuCT0Tb4i1fV1
	hWORQHtNR/Ji+XVDSux0vm+Bcvbd7T5Xjzz+cFMyBcjGREOqbf9oGC6LfviAB4BGi9ejmmTiSuJ
	I3O2kYk9zBIPNoIULn7KwoJ0NW5tjb1pYv1VbfFmkZNlBQ+hjYxUBQNpaOG9x4/0o+eS3S0iIW6
	RIKmjrz4v54oo7OVTZy03kd4gmcrHq0h1hvAnvevZUMcFC12VLL+ZWf3fA2GYDHxZRPoIGGk/ZK
	Sv3likfjQvGHCG/sPGLn3j9XaDnAHVx7c=
X-Received: by 2002:a17:90b:2888:b0:359:7906:d996 with SMTP id 98e67ed59e1d1-359a6a66a94mr2076415a91.23.1772633171145;
        Wed, 04 Mar 2026 06:06:11 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:09 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 03/18] PCI: armada8x: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:46 +0530
Message-ID: <20260304140329.7089-4-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-armada8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index c2650fd0d458..ffb5554a2a8d 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -344,6 +344,7 @@ static struct platform_driver armada8k_pcie_driver = {
 		.name	= "armada8k-pcie",
 		.of_match_table = armada8k_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(armada8k_pcie_driver);
-- 
2.50.1

