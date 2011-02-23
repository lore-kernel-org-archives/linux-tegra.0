From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/5] ARM: Tegra: Enable Harmony audio support
Date: Wed, 23 Feb 2011 13:22:43 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5D88@HQMAIL01.nvidia.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-6-git-send-email-swarren@nvidia.com>
	<AANLkTimffVNK2EmTqypQcrWHLisf3c8_dMsHwSbv-nWi@mail.gmail.com>
 <AANLkTikk6f0Nv8XZEmY4-85FtBE1re9hKqgFRNZkyPfz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikk6f0Nv8XZEmY4-85FtBE1re9hKqgFRNZkyPfz-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Wednesday, February 23, 2011 2:16 PM:
>=20
> On Wed, Feb 23, 2011 at 1:08 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrot=
e:
> > ...
> > On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcphl2p70BpVqQ@public.gmane.org=
m> wrote:
> > [...]
> >> diff --git a/arch/arm/mach-tegra/board-harmony.h b/arch/arm/mach-t=
egra/board-harmony.h
> >> index 4fe33b8..fbf2304 100644
> >> --- a/arch/arm/mach-tegra/board-harmony.h
> >> +++ b/arch/arm/mach-tegra/board-harmony.h
> >> @@ -17,12 +17,19 @@
> >> =A0#ifndef _MACH_TEGRA_BOARD_HARMONY_H
> >> =A0#define _MACH_TEGRA_BOARD_HARMONY_H
> >>
> >> +#define GPIO_WM8903(_x_) =A0 =A0 =A0 =A0 =A0 =A0 =A0 (TEGRA_NR_GP=
IOS + (_x_))
> >
> >
> > The above assumes that wm8903 is the GPIO controller that gets
> > allocated the numbers right after native tegra gpio. That might not=
 be
> > the case on all boards, since the TPS PMIC has some as well, I
> > believe.
> The GPIO numbers above TEGRA_NR_GPIOS are allocated by the board, and
> this is in board-harmony.h, so I think its OK.

The Seaboard equivalent of this that I wrote for ChromeOS is:

#define TPS_GPIO_BASE			TEGRA_NR_GPIOS

#define TPS_GPIO_WWAN_PWR		(TPS_GPIO_BASE + 2)

#define GPIO_WM8903(_x_)		(TPS_GPIO_BASE + 4 + (_x_))

Which takes into account other devices.

> > Does it need a hardcoded GPIO base, or can it use the dynamic one
> > (i.e. use -1 here)? I don't even see any reference to gpio_base in =
the
> > driver...
> I assume that is in the ASoC tree.  The platform data in tegra
> for-next does not include a gpio_base entry.

Yes, gpio_base is added to that tree.

-1 would probably work. But then, I have no idea how to find out what b=
ase
was assigned to the WM8903, in order to initialize the ASoC machine dri=
ver's
platform_data...

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
