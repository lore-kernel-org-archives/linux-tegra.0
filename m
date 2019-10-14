From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 08/11] dts: arm64: layerscape: add dma-ranges property to
 pcie nodes
Date: Mon, 14 Oct 2019 16:29:28 +0800
Message-ID: <20191014082924.GI12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-9-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924181244.7159-9-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, linux-pci@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, mbrugger@suse.com, robin.murphy@arm.com, f.fainelli@gmail.com, james.quinlan@broadcom.com, wahrenst@gmx.net, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 24, 2019 at 08:12:39PM +0200, Nicolas Saenz Julienne wrote:
> The bus behind the board's PCIe core has DMA addressing limitations. Add
> an empty 'dma-ranges' property on all PCIe bus descriptions to inform
> the OF core that a translation is due further down the line.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Applied, thanks.
