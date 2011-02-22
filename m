From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/4] ARM: tegra: Move pinmux init call
Date: Tue, 22 Feb 2011 09:27:57 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5A37@HQMAIL01.nvidia.com>
References: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
	<1298173137-9242-5-git-send-email-swarren@nvidia.com>
 <AANLkTimcadeAHWuFApw_H+AEs+hgURxCRO2X92M9cehG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimcadeAHWuFApw_H+AEs+hgURxCRO2X92M9cehG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Monday, February 21, 2011 8:22 PM:
>=20
> On Sat, Feb 19, 2011 at 7:38 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> wrote:
> > In order for the clock initialization to pick up the results of the
> > pinmux initialization (which will initialize various parameters of
> > clocks cdev1, cdev2), the pinmux initialization must happen first.
> > Move the pinmux init to achieve this.
>...
> > =A0{
> > + =A0 =A0 =A0 harmony_pinmux_init();
> > +
> > =A0 =A0 =A0 =A0tegra_common_init();
> >
> > =A0 =A0 =A0 =A0tegra_clk_init_from_table(harmony_clk_init_table);
> >
> > - =A0 =A0 =A0 harmony_pinmux_init();
> > -
>=20
> This isn't going to work any more.  In order for the timer to get a
> reference to its clock, clocks have to be up before the system timer
> is initialized, so Russell added an init_early hook for clock
> initialization.  init_machine happens much later, so the per-board
> pinmux init will always happen after clock init.

OK. Drop this patch then.

IIRC, this patch was mostly about making the state (e.g. debugfs files)=
 match
between the pinmux and clock drivers. At least initially I'll ignore th=
is now
that I know what's going on with the audio clocks, and just make audio =
work
with the appropriate pinmux settings as you suggest.

Maybe that approach will obviate the need for my patch that adds set_pa=
rent
for cdev[12], if it's done by pinmux settings instead. I'll check and s=
ee.
We can think about the underlying synchronization issue between clock/p=
inmux
later I think.

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
