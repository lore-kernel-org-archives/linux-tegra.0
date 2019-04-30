From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: mfd: max77620: Add
 maxim,system-power-controller property
Date: Tue, 30 Apr 2019 17:55:04 -0500
Message-ID: <20190430225504.GA19387@bogus>
References: <20190424224900.8018-1-digetx@gmail.com>
 <20190424224900.8018-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424224900.8018-6-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 25, 2019 at 01:48:59AM +0300, Dmitry Osipenko wrote:
> Add new property that designates the PMIC as the system's power
> controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77620.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 9058499051e0..dda6d158b170 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -18,6 +18,9 @@ Optional properties:
>  			IRQ numbers for different interrupt source of MAX77620
>  			are defined at dt-bindings/mfd/max77620.h.
>  
> +- maxim,system-power-controller: Indicates that this PMIC is controlling the
> +				 system power.

Drop the 'maxim'. We have a standard property for this.

> +
>  Optional subnodes and their properties:
>  =======================================
>  
> -- 
> 2.21.0
> 
