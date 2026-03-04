Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF3C3A8741
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633270; cv=none; b=S7g9OVrgC6Rzo3Nfido2nv/rMe1MQtd1Imms/H/LvS0nDvvZ1eP77br5wZa7gx+hIWliBtZOnU6pLadXuX9TXLIZnL6N8kDz8JFytoBe+Hdh81qJ3jIjkBSvZ/7lkYfbxOVHXITvPZ6zdnanAH7/9h8V3OA12stBRsU2CHIWH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633270; c=relaxed/simple;
	bh=HhGm9Ohbx6JvMZfjKoxj9JVYSgMdWeij6sbTSI4muf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bl+tf8qKUMIPXKMI7CGN6n8Zyn/kOGBzPUai9WIa0NkYdIL9UoTiN905mALMGj3FYUKVrZiKbDXKEcHEVBvi3rACkAGNfY7uT6D4UW2eav1MSdB+5rN4BhI5jwLlRxEasvpJi+XBbyeb0uAYaiSQhOAVVQYquo1ahfpaKxbEneY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3dfq/BK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3dfq/BK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35983877dc5so1742662a91.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633268; x=1773238068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=L3dfq/BKd2UHFBSK49/tWZVNayTscVsi4K7dS22j53FBnyMedu1YoWrbLDXhSnTKbO
         OPOginDL78Ww60xffXl5Y5QCEUuIvouj4oEqZ+qNbFxfhvuHvakoQXg6JpKpJRePhTT1
         K4HA8a+Wv7z1c3R8NAdAmJnYwJZNy/vnjtu1r6CIip5TLxXJkuObfA9IRm8APyxynsvY
         t+MAQuOoUycygQcAoLKh+grQzul81PKIj8P8EpK8TK1vKPPLMDQFd/cMI6PneP0HNbJP
         ddRCvAGYzILWjWMXmAAbisLIlhDjQHZpB2Wfoq5u4ZLP0imfVPG+PBRXWJQBChkPMv/N
         dreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633268; x=1773238068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=hK4FA1UCYejfZgan2wcWb/lMGysqPw1Jsy+H70JLVkcGp9tTLq8T4gcW+JOqBQ+ED7
         PF110wcBecpo7YDcKbYpdL80Iyr2HyOhbzeFjDepgodob0fGuUtyPCzeVVeAqQpfkfFe
         KaB+sZwN0ng1DozLHm4dMWOJmmRQ925P18HONncp8BzSU+/hcmljr7jkalOXkn6bLH9M
         1wQkhX/0rji6gmz15m8zGE/JUV27v43DERLtgeUhgFvFeGcDmGy+FmyPwgbfLZwTFpPs
         IyCpSsn3IiVxIdKxQeIHhudnmfCAUFaeZHRn0DpU4wK+SXqeVIW+njzHAVLBt/EnLv27
         hgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMEfEMel5vAC8p8KESTbKtHsiKUlpzOhT462KH7DaJSVaQm3hyBhydWD//5BbtTiGJvTPlYs++cxbqYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPXqg5jUWJxzJNKPlephvLSHCdZAl1fy8jHHrRhVkd4LSdO9Vk
	Pu0vKCmsH034luz54JE5vv+LfywzugbSnc8dnw6bbmzhsY6ZswQwpnVg
X-Gm-Gg: ATEYQzz7uClLDm9ByfnMSlIA5ngyeQfw/4KbpKzKwkdptU9gAeNKxWsed2mGabvlYsJ
	ZXrmNYHrs8gtiEwrU04b54mc/aCfb91Sj4lrjkWt6OcQ1HsLbJbhW9enTaPE8uUV+RXNPubd63W
	NSWyf+9eghkFmmveaYmp3MvGs5HlfUGZqdD2LaP1j7vTfQ0KZaunphz6bRJo7NVIT82ekAeJnlr
	wVgkR3rKYmSINhkjNbwG97pubptsj3u9bf9hi3moYXFThpMj4k0/VRCSpj1O1Nf/Bx/eoxkZr/9
	tNtSXaUczqOF5VcCXacJPMNnNuykgM+BC0aHtC5+l2HrZeR6POubfafQMEmHWgcFX0s4LeJHz0q
	WrgweKOUBd8ygDMVTV5TaSmNXJr3k6OCLgZNRCPm9Gk2QCBLUyBbpQCmWWaLkFBJiJoadkTxnjq
	g0Qvy4u9s4o7PuMLffDzpc
X-Received: by 2002:a17:90b:3f83:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-359a6a4a2fbmr1903833a91.21.1772633267856;
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
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
Subject: [RFC v1 05/18] PCI: bt1: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:48 +0530
Message-ID: <20260304140329.7089-6-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-bt1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-bt1.c b/drivers/pci/controller/dwc/pcie-bt1.c
index 1340edc18d12..ef6a3c7fa279 100644
--- a/drivers/pci/controller/dwc/pcie-bt1.c
+++ b/drivers/pci/controller/dwc/pcie-bt1.c
@@ -636,6 +636,7 @@ static struct platform_driver bt1_pcie_driver = {
 	.driver = {
 		.name	= "bt1-pcie",
 		.of_match_table = bt1_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(bt1_pcie_driver);
-- 
2.50.1

