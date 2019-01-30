From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/4] mfd: max77620: add documentation for low battery
 monitoring
Date: Wed, 30 Jan 2019 13:53:55 -0600
Message-ID: <20190130195355.GA1652@bogus>
References: <20190129085531.32364-1-markz@nvidia.com>
 <20190129085531.32364-5-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129085531.32364-5-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: lee.jones@linaro.org, blaws05@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 29, 2019 at 04:55:31PM +0800, Mark Zhang wrote:
> Adding documentation for low battery monitor properties:
> - maxim,low-battery-dac-enable
> - maxim,low-battery-dac-disable
> - maxim,low-battery-shutdown-enable
> - maxim,low-battery-shutdown-disable
> - maxim,low-battery-reset-enable
> - maxim,low-battery-reset-disable
> 
> Signed-off-by: Mark Zhang <markz@nvidia.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77620.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 484b17e4fba5..5fed0a463b80 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -142,6 +142,20 @@ Optional properties:
>  			Device supports 100/1000/3000/6000 Ohms.
>  			Default will be set to 1000 Ohm.
>  
> +Low-Battery Monitor:
> +==================
> +This sub-node configure low battery monitor configuration registers. Device has
> +support for low-battery monitor configuration through child DT node
> +"low-battery-monitor".
> +
> +Optional properties:
> +	- maxim,low-battery-dac-enable: Enable low battery DAC.
> +	- maxim,low-battery-dac-disable: Disable low battery DAC.
> +	- maxim,low-battery-shutdown-enable: Enable low battery shutdown.
> +	- maxim,low-battery-shutdown-disable: Disable low battery shutdown.
> +	- maxim,low-battery-reset-enable: Enable low battery reset.
> +	- maxim,low-battery-reset-disable: Disable low battery reset.

Do you really need 3 states with the 3rd being prop not present.

Rob
