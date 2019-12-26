From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 05/19] dt-bindings: soc: tegra-pmc: Add Tegra PMC
 clock bindings
Date: Thu, 26 Dec 2019 16:24:47 -0700
Message-ID: <20191226232447.GA449@bogus>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1576880825-15010-6-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 20 Dec 2019 14:26:51 -0800, Sowjanya Komatineni wrote:
> Tegra PMC has 3 clocks clk_out_1, clk_out_2, and clk_out_3.
> 
> This patch documents PMC clock bindings and adds a header defining
> Tegra PMC clock ids.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml | 12 ++++++++++++
>  include/dt-bindings/soc/tegra-pmc.h                       | 15 +++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 include/dt-bindings/soc/tegra-pmc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
