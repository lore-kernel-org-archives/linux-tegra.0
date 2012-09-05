From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2] usb: move phy driver from mach-tegra to drivers/usb
Date: Wed, 5 Sep 2012 15:52:11 +0300
Message-ID: <20120905125210.GG19591@arwen.pp.htv.fi>
References: <1346395526-18219-1-git-send-email-vbyravarasu@nvidia.com>
 <5046772F.6060908@wwwdotorg.org>
 <D958900912E20642BCBC71664EFECE3E6DDE77533D@BGMAIL02.nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6DDE77533D-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 05, 2012 at 06:24:13PM +0530, Venu Byravarasu wrote:
>=20
> > -----Original Message-----
> > From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> > Sent: Wednesday, September 05, 2012 3:19 AM
> > To: balbi-l0cyMroinI0@public.gmane.org
> > Cc: Venu Byravarasu; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org;
> > linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
> > gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> > tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> > usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH v2] usb: move phy driver from mach-tegra to drivers=
/usb
> >=20
> > On 08/31/2012 12:45 AM, Venu Byravarasu wrote:
> > > As part of this patch:
> > > 	1. Moved existing tegra phy driver to drivers/USB directory.
> > > 	2. Added standard USB phy driver APIs to tegra phy driver.
> > >
> > > Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Felipe, Would it be possible to apply this patch to a topic branch, so
> > that I can merge it into the Tegra tree? The reason is that I'd like to
> > remove Tegra's devices.[ch] in kernel 3.7, but to do that, I need to
> > move a tiny chunk of code out of that file somewhere else, and doing
> > that relies on adding a #include to usb_phy.h/tegra_usb_phy.h, which is
> > renamed in this patch.
> >=20
> > Alternatively, if you don't think it'll cause any merge conflicts with
> > the USB PHY tree, I can just take this patch through the Tegra tree if
> > you want. Venu, do you plan any other patches within the next couple
> > weeks or so (i.e. before 3.6-rc6) that will depend on this patch? If so,
> > taking it only through the Tegra tree might not work so well.
>=20
> Thanks Stephen for verifying the changes.
> I'm planning to push next patches, with tegra3 phy support added, very so=
on. =20

Unfortunately the patch didn't apply on my xceiv branch. Could you
rebase on top of that ?

thanks a lot

--=20
balbi

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQR0r6AAoJEIaOsuA1yqREU+cP/26mtYi3PmA8BJ3+2U7HxxRB
UVgQpwTJjlf/5JxO/Gfwh7LA9iJEe175y3SmeiETlCwr59YxONXpcaRkBXGFE2Jg
s9MwArQX7G1nUlDQaWCgUdr3vr77V0onVoeqcHTMSw4FEiVZXdMgPvFVz+jmdYw0
5Ed7dhW7AelJIxu/4AwXHAF2vK/Pr4X2GcQAF0IIG0ivVEGXc21QLhig00MKKpQD
1Qs/aUHRq+emwW48K0Nrja0eemIXoJBa55iT9eVR4RdRmox2j+6eFyHny/VbNeeh
ghMGVqWvGf+1vEJdcrhfrIAy1nurrAyeVCV0pMRHInpD/HtmO+YykEYZ825zk4EY
A3eXxdAMOqRWQr4u4bK5rDioX1yM+kYQDUg5xdKAILB3fCZOfdPDYSy3kbzTG/nB
tsvKI4/z3OUX0Mtsqq+Gdwic2bclLHnsUCquJN9QsJQDZD4ONTwOEOZQMjoV5FKr
UImzRA3XaItF7ShAwsltNFbAUHdIvWks+BqRT7SaqjzUvavMx1XFPxFt4nJy4ltu
0lw96V3I+Rhmlt/mUgdE9f4WWbnYo2Z5tdFj7+xIbyakM+xwd1ZiiD1Ay4cBCsH8
wtOC18c7OpIanoL2vAx5O0nC6QwKJgPw0cBcn1bvuiMnJhdf/j4DZFSDt3CjSkWm
KqLhxxH7EQUvt9yq2Lcz
=etm1
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
