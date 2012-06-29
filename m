From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ASoC: tegra: use dmaengine based dma driver
Date: Fri, 29 Jun 2012 11:02:01 -0600
Message-ID: <4FEDDF89.1050907@wwwdotorg.org>
References: <1340969673-7776-1-git-send-email-ldewangan@nvidia.com> <1340969673-7776-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340969673-7776-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: tiwai@suse.de, perex@perex.cz, swarren@nvidia.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/29/2012 05:34 AM, Laxman Dewangan wrote:
> Use the dmaengine based Tegra APB DMA driver for
> data transfer between SPI fifo and memory in
> place of legacy Tegra APB DMA.
> 
> Because generic soc-dmaengine-pcm uses the DMAs API
> based on dmaengine, using the exported APIs provided
> by this generic driver.
> 
> The new driver is selected if legacy driver is not
> selected and new dma driver is enabled through config
> file.

This works just fine with the existing non-dmaengine DMA driver enabled.

However, I can't get it to work with dmaengine:

> # aplay ~/abba-dq-48000-stereo.wav
> [  151.613476] tegra20-i2s tegra20-i2s.0: dmaengine pcm open failed with err -6
> [  151.620557] tegra20-i2s tegra20-i2s.0: can't open platform tegra20-i2s.0: -6
> aplay: main:654: audio open error: No such device or address

I do have the following in my local tree:
68a67b8 ARM: tegra: add device tree AUXDATA for APBDMA
0db7a96 ARM: tegra: dma: rename driver name for clock to "tegra-apbdma"

I also fixed the compatible values in drivers/dma/tegra20-apb-dma.c so
the driver would get instantiated, which it does;
/sys/devices/tegra-apbdma/dma has a bunch of dmaengine channels in it.

(Note: This is on Ventana, although I doubt that makes much difference)

Is there something else I need to do to test this?
