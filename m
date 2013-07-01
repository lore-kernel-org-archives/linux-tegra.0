From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 9/9] usb: phy: tegra: Use DT helpers for dr_mode
Date: Mon, 01 Jul 2013 16:02:51 -0600
Message-ID: <51D1FC8B.1030505@wwwdotorg.org>
References: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com> <1372455427-20898-10-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372455427-20898-10-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 03:37 PM, Tuomas Tynkkynen wrote:
> Use the new of_usb_get_dr_mode helper function for parsing dr_mode
> from the device tree. Also replace the usage of the custom
> tegra_usb_phy_mode enum with the standard enum.

> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> +	tegra_phy->mode = of_usb_get_dr_mode(np);
> +	if (tegra_phy->mode == USB_DR_MODE_UNKNOWN) {
> +		dev_err(&pdev->dev, "dr_mode is invalid\n");
> +		return -EINVAL;
> +	}

Unfortunately, of_usb_get_dr_mode() returns USB_DR_MODE_UNKNOWN if the
property is missing, rather than defaulting to host mode as the original
code here did. I would suggest solving this by:

> diff --git a/drivers/usb/usb-common.c b/drivers/usb/usb-common.c
> index 675384d..6391de5 100644
> --- a/drivers/usb/usb-common.c
> +++ b/drivers/usb/usb-common.c
> @@ -103,7 +103,7 @@ enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
>  
>         err = of_property_read_string(np, "dr_mode", &dr_mode);
>         if (err < 0)
> -               return USB_DR_MODE_UNKNOWN;
> +               return USB_DR_MODE_HOST;
>  
>         for (i = 0; i < ARRAY_SIZE(usb_dr_modes); i++)
>                 if (!strcmp(dr_mode, usb_dr_modes[i]))

This can't be done by the caller, since of_usb_get_dr_mode() returns
UNKNOWN in two cases, which the caller can't distinguish without
manually checking whether the property exists first:

a) Property is not present (which should default to HOST mode at least
for the Tegra binding, as in the patch I show above).

b) Property is present, but contains an invalid value, which probably
should cause the driver to error-out.

This is only a problem for dr_mode in the Tegra binding: dr_mode is an
optional property, whereas the phy_type property as parsed by patch 8/9
is mandatory, so this issue doesn't come up.
