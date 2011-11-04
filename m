From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] USB: ehci-tegra: add probing through device tree
Date: Fri, 4 Nov 2011 11:44:32 -0700
Message-ID: <CAOesGMhXE+-u_PgG3UqccVESrr9_UU3ggPzEhFkFLv2adNzOug@mail.gmail.com>
References: <1320377174-28047-1-git-send-email-olof@lixom.net>
	<1320377174-28047-2-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173F9A4CBC@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173F9A4CBC-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 4, 2011 at 8:37 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, November 03, 2011 9:26 PM:
>> Rely on platform_data being passed through auxdata for now; more ela=
borate
>> bindings for phy config and tunings to be added.
> ...
>> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/bo=
ard-dt.c
> ...
>> =A0static __initdata struct tegra_clk_init_table tegra_dt_clk_init_t=
able[] =3D {
>> =A0 =A0 =A0 /* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0rate =A0=
 =A0 =A0 =A0 =A0 =A0enabled */
>> =A0 =A0 =A0 { "uartd", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A0216000000,=
 =A0 =A0 =A0true },
>> + =A0 =A0 { "usbd", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A012000000, =A0=
 =A0 =A0 false },
>> + =A0 =A0 { "usb3", =A0 =A0 =A0 "clk_m", =A0 =A0 =A0 =A012000000, =A0=
 =A0 =A0 false },
>> =A0 =A0 =A0 { NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
>> =A0};
>
> As woglinde mentioned on IRC, I think you do want to add "usb2" to th=
e
> table here; it's in board-paz00.c at least. It shouldn't hurt other b=
oards.

Yeah, I didn't catch it before posting this.

It might make sense to just move them to common.c then, especially
since the clocks aren't enabled in the table. But I'll add usb2 for
now, and we can move them later if it makes sense.

>
>> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-t=
egra.c
> ...
>> @@ -590,6 +617,13 @@ static int tegra_ehci_probe(struct platform_dev=
ice *pdev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 if (!pdev->dev.dma_mask)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdev->dev.dma_mask =3D &tegra_ehci_dma_mas=
k;
>
> Should this come from DT, or is it some more system-level/internal th=
ing
> that doesn't make sense to represent there?

Ideally it should come from the device tree based on dma window
information, but there's currently no way to encode in there what the
dma address limitations of a device is, or at least nothing that is
used generically -- IBM has some custom extensions to encode what part
of the dma address space is mapped for a specific device through the
iommu.

The auxdata function has a comment saying that it is intentionally not
setting up the dma mapping functions and that it should be handled
through a system notifier instead (but it does set the
coherent_dma_mask). As a stepping stone on getting that all sorted out
I just did the simple solution above. I'll add a comment saying it
should go away.

>> +
>> + =A0 =A0 vbus_gpio =3D of_get_named_gpio(pdev->dev.of_node, "nvidia=
,vbus-gpio", 0);
>
> of_get_named_gpio() does check for NULL node pointer in practice, but=
 is
> it defined to? I wonder if this needs to be conditional of of_node!=3D=
NULL
> or not?

Sure, I can wrap it with a test of of_node.

>> + =A0 =A0 if (vbus_gpio > 0)
>
> Should that use gpio_is_valid()?

Yep, fixing.



-Olof
