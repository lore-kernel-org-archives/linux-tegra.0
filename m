From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 7/9] dt-bindings: tegra186-gpio: Add wakeup parent support
Date: Fri, 21 Sep 2018 19:37:06 +0900
Message-ID: <e6477bcb-4a1e-be60-d92e-a9d64accf687@kapsi.fi>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-8-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 21/09/2018 19.25, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra186 and later have some top-level controls for wake events in the
> power management controller (PMC). In order to enable the system to wake
> up from low power states, additional registers in the PMC need to be
> programmed. Add a wakeup-parent property to establish this relationship
> between the GPIO controller and the PMC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../devicetree/bindings/gpio/nvidia,tegra186-gpio.txt      | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> index adff16c71d21..cbb51a8990c3 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> @@ -127,6 +127,11 @@ Required properties:
>               - 8: Active low level-sensitive.
>               Valid combinations are 1, 2, 3, 4, 8.
>   
> +Optional properties:
> +- wake-parent

wakeup-parent

Cheers,
Mikko

> +    A phandle to the Power Management Controller (PMC) that contains top-
> +    level controls to enable the wake-up capabilities of some GPIOs.
> +
>   Example:
>   
>   #include <dt-bindings/interrupt-controller/irq.h>
> @@ -148,6 +153,7 @@ gpio@2200000 {
>   	#gpio-cells = <2>;
>   	interrupt-controller;
>   	#interrupt-cells = <2>;
> +	wakeup-parent = <&pmc>;
>   };
>   
>   gpio@c2f0000 {
> @@ -162,4 +168,5 @@ gpio@c2f0000 {
>   	#gpio-cells = <2>;
>   	interrupt-controller;
>   	#interrupt-cells = <2>;
> +	wakeup-parent = <&pmc>;
>   };
> 
