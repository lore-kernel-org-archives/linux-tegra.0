From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Harmony: Use engineering names in DT
 compatible property
Date: Tue, 5 Jul 2011 23:50:18 -0600
Message-ID: <20110706055018.GF9978@ponder.secretlab.ca>
References: <1309897408-23085-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1309897408-23085-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 05, 2011 at 02:23:28PM -0600, Stephen Warren wrote:
> Engineering names are more stable than marketing names. Hence, use them
> for Device Tree compatible properties instead.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Grant, this is against devicetree/arm, and only makes sense there; I'll
> send a separate patch for the equivalent change in devicetree/test, since
> the file is radically different there.

devicetree/arm actually does track devicetree/test, just a subset of
the patches in it (although it isn't obvious since I use stgit to make
devicetree/arm a stable branch that never rebases.

I'll make sure both devicetree/arm and devicetree/test are fixed up.

g.

> 
>  arch/arm/boot/dts/tegra-harmony.dts |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
> index 81032e7..4ad8ade 100644
> --- a/arch/arm/boot/dts/tegra-harmony.dts
> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> @@ -3,5 +3,5 @@
>  
>  / {
>  	model = "NVIDIA Tegra2 Harmony evaluation board";
> -	compatible = "nvidia,harmony", "nvidia,tegra250";
> +	compatible = "nvidia,harmony", "nvidia,tegra20";
>  };
> -- 
> 1.7.0.4
> 
