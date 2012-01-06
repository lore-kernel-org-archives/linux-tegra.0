From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] arm/tegra: emc: device tree support
Date: Thu, 5 Jan 2012 17:26:05 -0800
Message-ID: <CAOesGMhwTuiJJC=sO8MkFtfkaA=OAxxNXGkPs5av27bLzVJxBA@mail.gmail.com>
References: <1324599468-12845-10-git-send-email-olof@lixom.net>
	<1325743338-2533-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F182F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F182F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 5, 2012 at 2:35 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Wednesday, January 04, 2012 11:02 PM:
>> Add device tree support to the emc driver, filling in the platform d=
ata
>> based on the DT bindings.
>>
>> Changes since v1:
>>
>> * Unmangled some messed up patch squashes, moving changes to earlier=
 patches
>> * Flipped an of_property_read_u32 return value test
>> * Clarified clock settings message on case where no table is provide=
d
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ...
>> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/=
tegra2_emc.c
> ...
>> +static struct tegra_emc_pdata __devinit *tegra_emc_fill_pdata(struc=
t platform_device *pdev)
> ...
>> + =A0 =A0 pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KER=
NEL);
>> + =A0 =A0 pdata->tables =3D devm_kzalloc(&pdev->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
sizeof(struct tegra_emc_table),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
GFP_KERNEL);
>
> You could convert that one to sizeof(*pdata->tables) too, although fe=
el
> free to ignore this picky comment, or fix it up when you apply the ch=
ange.
>
> Otherwise,
>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


Done, thanks.

-Olof
