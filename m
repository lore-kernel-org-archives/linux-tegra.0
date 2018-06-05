From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 0/5] Tegra20 External Memory Controller driver
Date: Tue, 5 Jun 2018 14:19:11 +0300
Message-ID: <20180605111911.GD27696@tbergstrom-lnx.Nvidia.com>
References: <20180603223654.23324-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180603223654.23324-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 04, 2018 at 01:36:49AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> Couple years ago the Tegra20 EMC driver was removed from the kernel
> due to incompatible changes in the Tegra's clock driver. This patchset
> introduces a modernized EMC driver. Currently the sole purpose of the
> driver is to initialize DRAM frequency to maximum rate during of the
> kernels boot-up. Later we may consider implementing dynamic memory
> frequency scaling, utilizing functionality provided by this driver.
> 
> Changelog:
> 
> v2:
> 	- Minor code cleanups like consistent use of writel_relaxed instead
> 	  of non-relaxed version, reworded error messages, etc.
> 
> 	- Factored out use_pllm_ud bit checking into a standalone patch for
> 	  consistency.
> 
> Dmitry Osipenko (5):
>   dt: bindings: tegra20-emc: Document interrupt property
>   ARM: dts: tegra20: Add interrupt to External Memory Controller
>   clk: tegra20: Turn EMC clock gate into divider
>   clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC
>   memory: tegra: Introduce Tegra20 EMC driver
> 

Series Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
