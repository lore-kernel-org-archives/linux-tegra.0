Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD33C2737E3;
	Tue, 14 Jul 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030779; cv=none; b=sdwE+TdHv6PZ7awKPja9Q85MMPdeXIBU4Vc0+hBVPNbjoxF4OVUUfG4jBO/dOKGn4qCp2HbxPxk+5fHp85XzT4vST/vuw4wtYAKfx22WzcFF/KqXgCs6edXsq9bqgwNrCMAb1OBg9rZ6I7T1sZkFgrTf4sdHvPbEd9gN7PUhF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030779; c=relaxed/simple;
	bh=E+0jPhHMLYioaY9UG1rBQAy+IKtgN/+gffJXLYn4+4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5FAT5ecyBZbaNdZ7p73h8Vftq+64oFuwVuhphToM1AZbSIXy2/jg41o2Ca9kx23uqKwEIiMeyLzE90D051K/m0P0vCqYvl3kdBImrSmwLyKuXi0UNXoyI6Zyw1xl3gSEg5JXMNNrQ0a43prYC3/XMFmG/FyNjTVwwqwl0FKCcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JALI0fxf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JALI0fxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985521F000E9;
	Tue, 14 Jul 2026 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784030778;
	bh=zXjAh2537yo9G5vWAgQyYke6ki6Lnw1UTZmZWsxbjhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JALI0fxfqvUbwOcumUkWMdf9+m8l9v/z9X4lZj/ehsLJwp7ooqiwniR8gwMwjlGX4
	 KQm5hPhANenPfd2Bwl7Lw10CTxhcLtoJlVyhmsg2A4CH0cM2OlgloQDORZXOtineLC
	 LSXy7jBY23Sl0ZuCS3XZeGNWqADdOIypDvJINA7+5rlsAPvHLK4n6INGqXPYHq43z0
	 TChJyIoFjVyZF6bcTAaSLXrQYMnVCU5gag1jLCsHntMDSLG6NIQt9Oy31Q263sVXSw
	 1vNiRk46Ol5RAtKDAakIkefOUYXtHCPa0UXek/BlAs8NXTFuLNcB3vZN6MkZkKKMuD
	 FpfTkmjJaiaEg==
Date: Tue, 14 Jul 2026 17:36:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Pan Chuang <panchuang@vivo.com>, Frank Li <Frank.Li@nxp.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	"open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>,
	"open list:FREESCALE eDMA DRIVER" <dmaengine@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS/LOONGSON1 ARCHITECTURE" <linux-mips@vger.kernel.org>,
	"moderated list:MEDIATEK DMA DRIVER" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:MEDIATEK DMA DRIVER" <linux-mediatek@lists.infradead.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:STM32 DMA DRIVERS" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 00/26] dmaengine: Remove redundant error messages on IRQ
 request failure
Message-ID: <alYmNl--mxMK1-86@vaman>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <ak-vkQ8g_ePdY15f@shikoro>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak-vkQ8g_ePdY15f@shikoro>

On 09-07-26, 16:26, Wolfram Sang wrote:
> On Thu, Jul 09, 2026 at 09:58:04PM +0800, Pan Chuang wrote:
> > Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> > error handling in devm_request_*_irq()") added automatic error logging
> > to devm_request_threaded_irq() and devm_request_any_context_irq() via
> > the new devm_request_result() helper. The helper prints device name,
> > IRQ number, handler functions, and error code on failure.
> > 
> > Since devm_request_irq() is a static inline wrapper around
> > devm_request_threaded_irq(), it also benefits from this automatic
> > logging.
> > 
> > This series removes the now-redundant dev_err() and dev_err_probe() calls
> > in dmaengine drivers that follow these devm_request_*_irq() functions,
> > as the core now provides more detailed diagnostic information on failure.
> > 
> > Pan Chuang (26):
> >   dmaengine: fsl-edma-main: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: fsl-qdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: loongson-loongson1-apb-dma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: mediatek-mtk-cqdma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: mediatek-mtk-hsdma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: mmp_pdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: moxart-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: owl-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: qcom-gpi: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sf-pdma-sf-pdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-rz-dmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-shdmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sh-usb-dmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sprd-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: st_fdma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: stm32-stm32-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: stm32-stm32-dma3: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: stm32-stm32-mdma: Remove redundant
> >     dev_err()/dev_err_probe()
> >   dmaengine: sun4i-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: sun6i-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: tegra20-apb-dma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: ti-edma: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: uniphier-xdmac: Remove redundant dev_err()/dev_err_probe()
> >   dmaengine: xgene-dma: Remove redundant dev_err()/dev_err_probe()
> 
> One patch per subsystem for such trivial changes, please.

Yes pretty please

-- 
~Vinod
