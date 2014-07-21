From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Mon, 21 Jul 2014 11:02:10 +0200
Message-ID: <20140721090208.GJ8843@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <17053542.QUGvfkeRmc@wuerfel>
 <20140716151427.GA22027@ulmo>
 <6322144.IB6iKDb6TK@wuerfel>
 <20140716185715.GA4843@mithrandir>
 <20140717085308.GQ23218@tbergstrom-lnx.Nvidia.com>
 <20140717090156.GR23218@tbergstrom-lnx.Nvidia.com>
 <20140717110110.GI17877@ulmo>
 <53CCBCA9.7020907@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fjX3cMESU3XgGmZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53CCBCA9.7020907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2fjX3cMESU3XgGmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 03:09:29PM +0800, Vince Hsu wrote:
>=20
> On 07/17/2014 07:01 PM, Thierry Reding wrote:
> >* PGP Signed by an unknown key
> >
> >On Thu, Jul 17, 2014 at 12:01:56PM +0300, Peter De Schrijver wrote:
> >>On Thu, Jul 17, 2014 at 10:53:08AM +0200, Peter De Schrijver wrote:
> >>>On Wed, Jul 16, 2014 at 08:57:16PM +0200, Thierry Reding wrote:
> >>>>>Old Signed by an unknown key
> >>>>On Wed, Jul 16, 2014 at 05:22:03PM +0200, Arnd Bergmann wrote:
> >>>>>On Wednesday 16 July 2014 17:14:29 Thierry Reding wrote:
> >>>>>>>Ok, I'll have a look. I think when this becomes a separate driver,=
 it
> >>>>>>>should also have its own header file, so maybe you can in the mean=
time
> >>>>>>>make it a local header file in mach-tegra until we have found a go=
od
> >>>>>>>place for it.
> >>>>>>Why do you think it should be a separate header? We already have a
> >>>>>>couple in include/linux and I'm not sure it's useful to add even mo=
re.
> >>>>>>If anything I would've thought it made sense to move the content of=
 the
> >>>>>>other headers into tegra-soc.h.
> >>>>>I very much dislike the idea of having a per-vendor header file that
> >>>>>everything gets crammed into. We should try to have proper subsystems
> >>>>>and generic interfaces for these wherever possible.
> >>>>I completely agree. However spreading the SoC-specific functions acro=
ss
> >>>>multiple header files isn't going to help. If we keep all the per-ven=
dor
> >>>>APIs in one file it makes it easier to see what could still be moved =
off
> >>>>into a separate subsystem.
> >>>>
> >>>>Now for PMC specifically, we've investigated converting the powergate
> >>>>API to power domains. I don't think it will be possible to make that
> >>>>work. The issue is that there's a defined sequence that needs to be
> >>>>respected to make sure the device is powered up properly. That sequen=
ce
> >>>>involves the primary clock and reset of the device. It's been proposed
> >>>>to make these clocks available to the PMC driver so that it can contr=
ol
> >>>>them, but then we can't make sure that clocks are really off if they
> >>>>need to be, since we have two drivers accessing them. The only way I =
see
> >>>resets do not have reference counts, so they can be controlled by a
> >>>powerdomain driver without any problems. For clocks, there would only =
be
> >>>a problem for the module clocks if the drivers don't use runtime PM. If
> >>>we move all drivers to runtime PM, the clock control can move into the
> >>>powerdomain code and runtime PM will ensure domains are not turned off
> >>>with active modules.
> >>>
> >>>>to make that work reliably is by moving complete control of the
> >>>>powergate into drivers so that they can make sure clocks and resets a=
re
> >>>>in the correct states.
> >>>>
> >>>Which won't work if you have domains which contain several modules.
> >>We also need to control the memory clients in the domains using
> >>MC_CLIENT_HOTRESET_CTRL.
> >Oh, great. More interdependencies...
> Some domains depend on others. Can we take this into account?

I'm not aware of any dependencies. Can you point me at the relevant
section in the TRM?

Thierry

--2fjX3cMESU3XgGmZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzNcQAAoJEN0jrNd/PrOh9FwP/Ais2Ji5u7d3x6N4NI8C2NOq
pDZucsn0AufT1k+O1xYZvw9KAYq2JksXE1x38E/mjG4ef7H32JQ9gq2u5s4Cp+uD
gPh46kltskr0ty9z6PWCxLDWkDu4gONEH5kPCKIVwoeZwMDfREsW4GgXd/byvncS
THbM9dYPX1yVVN/aC+0OX4N/q+kWh2ED00Niy3m7q6STrdhoxuRHYiawQkHjy2BW
PQgdaGhnwFlWAQVil/84lgOayeLXGV9Isazjt6yz7CYc9VE3JyAyDgIUlt2wMw7C
1/myjzcWuN8jiQTMadqWP/RhiGFCWNwEgNrmCgg5MBcj8ZddLlHs4LcmBJeCTAjs
n0Fhph1fkS0GxBPKDpM8NdUpgLlysq4+JDVYxXXKirVhsSvBRtIhMTKJPpy4k0LY
h3MWLiw65pnpj78X/c1HM13Y19wXVzT6N4v7RHksusqRtEGi9BG9MN6KmgWelfNH
XQ6eNuJbFgOytko2KSxYrKcm0tdn7wIha7v/qA1PDNyVAn6OQzWoUqTBJEV5ZTh+
UfAsLtObIRTr8H6+lAtiNqlOOtDA2hIwJRT+sDiaPmZgvivNBRkqmGRZeoGVeet6
sH98HHMLas7SJCaO5mRIjt20EP0vOn8ezV6C+0zZ84q+BvdkaHSOJSTWNURYQMEn
raK5ua+5aqZv41g2LITo
=0X7Z
-----END PGP SIGNATURE-----

--2fjX3cMESU3XgGmZ--
