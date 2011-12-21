From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 4/7] arm: tegra: Fix PWM clock programming
Date: Wed, 21 Dec 2011 10:12:27 +0100
Message-ID: <20111221091227.GE542@avionic-0098.mockup.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-5-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E7E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E7E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> > From: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >=20
> > PWM clock source registers in Tegra 2 have different clock source selec=
tion bit
> > fields than other registers.  PWM clock source bits in CLK_SOURCE_PWM_0=
 register
> > are located at bit field bit[30:28] while others are at bit field bit[3=
1:30] in
> > their respective clock source register.
> >=20
> > This patch updates the clock programming to correctly reflect that, by =
adding a
> > flag to indicate the alternate bit field format and checking for it when
> > selecting a clock source (parent clock).
> >=20
> > Also, adjusts for the frequency divider being offset by 1.
>=20
> That last line applies to the original patch in the ChromeOS tree, but
> not to the patch you posted (the edit to arch/arm/mach-tegra/pwm.c that
> was in the original patch isn't part of this patch).

Right, I've adjusted the commit message to take that into account. I assume
the commit now also requires my Signed-off-by because I actually modified t=
he
patch? This would be true even in the previous version because I had to make
some small adjustments.

Thierry

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEARECAAYFAk7xovsACgkQZ+BJyKLjJp8LOwCgqxWVZ5xy1a/3jf7aJCt/p6x+
aAMAmLBbJWN+sDQ0E/MkMnG7M62qsIQ=
=Lgp5
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
