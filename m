From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 12:51:08 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049EBDEF4E@HQMAIL01.nvidia.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1311190690-18334-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rkle>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Wednesday, July 20, 2011 1:38 PM:
> From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add code to try to get platform data information (register base, irq,
> modes, various tuning parameters) from device tree, if not present in board
> files.
> 
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> +++ b/Documentation/devicetree/bindings/usb/tegra20-ehci.txt
...
> +Required properties for type = "ulpi":
> + - reset_gpio: The GPIO used to drive reset
> + - clk

We should probably document what this is. I know you're finding out more
about this internally.

> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> +	retval = of_property_read_u32(dn, "power_down_on_bus_suspend",
> +				      &pdata->power_down_on_bus_suspend);

Sorry I missed this before, but perhaps we should skip reading that
property unless mode=="host"?

Otherwise,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
