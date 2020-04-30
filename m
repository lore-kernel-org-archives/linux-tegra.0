From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Date: Thu, 30 Apr 2020 09:07:01 -0500
Message-ID: <20200430140701.GA21776@bogus>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200417170825.2551367-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 17, 2020 at 07:08:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The RTC present on MAX77620 can be used to generate an alarm at a given
> time, which in turn can be used as a wakeup source for the system if it
> is properly wired up.
> 
> Document how to enable the RTC to act as a wakeup source.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/mfd/max77620.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 5a642a51d58e..f05005b0993e 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -125,6 +125,17 @@ MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
>  			control) then, GPIO1/nRST_IO goes LOW.
>  			this property is valid for max20024 only.
>  
> +Realtime Clock
> +--------------
> +The MAX77620 family of power management ICs contain a realtime clock block
> +that can be used to keep track of time even when the system is powered off.
> +
> +The realtime clock can also be programmed to trigger alerts, which can be
> +used to wake the system up from sleep. In order to configure the RTC to act
> +as a wakeup source, add an "rtc" child node and add the "wakeup-source"
> +property.
> +
> +
>  For DT binding details of different sub modules like GPIO, pincontrol,
>  regulator, power, please refer respective device-tree binding document
>  under their respective sub-system directories.
> @@ -159,4 +170,8 @@ max77620@3c {
>  			maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_SW>;
>  		};
>  	};
> +
> +	rtc {
> +		wakeup-source;

Is the RTC really the only thing that could wake the system in this 
PMIC?

I don't think it's really valid to have 'wakeup-source' without 
'interrupts' unless the wakeup mechanism is somehow not an interrupt. So 
I think this belongs in the parent node.

Rob
