From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: harmony: register sdhci devices
Date: Tue, 22 Feb 2011 07:44:58 -0800
Message-ID: <AANLkTi=mjR6dnxcTxYzTvJK4DgEW7mO+p4TUeu6kq6fn@mail.gmail.com>
References: <1298354117-19097-1-git-send-email-olof@lixom.net>
	<1298354117-19097-5-git-send-email-olof@lixom.net>
	<4D635EC4.2030102@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D635EC4.2030102-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 10:59 PM, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> w=
rote:
> Hi Olof,
> Sorry for jumping late, haven't thought about the proposal below yest=
erday.
> I'm not objecting to applying the patch as is, we can refactor the co=
de
> afterwards as well.

Thanks for the input. And yeah, I'd say we can refactor later when we
see how things will fit well with flat devicetrees. More below.


>> =A0static void __init tegra_harmony_init(void)
>> =A0{
>> =A0 =A0 =A0 tegra_common_init();
>> @@ -85,6 +111,10 @@ static void __init tegra_harmony_init(void)
>>
>> =A0 =A0 =A0 harmony_pinmux_init();
>>
>> + =A0 =A0 tegra_sdhci_device1.dev.platform_data =3D &sdhci_pdata1;
>> + =A0 =A0 tegra_sdhci_device2.dev.platform_data =3D &sdhci_pdata2;
>> + =A0 =A0 tegra_sdhci_device4.dev.platform_data =3D &sdhci_pdata4;
>> +
>
> I think that instead of copying explicit initialization of the platfo=
rm_data
> member from board to board we can do something similar to what PXA do=
es. The
> board file would have to call something like
> tegra_set_device_X_info(struct tegra_device_X_platform_data *data);
> and then static registration of platform devices in the board files c=
an be dropped.
>
> For instance, the devices.c would have
>
> void __init tegra_register_device(struct platform_device *dev, void *=
data)
> {
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0dev->dev.platform_data =3D data;
>
> =A0 =A0 =A0 =A0ret =3D platform_device_register(dev);
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&dev->dev, "unable to register=
 device: %d\n", ret);
> }
>
> void __init tegra_set_sdhci1_info(struct tegra_sdhci_platform_data *i=
nfo)
> {
> =A0 =A0 =A0 =A0tegra_register_device(&tegra_sdhci_device1, info);
> }
>
> and the board files would just call tegra_set_sdhci1_info to pass the=
 platform
> data for the tegra_sdhci_device1 and register the device.
>
> This way we could reduce amount of copy/paste between the board files=
=2E Besides,
> if/when tegra will be using device trees, handling of the device regi=
stration in
> common place would make the transition easier.

I don't see how that reduces the amount of copy and paste
(significantly), since you still need the platform_data defined per
board so you'll need to add the calls there. Maybe a generic
"set_platform_data" hook instead of doing the pointer assignment
open-coded would be an improvement though.

I'm personally not a fan of the style where data is described as code,
i.e. where there would be a tegra_set_<dev>_info function for every
possible device out there. If anything that adds to the amount of
copy-and-paste (per device), when it could just be handled with one
common function being passed the appropriate data (i.e. like
tegra_register_device).

Anyway, I'm not looking to argue over it. :) I think we'll see when
the FDT pieces start to take shape what kind of model will work well,
and there's no reason to do premature refactoring.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
