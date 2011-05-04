From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 0/2] i2c: tegra: add some new features for tegra i2c
Date: Wed, 4 May 2011 17:19:41 +0800
Message-ID: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD4EA@HKMAIL01.nvidia.com>
References: <1303301312-15302-1-git-send-email-wni@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0497F1AEEF@HQMAIL01.nvidia.com>
 <6B4D417B830BC44B8026029FD256F7F1C2CB3DD4E6@HKMAIL01.nvidia.com>
 <201105041028.09316.marc.dietrich@ap.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201105041028.09316.marc.dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Marc Dietrich' <Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org" <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Marc
I think no other implementation.

Thanks
Wei.

-----Original Message-----
=46rom: Marc Dietrich [mailto:Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org]=20
Sent: Wednesday, May 04, 2011 4:28 PM
To: Wei Ni
Cc: Stephen Warren; khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; lucas.dema=
rchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; lin=
ux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Olof Johansson =
(olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)
Subject: Re: [PATCH 0/2] i2c: tegra: add some new features for tegra i2=
c


Wei, Stephen,

> Hi, Stephen
> I think if doesn't need to apply the slave address codes, we can use =
your
> patch.

we use the slave address as part of our nvec mfd driver in the ac100 pr=
oject, so=20
it would be nice to have this merged. Is there any other implemenation =
for a=20
driver which actually use "is_slave"? (beside the one from the older an=
droid=20
kernels)?

Regards,

Marc


> Thanks
> Wei.
>=20
> -----Original Message-----
> From: Stephen Warren
> Sent: Friday, April 29, 2011 11:20 PM
> To: Wei Ni
> Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; lucas.demarchi@profusion=
=2Emobi;
> ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Olof Johan=
sson
> (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org) Subject: RE: [PATCH 0/2] i2c: tegra: add some new
> features for tegra i2c
>=20
> Wei Ni wrote at Friday, April 29, 2011 12:08 AM:
> > Stephen Warren wrote at Thursday, April 28, 2011 12:29 AM:
> > > Wei Ni wrote at Wednesday, April 27, 2011 4:26 AM:
> > > > Hi, all
> > > > Could anyone review these changes?
> > >=20
> > > Wei,
> > >=20
> > > It looks like some of the patches I recently posted address the s=
ame
> > > issues as the patches you had already posted. Sorry for the poten=
tial
> > > conflicts.
> >=20
> > Hi, Stephen
> > I think your patches address the different issues with my patches.
> > My patches are used for retry transfer and new slave controller.
>=20
> Wei, aren't the following two patches basically the same thing,
> except that yours also sets the slave address register, and is a bit
> more wordy:
>=20
> http://www.spinics.net/lists/linux-i2c/msg05464.html
> http://www.spinics.net/lists/linux-i2c/msg05437.html
>=20
> Upon further inspection, I don't think any of the other patches I
> posted conflict with the other patch you posted.
>=20
> > > Can you please take a look at the patches I posted and comment on=
 which
> > > of those are still relevant given your patches. Even for the case=
s
> > > where we both posted patches to address the same issue (e.g. use =
new
> > > slave mode), there are differences in the patches. I simply took =
the
> > > changes from the chromeos-2.6.37 kernel and cherry-picked them in=
to
> > > the mainline kernel. Are the changes you posted re-written to add=
ress
> > > issues that weren't solved in the ChromeOS kernel?
> > >=20
> > > Thanks for any feedback on this.
>=20
> Wei Ni wrote at Wednesday, April 20, 2011 8:09 PM:
> > From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > *** BLURB HERE ***
> >=20
> > Wei Ni (2):
> >   i2c: tegra: Retry transfer when unexpected/no_ack status is detec=
ted
> >   i2c: tegra: use new i2c slave controller
> > =20
> >  drivers/i2c/busses/i2c-tegra.c |   57
> >  +++++++++++++++++++++++++++++++++++++-- include/linux/i2c-tegra.h =
   =20
> >  |    3 ++
> >  2 files changed, 57 insertions(+), 3 deletions(-)
--=20
Dipl. Phys. Marc Dietrich
Institut f=FCr Angewandte Physik
- AG Kleink=FChler -
Justus-Liebig-Universit=E4t Gie=DFen
Heinrich-Buff-Ring 16
D-35392 Gie=DFen
Germany

Tel. +49 641 99 33462
=46ax. +49 641 99 33409
email: marc.dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org
www: http://www.uni-giessen.de/cms/iap/
