From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: mfd: max77620: Add compatible for
 Maxim 77663
Date: Tue, 30 Apr 2019 17:53:49 -0500
Message-ID: <20190430225349.GA15733@bogus>
References: <20190424224900.8018-1-digetx@gmail.com>
 <20190424224900.8018-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424224900.8018-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 25, 2019 at 01:48:58AM +0300, Dmitry Osipenko wrote:
> Maxim 77663 has a few minor differences in regards to hardware interface
> and available capabilities by comparing it with 77620 and 20024 models,
> hence re-use 77620 device-tree binding for the 77663.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77620.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 9c16d51cc15b..9058499051e0 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -4,7 +4,8 @@ Required properties:
>  -------------------
>  - compatible: Must be one of
>  		"maxim,max77620"
> -		"maxim,max20024".
> +		"maxim,max20024"
> +		"maxim,max77663".

Drop the period so we don't have to remove it on the next addition.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

>  - reg: I2C device address.
>  
>  Optional properties:
> @@ -105,6 +106,7 @@ Optional properties:
>  Here supported time periods by device in microseconds are as follows:
>  MAX77620 supports 40, 80, 160, 320, 640, 1280, 2560 and 5120 microseconds.
>  MAX20024 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
> +MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
>  
>  -maxim,power-ok-control: configure map power ok bit
>  			1: Enables POK(Power OK) to control nRST_IO and GPIO1
> -- 
> 2.21.0
> 
