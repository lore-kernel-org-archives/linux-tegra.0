From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: Kconfig: add basic support for the Tegra SoC
 family and the Tegra132 SoC
Date: Wed, 7 Jan 2015 15:20:06 +0100
Message-ID: <20150107142005.GA1621@ulmo>
References: <20150107081638.14381.42444.stgit@dusk.lan>
 <20150107081729.14381.47835.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150107081729.14381.47835.stgit-orwA252wQtA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 01:17:33AM -0700, Paul Walmsley wrote:
> Add basic Kbuild support for the Tegra SoC family, and specifically,
> the Tegra132 SoC.  Tegra132 pairs the NVIDIA Denver CPU complex with
> the SoC integration of Tegra124 - hence the use of ARCH_TEGRA and the
> Tegra124 pinctrl option.
>=20
> For the time being, Tegra ARM64 support is added with a dependency on
> CONFIG_BROKEN.  This is temporary and can be removed when the
> following two patches for compilation failures have been merged:
>=20
> "soc: tegra: pmc: restrict compilation of suspend-related support to ARM"
> https://git.kernel.org/cgit/linux/kernel/git/pjw/tegra-dev.git/commit/?id=
=3D053decbf3900d4e8fee799f9a29cf8d905b2fcb1

I think you said you were going to respin this on top of v3.19-rc1, but
the above doesn't seem to be rebased yet. Given that the only comments
were bikeshed from my part, do you have any objections to me taking the
patch and apply the bikeshed myself?

> "clocksource: tegra: wrap arch/arm-specific sections in CONFIG_ARM"
> https://git.kernel.org/cgit/linux/kernel/git/pjw/tegra-dev.git/commit/?id=
=3D220aa7fcc74a1a089916be6cb34b0e326f31841f

I don't think I've seen any comments other than mine on this patch.
Given that this patch depends on the above to get rid of the BROKEN
dependency, it might still be preferable to take both via the Tegra
tree. Otherwise we probably have to wait until v3.21 before we can
apply this.

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrUCVAAoJEN0jrNd/PrOhGe0P/2tJjPTRQ39s+2nm/vDOwLhu
L9gw2ipkHSyrHhliQozJSWgZzU79Oqb8OgpBjJRFYDB3KLxpctc8dvryyerhETOA
Qa2BSb4wNbOfbswM8u3f8sKCVzRUhqvwFn/rVaucY/Wu9MAx/W8ST49RnTixsPDe
Stasb87jr+Q1j2hy70huyltDOqqAJcit1kCIX8Xl++qFJc1niBi9u5qSIfOQeoFN
uYy2H10+A0RIzupLjIru/VG4Jk1/BS09ssikSrKU7NNDnLYUVVJDzxqkwQLJkpTc
2SY8xeR6KGWBCrlnr6jAzgcTKpZzIdSvBQcDqEDmBgc5YMJVC94daWhPQTPMrBur
/LpVs3EPhi4e+mMcqsezG+FTUkJhB5gCkbvGub1sO/IPDYrxcSh0T04ld9ylE25b
m/BCYPp2PesEzzRKvg5bILKTbevnr5ObCLXXrQOfluUMqgR6RAu8E78PjSwuoUKD
35F6DHZ9WXXA2oPGUE673geIrAHmSfNjqATnF+7meiM6hU5yM28S14i4ZriphNxG
tIk9xw/GnALq7+6dMYt1/Xw20r3iLKM1kehL1qxlj+HowzMNA5f89ki//JfWPw56
PyhMSZlhLS8VTyC0M4CO/HCQj2rxf/DlrmCge4NvTE41vdt0tFhFhFUjJp6zJJe+
2HlmZO8iMbs7Ei87FoBH
=oDaT
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
