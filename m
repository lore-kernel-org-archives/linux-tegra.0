From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: remove copy-and-pasted usb platform data
 from boards
Date: Fri, 15 Jul 2011 09:45:53 -0700
Message-ID: <CAMbhsRTxAwKJ7qiK=_BAMc3Y1x_WHF7WHrm_54o-sYLBb1zzng@mail.gmail.com>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
	<1310336374-31727-2-git-send-email-ccross@android.com>
	<20110715111348.3ed0522a@ac100.localdomain>
	<201107151155.56495.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201107151155.56495.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 15, 2011 at 2:55 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:
> Am Freitag, 15. Juli 2011, 11:13:48 schrieb Marc Dietrich:
>> see comment for PATCH 1/2
>>
>> Am Sun, 10 Jul 2011 15:19:34 -0700
>>
>> schrieb Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>:
>> > trimslice and paz00 both have functionally identical platform
>> > data for the tegra-ehci driver. =A0Move the platform data into
>> > devices.c, and remove it from all the board files.
>> >
>> > Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>>
>> Acked-By: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>>
>> > ---
>> >
>> > =A0arch/arm/mach-tegra/board-paz00.c =A0 =A0 | =A0 26
>> >
>
>> >
>> > -static struct tegra_ulpi_config ulpi_phy_config =3D {
>> > - =A0 =A0 =A0 =A0 =A0 .reset_gpio =3D TEGRA_ULPI_RST,
>> > - =A0 =A0 =A0 =A0 =A0 .clk =3D "cdev2",
>> > -};
>> > -
>> > -static struct tegra_ehci_platform_data tegra_ehci_pdata[] =3D {
>> > - =A0 =A0 =A0 =A0 =A0 [0] =3D {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .operating_mode =3D TEGRA_US=
B_OTG,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .power_down_on_bus_suspend =3D=
 1,
>> > - =A0 =A0 =A0 =A0 =A0 },
>> > - =A0 =A0 =A0 =A0 =A0 [1] =3D {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .phy_config =3D &ulpi_phy_co=
nfig,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .operating_mode =3D TEGRA_US=
B_HOST,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .power_down_on_bus_suspend =3D=
 1,
>> > - =A0 =A0 =A0 =A0 =A0 },
>> > - =A0 =A0 =A0 =A0 =A0 [2] =3D {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .operating_mode =3D TEGRA_US=
B_HOST,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .power_down_on_bus_suspend =3D=
 1,
>> > - =A0 =A0 =A0 =A0 =A0 },
>> > -};
>
> I'm not sure about this.
>
> For paz00 tegra_ehci3_device also leads to an external usb port. With
> power_down_on_bus_suspend =3D 1 hotplugging usb devices doesn't work =
(as the bus
> might be suspended at the time).
>
> From the initial commit message of ehci-tegra on android.git.kernel.o=
rg:
> "For additional power saving, the driver supports powering down the
> phy on bus suspend when it is used, for example, to connect an intern=
al
> device that use an out-of-band remote wakeup mechanism (e.g. a gpio).=
"
>
> So my guess was, that the correct handling of this was setting
> power_down_on_bus_suspend to 0 - which did fix the problem.
>
> With this data moving to devices.c, setting this would also change th=
e
> trimslice behaviour which would be a problem.
>
> In the end I'm not sure if setting power_down_on_bus_suspend to 0 is =
the
> correct solution to the hotplug problem or if a better solution exist=
s.
>
> Thanks
> Heiko
>

Can you or someone else test if power_down_on_bus_suspend is causing a
problem?  If it is, I'll change the default in devices.c to
power_down_on_bus_suspend=3D0, and devices that want
power_down_on_bus_suspend=3D1 will have to set it.
