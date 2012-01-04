From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: dt: tegra30.dtsi: Reformat gpio's interrupts
 property
Date: Wed, 4 Jan 2012 12:50:27 -0700
Message-ID: <20120104195027.GE15503@ponder.secretlab.ca>
References: <1325702378-20863-1-git-send-email-swarren@nvidia.com>
 <1325702378-20863-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325702378-20863-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 04, 2012 at 11:39:35AM -0700, Stephen Warren wrote:
> The new content matches tegra20.dtsi, and is < 80 columns.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra30.dtsi |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index ee7db98..e5d1406 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -55,7 +55,13 @@
>  	gpio: gpio@6000d000 {
>  		compatible = "nvidia,tegra30-gpio", "nvidia,tegra20-gpio";
>  		reg = < 0x6000d000 0x1000 >;
> -		interrupts = < 0 32 0x04 0 33 0x04 0 34 0x04 0 35 0x04 0 55 0x04 0 87 0x04 0 89 0x04 >;
> +		interrupts = < 0 32 0x04
> +			       0 33 0x04
> +			       0 34 0x04
> +			       0 35 0x04
> +			       0 55 0x04
> +			       0 87 0x04
> +			       0 89 0x04 >;

Nit: I often find the following form convenient (even if it doesn't change the data generation):

		interrupts = < 0 32 0x04 >,
			     < 0 33 0x04 >,
			     < 0 34 0x04 >,
			     < 0 35 0x04 >,
			     < 0 55 0x04 >,
			     < 0 87 0x04 >,
			     < 0 89 0x04 >;

Otherwise:

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

>  		#gpio-cells = <2>;
>  		gpio-controller;
>  	};
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
