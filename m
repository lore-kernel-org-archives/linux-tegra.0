From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T
 kernel_noload
Date: Wed, 29 Feb 2012 20:44:09 +0100
Message-ID: <20120229194409.GO14173@pengutronix.de>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
 <20120229122942.GF3318@game.jcrosoft.org>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com>
 <20120229181430.GI3318@game.jcrosoft.org>
 <4F4E6F96.8080907@am.sony.com>
 <20120229191209.GN14173@pengutronix.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 29, 2012 at 11:17:41AM -0800, Stephen Warren wrote:
> Uwe Kleine-K=F6nig wrote at Wednesday, February 29, 2012 12:12 PM:
> > On Wed, Feb 29, 2012 at 10:33:58AM -0800, Tim Bird wrote:
> > > On 02/29/2012 10:14 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > > On 08:58 Wed 29 Feb     , Stephen Warren wrote:
> > > >> Jean-Christophe PLAGNIOL-VILLARD wrote at Wednesday, February =
29, 2012 5:30 AM:
> > > >>> On 17:03 Tue 28 Feb     , Stephen Warren wrote:
> > > >>>> uImage files typically encode a single absolute load and ent=
ry address.
> > > >>>> This is inconvenient when attempting to share that uImage ac=
ross multiple
> > > >>>> SoCs with different physical RAM addresses. Recent versions =
of mkimage
> > > >>>> implement a "kernel_noload" image type which encodes no abso=
lute load
> > > >>>> address, and a relative entry address. This works well for u=
Image-wrapped
> > > >>>> ARM zImages, since they are relocatable.
> > > >>>>
> > > >>>> This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a=
81dd0a
> > > >>>> "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
> > > >>>>
> > > >>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >>>> ---
> > > >>>> I assume I should put this into the ARM patch tracker if it'=
s OK?
> > > >>>
> > > >>> Again a new option for uImage no why not just boot the zImage
> > > >>>
> > > >>> in this case the uImage is useless
> > > >>
> > > >> U-Boot doesn't support zImage at present.
> > > >>
> > > >> A patch was posted to support it at least for ARM, but needed =
a little
> > > >> work before it could be committed.
> > > > Sorry I see no advantage to have the uImage build by the kernel=
 anymore as
> > > > we have a relocatable zImage
> > > >
> > > > I'll even drop its support
> > >
> > > This seems at least premature, and possibly ill-advised in genera=
l.
> > > There are lots of U-Boot images out in the field, many of which t=
hat
> > > are rarely updated. A lot of workflow will be disrupted unnecessa=
rily
> > > by a change like this.
> > >
> > > Could you wait to drop uImage build support in the kernel until
> > > U-Boot supports zImage, and has worked it's way into the field
> > > for a few years?
> >
> > I admit I didn't check for a few years, but regarding that the valu=
es
> > used to build the uImage from a zImage are (or at least were) quite=
 bad,
> > I'd say deprecate the uImage target today.
>=20
> That would prevent anyone from using U-Boot without having to go thro=
ugh
> manual steps to duplicate what already exists in the uImage target in
> the kernel.
>=20
> The existing target works just fine today.
It depends what you want to achieve. If you want to make everything
maximally easy for everyone you can optimize the uImage target.

If you want to give incentive for U-Boot to improve, drop the target
today. And note that at least people caring about boot time must not us=
e
the kernel's uImage target anyhow.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
