From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v1 0/5] NVIDIA Tegra AHB DMA controller driver
Date: Thu, 28 Sep 2017 15:01:04 +0530
Message-ID: <20170928093104.GC30097@localhost>
References: <cover.1506380746.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1506380746.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 26, 2017 at 02:22:01AM +0300, Dmitry Osipenko wrote:
> NVIDIA Tegra20/30 SoC's have AHB DMA controller. It has 4 DMA channels,
> supports AHB <-> Memory and Memory <-> Memory transfers, slave / master
> modes. This driver is primarily supposed to be used by gpu/host1x in a
> master mode, performing 3D HW context stores.
> 
> Dmitry Osipenko (5):
>   clk: tegra: Add AHB DMA clock entry
>   clk: tegra: Bump SCLK clock rate to 216MHz on Tegra20
>   dt-bindings: Add DT bindings for NVIDIA Tegra AHB DMA controller
>   dmaengine: Add driver for NVIDIA Tegra AHB DMA controller
>   ARM: dts: tegra: Add AHB DMA controller nodes

I don't think they are dependent, so consider sending them separately

-- 
~Vinod
