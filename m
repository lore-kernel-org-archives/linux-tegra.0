From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 14/16] PM / devfreq: tegra: Enable COMPILE_TEST for
 the driver
Date: Tue, 4 Jun 2019 16:10:31 +0200
Message-ID: <20190604141031.GB397@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-15-digetx@gmail.com>
 <20190604112026.GN16519@ulmo>
 <ed2c502f-8f49-d89b-32c6-4b5415e1fa47@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ed2c502f-8f49-d89b-32c6-4b5415e1fa47@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 04:53:17PM +0300, Dmitry Osipenko wrote:
> 04.06.2019 14:20, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, May 02, 2019 at 02:38:13AM +0300, Dmitry Osipenko wrote:
> >> The driver's compilation doesn't have any specific dependencies, hence
> >> the COMPILE_TEST option can be supported in Kconfig.
> >>
> >> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/devfreq/Kconfig | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> >> index 56db9dc05edb..a6bba6e1e7d9 100644
> >> --- a/drivers/devfreq/Kconfig
> >> +++ b/drivers/devfreq/Kconfig
> >> @@ -93,7 +93,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
> >> =20
> >>  config ARM_TEGRA_DEVFREQ
> >>  	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> >> -	depends on ARCH_TEGRA
> >> +	depends on ARCH_TEGRA || COMPILE_TEST
> >>  	select PM_OPP
> >>  	help
> >>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.
> >=20
> > You need to be careful with these. You're using I/O register accessors,
> > which are not supported on the UM architecture, for example.
> >=20
> > This may end up getting flagged during build testing.
>=20
> We have similar cases in other drivers and it doesn't cause any known
> problems because (I think) build-bots are aware of this detail. Hence

I don't understand how the build-bots would be aware of this detail.
Unless you explicitly state what the dependencies are, how would the
build-bots know? Perhaps there's some logic built-in somewhere that I
don't know about?

> there is no real need to be overreactive here and in this particular
> case it's better to react to real problems once they show up (we already
> did that by fixing build breakage caused by a CLK API problem found by
> bot in v3). Does it sound like a good argument to you? ACK?

No. This strikes me as a strange argument. I'm pointing out a potential
source of problems and you just brush it aside claiming that it's not
true, or even if it was true that we'll see eventually and we can fix it
up when there's an actual problem.

Why would you want to have to fix things up if you can avoid breakage in
the first place by being a little proactive?

Thierry

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2e9cACgkQ3SOs138+
s6E4kw/+I6WkfUA6GnWVtk4560uJsTWMw63natQl7Vz+UpCHky4vw7eUN+Pt7Erc
eiN0fPVTsblMKeZ6LuweWk8ZtZ5iqNAaeBYu43DbiqJ60x+WxShfucYjgnLM+4F+
G/fuIInBSMDbe3TzIMS1C/C7pIgWbkdrsadU+j0Z/PFp/WJ4JElXWgxG+aeOW3wo
lIIgU7Wzz9aCVktOkVkz738FCzv84dE79zoeMpMPTSpjCha3d5NkXmFhzvcNTJ3z
vOFt0MWiFwzLjzR2oxfWNUgleB4oGNeRslL7uEakleZEPcDquDS31fNyzlZ/1iPU
ZC7EH5aWc9GCGXhUFLkQrMt30PJa+huwCIFL20fWwpLhoHdSzdBMOmEg2z4xIpoY
1DsWC52KpF1soSoYN3EHhqd/9GKGMW9ZSGicsXuI+i0ZY5lW02O11pvC9ZgVUwKY
xHIY6+9oDmnVAHNIxRN3VwrfaeEgu+snV4cngeBtv/Lmh0XHPVKelUSjgAlVJ3nB
8x/r+tjq18K6XGOWSxHFggtxFMwdGRmJnfCBrNItemdOZsQ8vTRUvjM29bgLD7EU
kVj1JQIDKDqnVIyYDBwo2OquIPyznVMXXNMhoP3M/QGp70OWnj9Y2sWod0vr1zSh
2Pj6WiWBwhBcZXQQKv9McEbxgQBnE0Gca8u1BBKlin5Jc/V1Dl8=
=uV5V
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
