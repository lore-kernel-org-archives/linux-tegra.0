From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: status = "okay" vs. "disabled" in soc.dtsi or board.dts
Date: Fri, 24 Feb 2012 16:13:51 -0700
Message-ID: <CACxGe6soY54_KYjm-bgmfSBS4V65ciL66Xna76Sw2CnBQOhDYw@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCE07@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCE07-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 24, 2012 at 4:08 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Grant, Rob, et al.,
>
> As background, consider an SoC with 4 SD/MMC controllers, and that most
> boards will only use 1 or 2 of these controllers. Attempting to initialize
> the other would be pointless since nothing is connected, cause meaningless
> kernel error spew, etc.
>
> This could be handled in two ways:
>
> 1)
>
> For all such devices, place status="disabled" in $soc.dtsi, and override
> this in $board.dts for the devices that are actually used on the board.
>
> 2)
>
> Do nothing in particular in $soc.dtsi, thus leaving everything enabled,
> and disable anything unused in $board.dts.
>
>
> We've had this discussion before, and if I understood you (Grant)
> correctly, you stated during review of some Tegra .dts files that (2)
> was the de-facto practice, and hence that's what the current Tegra
> .dts files in the kernel do.
>
> However, I've just noticed that we aren't consistent about this across
> SoCs; IMX and Atmel appear to do (1) whereas Tegra and Exynos do (2).
> (1) seems a little more direct; the $board.dts files only contain
> configuration for devices they use, rather than also having to disable
> devices they don't. Can Tegra (and Exynos) switch?

My opinion isn't strong enough to care much.  As long as the dtb that
comes out the other end is correct, then I'm happy.

g.
