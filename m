Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8AB3B5314
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633077; cv=none; b=qkHj2CXGsCq003q4UfPB10kl77Z0EM9SSiYeGoPLEV0xrfxeBfbsVvPp5qp001Vq5aeVhe3o/67du68cn951jWCbGpsbIwNaIwDqYkIHHOYoopFFzX9+GxlMri3gkMkxpMMf8rk7ba4wGcrkXa85cAyWUQKQSFgiojZ1Pf0YDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633077; c=relaxed/simple;
	bh=fysw4+7uigVqwi3HpSXPiZOY0cBAcQNqSX3ljElSVyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/fvHRC39TgZsOtKWlLYB662uQ1KsIpegbvvnWzr6V4MGC0A0BGz8pG/X6tw15GMEsDJUbdcxF+i+8cK3BL6ROZflOirI0TOWnPsTBMpSWZ0g4xqOB9wogk8gV95Korv80Y+5QE6yPHPGwU+n/ZrMkmRohqo7Rw9hwFsTI6K3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P82o5M37; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P82o5M37"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4142092a91.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633075; x=1773237875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HTAseI2RZvMiSq6piqVCjZa6XAi6fGRFqwpnmtjoWI=;
        b=P82o5M37MaotPz1tYMfxW+okAT85R5oHUFQ7cIRyQEvuZyOEecLcUNidCseyoIUcLZ
         GsaHIWi1+HLYqxoEq5aufiOe1uhk+4JgzK+A0sJPXP+G6+tjwRi7LDBJqM+a0nnfzuia
         aVwG8xstGLERkT3TUgyE4YVpd7GxZAMXcOlDYMCYDxxObv3qRZjbzsUJsdacoGZlPUbJ
         Rhlx6uR60hSE38luVxLa0T5J2j19GPNtSO3iKMrPPBqyMb1/EAkqPPJ7kLCWxXvpVeT4
         WYJJdWwfyeDqcocTU653UbgptobOy8TmqCqY6yvUFfm/QzFgVjHBQHMyU/5etNjy7kOZ
         5giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633075; x=1773237875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HTAseI2RZvMiSq6piqVCjZa6XAi6fGRFqwpnmtjoWI=;
        b=UjyxLs/khxFwZMNPXQtU0gl995u4eH451/E2dkqk5bf9Ee6WBXownaR1bhZhDxh5gF
         bbIFVtNbRdFZ82Rq+dFtvWoClR/1dWy07BkHypTPguD61XB6B8hLa2MaGHedd0xYVx+t
         KuTaP9ZGq4lcmEfg+xgyW4YEt211Y/Q0KKYOUFYfMRyK+ZkGwq+XHXjL33bGCcYE+9ch
         kD7IAGnfVFSN7UJ1FLcqtmneSrjZIfI/XL95lgNoxh2ETqUoHTzwfIBq5nNgAS9vKjId
         yVFAHVkMg3CHBKf36LHqFbQfhjJniQ82L4LaVjkAE7ie+9NC9Iycr67I1bWO8nyjPogi
         WWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9LoYbdeWg+YwBZSya2Z02htaJ5eIryejwy+hnHaBzxjRbwMbWQqYbBWeMH02hQX1uu14aci7PgE17BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygQcup63E8aBB5T97NguAqeY580DVJPtU79ggsBKBscipTHvJE
	s+u5tB0f+6jGkzYakKGIFtEog8Qxfocw/qDxugKaDrjl/1gluaZvPseu
X-Gm-Gg: ATEYQzxBhALDiXID8KAug9KGDkvnE4ZB9oqZLuYrZ7GwILlfiw8pIivfUfosanxC6HH
	0hVpoi1POigoXw7yS+iOKwbNtQ+d75VRPzjyDgBTgWEp4FCn3x23zehheLbeZubxXluO/uyrOCM
	uu/PgKqJaizC5gR88LAOyOcbQi6r6zor6YjKal29JHwkuAQslqSKD/zzoM3ZVYiXk4casU6WDVt
	9xSbG9OcB6B4SNREprn0BOiSXmaoGofrVRyjILUPjwm8v/iklp/DBkqMHRbIiLbJqe+7EoPZZhS
	XZz/BCCBjZiX+YUivNihNcEoERY+O0dCztdQpKsrrCvIRV43a4nFWHdpftTmE677nSjVPY65qej
	wuxsafYdgHUhLcnVLhxfcL77CV6uuDwF9m8aKaAyX/hsJ8UONEW/zFYBNcv527o+Ou+elaUOZc0
	9SrQ+52XiLFMO7KAUfbEwnaiRSNrV/0EA=
X-Received: by 2002:a17:90b:4ecd:b0:359:120f:d3aa with SMTP id 98e67ed59e1d1-359a69e5682mr2092330a91.14.1772633074556;
        Wed, 04 Mar 2026 06:04:34 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:04:33 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Hans Zhang <18255117159@163.com>,
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
Subject: [RFC v1 01/18] PCI: al: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:44 +0530
Message-ID: <20260304140329.7089-2-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-al.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index 345c281c74fe..6e3f52ccc1fa 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -383,6 +383,7 @@ static struct platform_driver al_pcie_driver = {
 		.name	= "al-pcie",
 		.of_match_table = al_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = al_pcie_probe,
 };
-- 
2.50.1

