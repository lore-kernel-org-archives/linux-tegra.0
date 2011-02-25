From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/4] usb: host: Add EHCI driver for NVIDIA Tegra SoCs
Date: Fri, 25 Feb 2011 11:54:16 -0800
Message-ID: <20110225195416.GD3702@kroah.com>
References: <1298434054-23274-1-git-send-email-benoit@android.com>
 <1298434054-23274-4-git-send-email-benoit@android.com>
 <AANLkTi=D-GcJJPvW2MaDf9L-KNr2628q3v1MZTbOCtmx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=D-GcJJPvW2MaDf9L-KNr2628q3v1MZTbOCtmx-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ro
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 08:56:47PM -0800, Olof Johansson wrote:
> Hi,
>=20
>=20
> On Tue, Feb 22, 2011 at 8:07 PM, Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wro=
te:
>=20
>=20
> > diff --git a/include/linux/tegra_usb.h b/include/linux/tegra_usb.h
> > new file mode 100644
> > index 0000000..6bca5b5
> > --- /dev/null
> > +++ b/include/linux/tegra_usb.h
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Copyright (C) 2010 Google, Inc.
> > + *
> > + * This software is licensed under the terms of the GNU General Pu=
blic
> > + * License version 2, as published by the Free Software Foundation=
, and
> > + * may be copied, distributed, and modified under those terms.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#ifndef _TEGRA_USB_H_
> > +#define _TEGRA_USB_H_
> > +
> > +enum tegra_usb_operating_modes {
> > + =A0 =A0 =A0 TEGRA_USB_DEVICE,
> > + =A0 =A0 =A0 TEGRA_USB_HOST,
> > + =A0 =A0 =A0 TEGRA_USB_OTG,
> > +};
> > +
> > +struct tegra_ehci_platform_data {
> > + =A0 =A0 =A0 enum tegra_usb_operating_modes operating_mode;
> > + =A0 =A0 =A0 /* power down the phy on bus suspend */
> > + =A0 =A0 =A0 int power_down_on_bus_suspend;
> > + =A0 =A0 =A0 void *phy_config;
> > +};
> > +
> > +#endif /* _TEGRA_USB_H_ */
>=20
> Most other platform drivers like this put the platform data include
> files either under include/linux/usb or under
> arch/arm/mach-<foo>/include/mach instead, since they don't really
> apply globally.  I'd say go with the latter since there's no sharing
> of this outside of tegra today (and it can be moved if that ever
> happens).

Platform data should go in include/linux/platform_data/  Please put it
there and not in the "global" include/linux/ location.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
