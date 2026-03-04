Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB763B582E
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633609; cv=none; b=XMkKP8XQY32sXwRBE4NEbqWo1uV74DGelPMgiR4miZ4pRSFySa/U/ldYwp1HNcA4lhxRPt/k/2tDi0rXl7BQpHKd+3kjf8SVDBMPHyY7cAQhxPZ821+C4qd8IqFbMwJ6tHce/l35U2EaGjomKFkFKtKOZD0+Kp6GSg8hh7KAOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633609; c=relaxed/simple;
	bh=hQjxT6/mWIpy+sa8NLac0lsuvVehqMlGMOKEzaLhgSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmN8ObR4aNYrAzkcY4eC5BwU6Kis9Fj5e9pSjcI7xGRCp9qvpOamP8EfP6q3tI5DHd3F8V8BGpZ/LxsnF7xqUa+N6w+FxYSjsIHj/xkS/FcyzUNviqOS3Ktt9Ou6hwJO4pb08hTx0DMlTlOq/wAYRGVITjbMqGkwwbX2FbFS67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWMeVW81; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWMeVW81"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82748257f5fso3610857b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633607; x=1773238407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=bWMeVW813iBYyWQUDrTidRXEo0VfwXLT7opiGAiGea9c48cT5a6WCwYwudlWWMPigt
         0PpZy574M1S64crl3NGETg2ke5yUA2s2HatW2B274oJn/w3GZ47CVF4O3wjPysyc4c0B
         Z0hUgppcVdENN+Uqf+jW+jRNjptJs0A1vOvJiOoAUt4SS9hRXhyDORF+3U8Fg8+4AJdQ
         cb9ZvfLpRgEE5NtC2D5jVJckfzgj+t+gC6lk0q+T1/zCEmoW3iAnIzheb3FBTfDx/rT/
         JTjw36zF9N9RTgARlbSqcAwOSmvsjtJalMjCq9CSI1WEzf4oC1JCTpSPrWmnOIGfMuq0
         C56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633607; x=1773238407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=Ilk56MUU6xHky0Pnj+jjugnlPUW9HPKPPFtfMLR1JHY5tS/YPC5Qmu8d71Mv1Nf2yL
         C7OVW4JYuYb6Qcu4e/02PFr701zr1XZ8PRAmQbwMySGtQDYWOvf5bn6cnMROPNOxR4Cu
         VajKPV9BsqiEWvNvEORk/FfnNcCYUmExVNLSclONOLhU7eiSYANaS4E//F8NvREFK0/j
         THXWB6ZatADb17nmGKZ7ZlgpZC4cWwIY8S63rckFb9TRzq5U6UgrVf9m1DxlDYPIc8SL
         RCD3GqyEHkdMrsfoskqx112/XEUezhoztAxLTk0fTKEy5DPRSN8IkY6Kwfp07RINCUdo
         GVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgEefJEyQbirFZQhtFTf8oh2aTDGinTeBaDVYlgV6AORomuSIaOrBTkZiQ2P0i9PYHHOUw6C4M1MhtVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7CTiLhFgu9zyaP5TDnkaX9pAy6TLQEKqe+tSK/HXF+gGuiYcK
	/H9bvxFYEdAoVeV3Q4JTecQpg2mB5v7rNFK4dWrlNxOMv4HzmlvVnO1Q
X-Gm-Gg: ATEYQzy3wC4rVaEeiDO1ZMeefVnORKQAlCJasyxTPbzf7h2LHwQkAa77xMUt7JAqKfl
	poGj7x4i7ha5XsrFx7gTW0pI/F/5l1CXRZr9PY0Tc6b4PUM824Pz9mF15ExsN+WVcWPy8hHNtkC
	/tvnfLU26O7ZVsM7FoefGL4r+23K1Nd35eKe/WwL1CDEV7bqoV7lwY+3wZTQ+oqjH6qi7Z74Oon
	7u7tieegK+RUmRAhMNQUfcH1LR9QBfDszQCecA4qqzEMdpT7/jtOjU4mBkwDmgoqRP/HbW6qPwd
	PbyF9N8UD2DTB1o0omgAnaPF0muLL6Ym7lhd8n3kHluxayfViQ5YzvPsl+KThv9cH/525XCT/6b
	POENXDxGeXxrYOzL3D7s/9LyN5JZ05K8AqdN4pkh2luy8yNbdlxzTN5woAKl5xcvJHdWHrxPhBp
	NbGtMLwq81un8NGY1V59JX
X-Received: by 2002:a17:90b:5286:b0:359:83a3:584d with SMTP id 98e67ed59e1d1-3599ce32dabmr5222786a91.6.1772633607253;
        Wed, 04 Mar 2026 06:13:27 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:13:26 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
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
Subject: [RFC v1 12/18] PCI: kirin: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:55 +0530
Message-ID: <20260304140329.7089-13-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-kirin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 91559c8b1866..bc905056a9d7 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -757,6 +757,7 @@ static struct platform_driver kirin_pcie_driver = {
 		.name			= "kirin-pcie",
 		.of_match_table		= kirin_pcie_match,
 		.suppress_bind_attrs	= true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(kirin_pcie_driver);
-- 
2.50.1

