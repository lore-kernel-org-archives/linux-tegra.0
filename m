From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Enable the headphone detection gpio on
 PAZ00 board.
Date: Thu, 26 Jan 2012 08:52:44 +0200
Message-ID: <CALq1K=+CvyL14MV0d-jwgpisdrHSFQ8m9Zg6M6gSppG6oqwp+g@mail.gmail.com>
References: <1327517420-29746-1-git-send-email-leon@leon.nu> <74CDBE0F657A3D45AFBB94109FB122FF178CB821B4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB821B4-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 00:23, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
> Leon Romanovsky wrote at Wednesday, January 25, 2012 11:50 AM:
>> Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
>
>> diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/mac=
h-tegra/board-paz00-pinmux.c
> ...
>> @@ -152,6 +152,7 @@ static struct tegra_gpio_table gpio_table[] =3D =
{
> ...
>> + =C2=A0 =C2=A0 { .gpio =3D TEGRA_HP_DET, =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 .enable =3D true },
>
> There's no need to do this at all if you're only supporting audio whe=
n
> booting use device tree. If you intend for audio to work when booting
> using a board file, then the previous patch needs a bunch of rework
> to make some of the code conditional on device tree; the same structu=
re
> as tegra_wm8903.c uses.
>
> Talking of which, in the previous patch, you can remove a number of
> things from tegra_alc5632.c if you are only supporting device tree, l=
ike
> the DAPM route map, since that's parsed from device tree now.
Thanks for the input
As you mentioned we are going support only device tree.

>
> --
> nvpublic
>



--=20
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
