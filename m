From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 20 Aug 2014 16:32:02 +0200
Message-ID: <20140820143201.GA3368@ulmo>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
 <53EF76CF.9050808@suse.de>
 <53F2255E.7090208@wwwdotorg.org>
 <CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
 <53F28F90.3000004@wwwdotorg.org>
 <CAOesGMhBdQh_ddycZ-Y5dupR9hW74bogHtG3yyPUJ2tAgWi19A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhBdQh_ddycZ-Y5dupR9hW74bogHtG3yyPUJ2tAgWi19A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2014 at 06:29:14AM -0700, Olof Johansson wrote:
> On Mon, Aug 18, 2014 at 4:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> w=
rote:
[...]
> > Again, this board *isn't* Nyan, so it should pretend that it is.
>=20
> It is a derivative design of the nyan reference platform, and it is
> compatible with it. It is perfectly fine to claim to be compatible
> with it. I'm sorry, but you're just wrong here.

I guess that depends a little on how you define compatibility. I had
always assumed that the top-level compatible string would be a sort of
"checksum" over the rest of the content. Which, admittedly, makes it
kind of redundant. Compatibility could mean a lot of things. Does it
mean any kernel/DTB compatible with one device could run on any device
derived from it? Does compatibility mean it needs to provide full
functionality or is it still compatible if it runs at a reduced feature
set but doesn't "break" otherwise?

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9LFhAAoJEN0jrNd/PrOhomMQAJM8WPjVd8HAhqBBCh6g+xg8
CECurNr1KH9pcwkbLdStbFkNJcXEK7zV2RdSag+9L6lMwBPGoEhCn9Nmb/XWx5nn
NSLwh/EhESLc4p2e1XIw0N+ZcOQ9B0bhxjw7xJxvDgXp82qsZnOhMKbBGpLIIHTy
R6e3R1EEAp2mKXXS1rgp2+h8jmKzdL/JETHzT7L61z52kEGXLSSazpVRSYyNEW8w
xz7QtFW+9K4i1PFPTeKYDOZfXkRnZkjPd25XM8+FTBN6/jasBL6F8ppujhkHrEK8
IjdDEYXE1fDUVsZmml0nnOT9iu4EecdpwT7qEU4HrEZAkkYcsz2uIZb6Ycx3vLzE
NB1Rxgumuepmku3uBZdxNqYRkgDc3e7tbwkzNcsfEMjsW7ywvI0wJz2AZNpQAkJU
bL+5pBfyeVXhWtk3ad2oSMPA/4BEkVq0BUOAvdFhWHH3FVN/btdcDOg525ikUcBp
92R3ap0g5mmwXBn5KgrdsS3olKJ+QeC/5ovH4POOFn/v8wa5jSJPw7jSL3jY7UrF
mR5RZLRJj46uh3aiKFGc8Zs2CHtNXI9nMDGOpn6W1aVthpd8Ju2Y6A8hPXs/ByJ+
HNT5W0MNleGPD7eABq+DWTu8LYOeDI+iI3UsejulUdRVi4VArbZqxxT1COlKPDn0
N2ag3O8Ef70JVV0XfrRC
=nqqj
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
