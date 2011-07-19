From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] dt: tegra20: Add ehci nodes to Seaboard.
Date: Tue, 19 Jul 2011 16:04:22 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049EBDED2A@HQMAIL01.nvidia.com>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
 <1311115617-9697-3-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1311115617-9697-3-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rkle>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Tuesday, July 19, 2011 4:47 PM:
> From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Removing status="disabled" from tegra20.dtsi makes this patch obsolete.

Although that said, since many of the USB properties are board-specific
and determined by system characterization, they aren't generally
applicable to all Tegra devices. As such, should those values be moved
into tegra-seaboard.dts instead? Perhaps tegra20.dtsi should specify
the default values that the driver currently uses if not supplied with
platform data though... I think the Seaboard values are the defaults,
which still would make this patch obsolete.

> ---
>  arch/arm/boot/dts/tegra-seaboard.dts |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
> index 5a99b4c..c5a1b71 100644
> --- a/arch/arm/boot/dts/tegra-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
> @@ -31,4 +31,16 @@
>  	sdhci@c8000600 {
>  		status = "ok";
>  	};
> +
> +	ehci@c5000000 {
> +		status = "ok";
> +	};
> +
> +	ehci@c5004000 {
> +		status = "ok";
> +	};
> +
> +	ehci@c5008000 {
> +		status = "ok";
> +	};
>  };
> --
> 1.7.6

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
