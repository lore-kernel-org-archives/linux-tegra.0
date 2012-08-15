From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Wed, 15 Aug 2012 22:21:05 +0200
Message-ID: <20120815202105.GH12870@avionic-0098.mockup.avionic-design.de>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org>
 <20120815201244.GF12870@avionic-0098.mockup.avionic-design.de>
 <502C0385.6010203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <502C0385.6010203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 02:16:05PM -0600, Stephen Warren wrote:
> On 08/15/2012 02:12 PM, Thierry Reding wrote:
> > On Wed, Aug 15, 2012 at 11:39:35AM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> Removed:
> >>=20
> >> * MACH_HARMONY * MACH_PAZ00 * MACH_TRIMSLICE
> >>=20
> >> These used to enable board support for individual boards. Now
> >> that we only support device tree, these options have been
> >> removed.
> >>=20
> >> Added:
> >>=20
> >> * TEGRA_PCI
> >>=20
> >> This used to be selected by the board options above. Select this=20
> >> explicitly now that the board options have been removed.
> >>=20
> >> * TEGRA_DEBUG_UART_AUTO_ODMDATA
> >>=20
> >> This makes the kernel automatically pick a UART for earlyprintk.
> >> It's likely to be a useful option for everyone.
> >>=20
> >> * PWM * PWM_TEGRA
> >>=20
> >> Enable the new PWM subsystem, and the Tegra driver within it.
> >>=20
> >> * GPIO_PCA953X * GPIO_PCA953X_IRQ * MFD_MAX8907 *
> >> REGULATOR_MAX8907 * RTC_DRV_MAX8907
> >>=20
> >> Various drivers required for the Whistler board.
> >=20
> > Just a nitpick: this list is missing GPIO_TPS65910.
>=20
> It jut got moved in the file; it wasn't added nor removed (well,
> perhaps it was both:-).

Yes, you're right =3D). Sorry for the noise.

Thierry

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLASxAAoJEN0jrNd/PrOh1IwQALthjyPkAyPZ/EKX58BooPuz
rWjn5N/OafWhR8Vn+ery83UVBr/aA8ZV2grIPOuGrnx22a2fNgzuUbSC6MxlNO7o
cHK39napsE2nYbMuKgmnZeBv/70C7NqDtajQaYp9zoHlHClmzcAOeTJQRpEl2GG+
gnQIxKpT4W2my7xL8aAgzIt+CL4Jnbp42p1j2H6kOyzfuKf5jiFlwp9PCqkB/esr
I8ekwMVJCmhFD7dw6aSiKNxnjI0FtFkaOAV1/XzOdd1nj3NccykibJLv1SofYp12
w1AGOoJA5ZbSr3ZZcza5ikDVOjGDyo11POMtNi8eG59R+NF7TekhDDBywMGkHa2O
IwflWDG4/ORipsCujPxMKAQVL/E7gsU0efzG7wCx9M7ybXe41j1tXC0syrJUWJnm
fJ4T5pR8k4DejD8Hl9qbkGOTtaPaXF4VrjN+g9wsOfFVBMWr97UOwE94RdLbh0FF
jIBz2w2mKSkYee7Uy48U/dMLn/E+BqIfi1AGPbpcljc25YxURvMyN37cNp5V6Wly
4DEMN3CLElsNkvrFPXLpBg4ls4ppWzh8spohYNtBJiU8V2BfBEGeEV4HlhyDqm4T
fpLnokkvAMqhOWWpCdnOqsveccvnj3DtRwvUfmATFgh56WMGN1VGm55rvGJAxZcM
Y7AKfY9F4JnJwQskkLkA
=Ou89
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
