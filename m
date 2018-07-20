From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] pinctrl: tegra: fix spelling in devicetree binding
 document
Date: Fri, 20 Jul 2018 09:12:26 +0100
Message-ID: <5e51036b-a0b0-9cb4-4698-cf830309ef8a@nvidia.com>
References: <20180720075235.18617-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720075235.18617-1-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


On 20/07/18 08:52, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes a spelling mistake.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> index ecb5c0d25218..f4d06bb0b55a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> @@ -17,7 +17,7 @@ Tegra124 adds the following optional properties for pin configuration subnodes.
>  The macros for options are defined in the
>  	include/dt-binding/pinctrl/pinctrl-tegra.h.
>  - nvidia,enable-input: Integer. Enable the pin's input path.
> -		enable :TEGRA_PIN_ENABLE0 and
> +		enable :TEGRA_PIN_ENABLE and
>  		disable or output only: TEGRA_PIN_DISABLE.
>  - nvidia,open-drain: Integer.
>  		enable: TEGRA_PIN_ENABLE.

Thanks for fixing! Can you also fix up the one in nvidia,tegra210-pinmux.txt as well?

Cheers!
Jon

-- 
nvpublic
