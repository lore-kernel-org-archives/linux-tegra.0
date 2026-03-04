Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927A364EBC;
	Wed,  4 Mar 2026 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644929; cv=none; b=W3zx1Iw53r9uZyXm0FxHsjScUVL0UBM8zdXS1/df0llyeHHX2raGMYYdsbyitQ3ciUqGrti9eHpsIDE0N2Hl8eKMxZV+Pc1cXkVkgspCJIHx1wvlZ9FQXOcIDHysYyhrpuT4+bpXElvS8RENPI1XQVj1PDbKFQTscvAOInrRx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644929; c=relaxed/simple;
	bh=OBWedZ9p+vSO6yGoQJ34u4GdxgLY6azj8PDvZsrfAxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/Jc135gpcpdeYPO4Pdgf6NqFsbQ8QpWJM2zhCRZGzOb+uutCsYXVuo9L7cKYS7p4KTnQn/kr+HmfVTsb1GLq9p5tuFTRLTJ7eCE0p4Fc0dd/s0zOKL32k/0A/Jr52tWDjAsSac7O+imoGA+Qq1OIq0PR4J31YJr2ZCaxkzpZC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AC7C4CEF7;
	Wed,  4 Mar 2026 17:22:02 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] irqchip/gic: Use GIC_* DT binding definitions
Date: Wed,  4 Mar 2026 18:21:55 +0100
Message-ID: <cover.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

There are still places in GIC DT bindings and GIC-related drivers where
magic GIC and interrupt numbers are used, instead of symbolic
definitions.  This patch series tries to improve upon that.

This series has been tested on a GICv4 system.
The last patch causes no change in generated code.

Noe that the first patch has a contextual conflict with "[PATCH]
irqchip/gic-v3: Print a warning for out-of-range interrupt numbers"[1].

Thanks for your comments!

[1] https://lore.kernel.org/62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be

Geert Uytterhoeven (4):
  dt-bindings: interrupt-controller: arm,gic: Document symbolic
    definitions
  genirq: Document interaction between <linux/irq.h> and DT binding defs
  irqchip/gic: Use GIC_* DT binding definitions
  iirqchip/gic children: Use GIC_* DT binding definitions

 .../bindings/interrupt-controller/arm,gic-v3.yaml  | 12 +++++++++---
 .../interrupt-controller/arm,gic-v5-iwb.yaml       |  2 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |  2 ++
 .../bindings/interrupt-controller/arm,gic.yaml     | 11 +++++++++--
 drivers/irqchip/irq-alpine-msi.c                   |  4 +++-
 drivers/irqchip/irq-bcm2712-mip.c                  |  4 +++-
 drivers/irqchip/irq-crossbar.c                     |  8 +++++---
 drivers/irqchip/irq-gic-v2m.c                      |  4 +++-
 drivers/irqchip/irq-gic-v3-mbi.c                   |  6 ++++--
 drivers/irqchip/irq-gic-v3.c                       | 14 ++++++++------
 drivers/irqchip/irq-gic.c                          |  6 ++++--
 drivers/irqchip/irq-imx-gpcv2.c                    |  4 +++-
 drivers/irqchip/irq-meson-gpio.c                   |  4 +++-
 drivers/irqchip/irq-mst-intc.c                     |  6 ++++--
 drivers/irqchip/irq-mtk-cirq.c                     |  4 +++-
 drivers/irqchip/irq-mtk-sysirq.c                   |  6 ++++--
 drivers/irqchip/irq-qcom-mpm.c                     |  4 +++-
 drivers/irqchip/irq-tegra.c                        |  2 +-
 drivers/irqchip/irq-ti-sci-inta.c                  |  4 +++-
 drivers/irqchip/irq-ti-sci-intr.c                  |  4 +++-
 drivers/irqchip/irq-uniphier-aidet.c               |  4 +++-
 drivers/irqchip/qcom-pdc.c                         |  4 +++-
 include/linux/irq.h                                |  4 ++++
 23 files changed, 89 insertions(+), 34 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
