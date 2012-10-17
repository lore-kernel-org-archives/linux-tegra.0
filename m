From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Wed, 17 Oct 2012 08:55:47 +0200
Message-ID: <20121017065547.GE21783@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <50775803.1010209@wwwdotorg.org>
 <20121012050957.GA29881@avionic-0098.mockup.avionic-design.de>
 <507888D0.1090103@wwwdotorg.org>
 <20121016082827.GI3196@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121016082827.GI3196-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2012 at 11:28:27AM +0300, Peter De Schrijver wrote:
> >=20
> > There are two ways this could work:
> >=20
> > 1)
> >=20
> > All clocks needed could be represented in the node of that device (or
> > perhaps in the DC node?) For example, perhaps hdmi might contain:
> >=20
> > clocks =3D <&car TEGRA_CLK_PLL_D>
> >          <&car TEGRA_CLK_PLL_D_OUT_0>
> >          <&car TEGRA_CLK_HDMI>
> >          ...;
> > clock-names =3D "pll_d", "pll_d_out_0", "hdmi", ...;
> >=20
> > That should work (I think) with pretty much no modification to the
> > current code, other than calling clk_get(dev, "hdmi") rather than
> > clk_get_sys(NULL, "hdmi").
> >=20
> > However, I'm not sure this is the best way or not; this still requires
> > the HDMI driver to implement all the clocking policy (e.g. is the HDMI
> > clock a child of PLL_D, PLL_C, PLL_P, ... and what rate should the
> > parent PLL be set to, etc.)
> >=20
> > For example, what if the clock frequency HDMI needs can be generated
> > by PLL_C, so we make PLL_C the parent of HDMI (so as to save power by
> > not running PLL_D, or to use PLL_D for a second display head), then
> > something else comes along and /has/ to use PLL_C. If the two childs'
> > frequency requirements are the same, everything is fine. If the two
> > child's frequency requirements are not compatible, we might need to
> > spin up PLL_D and reparent HDMI onto it. More complex scenarios are
> > possible where PLL_C needs to be reprogrammed, yet can be in a way
> > that supports both HDMI and some other requirement, so we only need to
> > temporarily move HDMI onto PLL_D, then reprogram PLL_C, then move HDMI
> > back to it and spin PLL_D down. All these decisions should be made
> > centrally in the Tegra clock driver, or at least some kind of
> > centralized policy management point, and not by the HDMI driver:
> >=20
>=20
> This assumes we can glitch free provide a new parent clock to eg. HDMI, I
> doubt the hardware can do that.

I think for starters it would be enough if the clock code was smart
enough to choose an appropriate parent. We could start thinking about
power optimizations later. I took a brief look at the current code and
it seems like all the information is already there, so we just need an
algorithm that figures out the proper parent that can provide the right
frequency and select it as parent in clk_set_rate() automatically. Such
an algorithm could be as simple as this:

	if (current parent supports frequency) {
		set parent frequency
	} else {
		foreach (parent clock) {
			if (clock supports frequency)
				select as new parent
		}

		if (no parent found)
			abort
	}

Checking for frequency support of a new parent would also involve
checking for conflicts with other children of that clock. For some
rudimentary power saving it should be enough to prefer already enabled
clocks when looking for a new parent, so that if a compatible match is
found no new clocks need to be enabled.

Does that sound reasonable?

Thierry

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQflZzAAoJEN0jrNd/PrOhl+AQAK8m1d7bU/L9sAxuHa5tSStj
SeH63PXWr3qwvooLuMPQYosgMBx+Hmsc5nDNBiog1eDBibFI5z+W1jacNDHtIlj2
5TpCtiQdN6nOGie+9/y9XToljLkLIRc6vJfnfTVLVMDxrUld4Jh0PATQ4cr2tZqe
ez0Cev7pM7zlRcGlX1tsvJJAJIqdTNLtrkM1NyYz10SVC8FlzYmyiesFSErtPgi1
atG8hP5BwiLxPWDpW3b+xvdWo0E41FH9XGC3hDjJVPmcSzNyXSrM4h3wa4nXUeKa
2KOIAt+FFwNuJb579hYeXBhpVGVnB3JhLDN4GM9zT+aDCxVehvBH0YU0cVdWPZZo
NVAk4wabIQ69F8ESpjcvPc+UAbG188tc2N9NuJP70hGrmaI6MWWjUbfICnQ477qc
9zelbZfmKbzPjaBDe8YLDTJXA+WxZ0M8O9ZSGDk04OJ5WpKiDuojwC0CI3K7l78W
lmZ6SWrnPrR7wGQA5DWYqzcP6i637fz0gZ8DbRmRKoHxK9iTKEY9nwpAoAxQzST2
fwmmBe17FNgmX4/d0ODvVfrRiQhf9Q79THXLVFWlgwGVBiwg+09W/D9kxDYlCUHU
aDu+qLtoEH8Ua9E1Lz6wy9ngQMWxezefVgipWHLeyGErG+0u/KLdTXi3odWjl79m
z8qDfiR3zUv5sNEY1+NB
=qH0b
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--
