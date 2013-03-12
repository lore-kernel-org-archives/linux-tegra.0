From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] ARM: dt: tegra114: add PWM nodes
Date: Tue, 12 Mar 2013 11:23:40 +0200
Message-ID: <20130312112340.6d624df5dfe28c4b5b8157f5@nvidia.com>
References: <1363045695-28874-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363045695-28874-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Andrew,

On Tue, 12 Mar 2013 00:48:15 +0100
Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> This patch adds device tree nodes for the four PWM controllers present
> on Tegra114.
> 
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Fixed commit message.
> Corrected the compatible property.
> Placed PWM nodes in the right place such that nodes are sorted by register
> address.
> 
>  arch/arm/boot/dts/tegra114.dtsi |   32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index 1dfaf28..5741ae4 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -92,6 +92,38 @@
>  		status = "disabled";
>  	};
>  
> +	pwm0: pwm@7000a000 {
> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a000 0x4>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;

FYI:
I'm sending out the patch(v4) to replace car magic # with macro[1].
Then you could replace the above magic #s with macro names.

[1] http://patchwork.ozlabs.org/patch/220680/
