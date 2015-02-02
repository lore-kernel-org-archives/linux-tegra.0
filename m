From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 01/10] ARM: tegra: Set the sound card model that alsaucm
 expects
Date: Mon, 02 Feb 2015 14:08:36 -0700
Message-ID: <54CFE754.7000500@wwwdotorg.org>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com> <1422442278-10405-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422442278-10405-2-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/28/2015 03:50 AM, Tomeu Vizoso wrote:
> Patches are on its way to add a config file to alsaucm for the Nyan
> boards. Use the same card ID that alsaucm will expect.

> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts

>   	sound {
> -		compatible = "nvidia,tegra-audio-max98090-nyan-big",
> +		compatible = "nvidia,tegra-audio-max98090-nyan",
>   			     "nvidia,tegra-audio-max98090";

I'm not convinced that removing the board-specific compatible value is a 
great idea. What if we find we need to distinguish between different 
boards that use this same binding in the future. That situation is 
exactly why we have board-/SoC-specific values in compatible even if we 
don't immediately use them.

> -		nvidia,model = "Acer Chromebook 13";
> +		nvidia,model = "GoogleNyan";

I believe this also technically breaks ABI, since some user-space tools 
use the model to look up saved state. Can we not leave this as is, and 
just have the UCM files know about both names?

Aside from that, I think the series looks OK at a quick glance.
