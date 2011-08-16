From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH v2 06/13] docs/dt: Document nvidia,tegra20-pinmux
 binding
Date: Tue, 16 Aug 2011 11:48:27 +0800
Message-ID: <20110816034827.GH8044@S2100-06.ap.freescale.net>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
 <1313440100-17131-7-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313440100-17131-7-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 15, 2011 at 02:28:13PM -0600, Stephen Warren wrote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/pinmux/pinmux_nvidia.txt   |  294 ++++++++++++++++++++
>  1 files changed, 294 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
> 
[...]
> +
> +Example of a gpio-controller node:
> +

You meant pinmux node instead of gpio.

Regards,
Shawn

> +	pinmux: pinmux@70000000 {
> +		compatible = "nvidia,tegra20-pinmux";
> +		reg = < 0x70000000 0xc00 >;
> +		nvidia,mux-groups {
> +			cdev1 {
> +				nvidia,function = "plla_out";
> +			};
> +			cdev2 {
> +				nvidia,function = "pllp_out4";
> +				nvidia,pull-down;
> +				nvidia,tristate;
> +			};
> +		};
> +		nvidia,drive-groups {
> +			sdio1 {
> +				nvidia,schmitt;
> +				nvidia,drive-power = <1>;
> +				nvidia,pull-down-strength = <31>;
> +				nvidia,pull-up-strength = <31>;
> +				nvidia,slew-rate-rising = <3>;
> +				nvidia,slew-rate-falling = <3>;
> +			};
> +		};
> +	};
> +
> -- 
> 1.7.0.4
> 
> 
