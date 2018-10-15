From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/9] dt-bindings: tegra186-gpio: Add wakeup parent support
Date: Mon, 15 Oct 2018 09:46:12 -0500
Message-ID: <20181015144612.GA23929@bogus>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921102546.12745-8-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 21, 2018 at 12:25:44PM +0200, Thierry Reding wrote:
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
>  .../devicetree/bindings/gpio/nvidia,tegra186-gpio.txt      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> index adff16c71d21..cbb51a8990c3 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> @@ -127,6 +127,11 @@ Required properties:
>              - 8: Active low level-sensitive.
>              Valid combinations are 1, 2, 3, 4, 8.
>  
> +Optional properties:
> +- wake-parent
> +    A phandle to the Power Management Controller (PMC) that contains top-
> +    level controls to enable the wake-up capabilities of some GPIOs.
> +
>  Example:
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -148,6 +153,7 @@ gpio@2200000 {
>  	#gpio-cells = <2>;
>  	interrupt-controller;
>  	#interrupt-cells = <2>;
> +	wakeup-parent = <&pmc>;
>  };
>  
>  gpio@c2f0000 {
> @@ -162,4 +168,5 @@ gpio@c2f0000 {
>  	#gpio-cells = <2>;
>  	interrupt-controller;
>  	#interrupt-cells = <2>;
> +	wakeup-parent = <&pmc>;

If all the GPIO instances point to the same PMC and have no per instance 
data, why do you need this in DT? You can just search for the compatible 
node.

Rob
