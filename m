From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: tegra186-pmc: Add interrupt controller
 properties
Date: Mon, 15 Oct 2018 09:47:13 -0500
Message-ID: <20181015144713.GA7327@bogus>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921102546.12745-2-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 21 Sep 2018 12:25:38 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PMC can be a top-level interrupt controller that provides the top-
> level controls for wake events. Add optional properties to mark the PMC
> as interrupt controller.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt      | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
