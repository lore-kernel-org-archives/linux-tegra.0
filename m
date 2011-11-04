From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] USB: ehci-tegra: add probing through device tree
Date: Fri, 4 Nov 2011 08:37:56 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173F9A4CBC@HQMAIL01.nvidia.com>
References: <1320377174-28047-1-git-send-email-olof@lixom.net>
 <1320377174-28047-2-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320377174-28047-2-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, November 03, 2011 9:26 PM:
> Rely on platform_data being passed through auxdata for now; more elaborate
> bindings for phy config and tunings to be added.
...
> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
...
>  static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
>  	/* name		parent		rate		enabled */
>  	{ "uartd",	"pll_p",	216000000,	true },
> +	{ "usbd",	"clk_m",	12000000,	false },
> +	{ "usb3",	"clk_m",	12000000,	false },
>  	{ NULL,		NULL,		0,		0},
>  };

As woglinde mentioned on IRC, I think you do want to add "usb2" to the
table here; it's in board-paz00.c at least. It shouldn't hurt other boards.

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
...
> @@ -590,6 +617,13 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
> 
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &tegra_ehci_dma_mask;

Should this come from DT, or is it some more system-level/internal thing
that doesn't make sense to represent there?

> +
> +	vbus_gpio = of_get_named_gpio(pdev->dev.of_node, "nvidia,vbus-gpio", 0);

of_get_named_gpio() does check for NULL node pointer in practice, but is
it defined to? I wonder if this needs to be conditional of of_node!=NULL
or not?

> +	if (vbus_gpio > 0)

Should that use gpio_is_valid()?

> +		setup_vbus_gpio(pdev, vbus_gpio);

-- 
nvpublic
