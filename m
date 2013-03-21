From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V2 1/4] ARM: tegra: dalmore: add cpu regulator node
Date: Thu, 21 Mar 2013 18:07:14 +0400
Message-ID: <514B1412.9060707@cogentembedded.com>
References: <1363873663-19272-1-git-send-email-ldewangan@nvidia.com> <1363873663-19272-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363873663-19272-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 21-03-2013 17:47, Laxman Dewangan wrote:

> Dalmore uses the TPS51632 as CPU regulator. The device is connected
> on I2C5.

> Add DT node for TPS51632.

> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/boot/dts/tegra114-dalmore.dts |   15 +++++++++++++++
>   1 files changed, 15 insertions(+), 0 deletions(-)

> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index a61974e..6be9434 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -718,6 +718,21 @@
>   		clock-frequency = <408000000>;
>   	};
>
> +	i2c@7000d000 {
> +		status = "okay";
> +		clock-frequency = <400000>;
> +
> +		tps51632 {

    Should be named "tps51632@43" I think.

> +			compatible = "ti,tps51632";
> +			reg = <0x43>;

WBR, Sergei
