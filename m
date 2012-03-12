From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Mon, 12 Mar 2012 18:44:24 +0100
Message-ID: <201203121844.24744.marek.vasut@gmail.com>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com> <20120229194409.GO14173@pengutronix.de> <4F4EBA8C.1040408@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F4EBA8C.1040408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Dear Ryan Mallon,

> On 01/03/12 06:44, Uwe Kleine-K=F6nig wrote:
> > On Wed, Feb 29, 2012 at 11:17:41AM -0800, Stephen Warren wrote:
> >> Uwe Kleine-K=F6nig wrote at Wednesday, February 29, 2012 12:12 PM:
> >>> On Wed, Feb 29, 2012 at 10:33:58AM -0800, Tim Bird wrote:
> >>>> On 02/29/2012 10:14 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >>>>> On 08:58 Wed 29 Feb     , Stephen Warren wrote:
> >>>>>> Jean-Christophe PLAGNIOL-VILLARD wrote at Wednesday, February =
29, 2012=20
5:30 AM:
> >>>>>>> On 17:03 Tue 28 Feb     , Stephen Warren wrote:
> <snip>
>=20
> >> The existing target works just fine today.
> >=20
> > It depends what you want to achieve. If you want to make everything
> > maximally easy for everyone you can optimize the uImage target.
> >=20
> > If you want to give incentive for U-Boot to improve, drop the targe=
t
> > today.
>=20
> This assumes that people will upgrade their bootloaders, which is not
> always possible or desirable.
>=20
> ~Ryan
>=20

Agreed 201%

Best regards,
Marek Vasut
