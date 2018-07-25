From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 5/7] dt-bindings: Add Tegra PMC pad configuration
 bindings
Date: Wed, 25 Jul 2018 08:50:49 -0600
Message-ID: <20180725145049.GA2407@rob-hp-laptop>
References: <1532084355-31482-1-git-send-email-avienamo@nvidia.com>
 <1532084355-31482-6-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532084355-31482-6-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 20, 2018 at 01:59:13PM +0300, Aapo Vienamo wrote:
> Document the pinctrl bindings used by the PMC driver for performing pad
> configuration. Both nvidia,tegra186-pmc.txt and nvidia,tegra20-pmc.txt
> are modified as they both cover SoC generations for which these bindings
> apply.
> 
> Add a header defining Tegra PMC pad voltage configurations.
> 
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  92 ++++++++++++++++++
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 103 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h |  18 ++++
>  3 files changed, 213 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h

Reviewed-by: Rob Herring <robh@kernel.org>
