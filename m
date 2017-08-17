From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: fix error return code in host1x_probe()
Date: Thu, 17 Aug 2017 17:32:15 +0200
Message-ID: <20170817153215.GE30664@ulmo>
References: <20170808050806.GA21976@embeddedgus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170808050806.GA21976@embeddedgus>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2017 at 12:08:06AM -0500, Gustavo A. R. Silva wrote:
> platform_get_irq() returns an error code, but the host1x driver
> ignores it and always returns -ENXIO. This is not correct and,
> prevents -EPROBE_DEFER from being propagated properly.
>=20
> Notice that platform_get_irq() no longer returns 0 on error:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De330b9a6bb35dc7097a4f02cb1ae7b6f96df92af
>=20
> Print and propagate the return value of platform_get_irq on failure.
>=20
> This issue was detected with the help of Coccinelle.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVtv8ACgkQ3SOs138+
s6ExehAAu/q7iaIYwZYO91+E4h1kMc6TrB9DMWKma0OEyfYeeJixs0T0JpXmvePM
F+1dqZIDK82gcnQqyqaSY4iomWjxcK/mE5PGfgE74FuqgYpn+phBUMNSUNG1ZuZV
Iwc0GEzBt42FURYqOFkpkhrZERcr/Kt21suV8pvqD4++PaEqeQakGLnmXAsx8hpC
s1XyeM3CLetcAcTux0UUcJtshzFy3JCZFjwDkDlUWcjLPPSluhFlBmlIIAH0F3JY
M1L4LxbgovOPyVqMJNsG52XiXviytI27JdbaR8Fb6ns7OTsBJITi5faP9cTU8lXH
e5SDnnjd4aGIAPBxHWcEPIyYQNgitlbM65uIGXvGq2IMOTpozW9g0dz2aloQAnyS
RgEhPSxKASc3H5HHDO079UeaedAohs09kGhCR0tjkFWxo+6KC3iXKOFnyOBiphiO
iAf+EcYm3wfbCxk9FllWf4uvRyKCapwnY4/EzjwLtlhPWSY7tkMK6l8v62OcLby4
BXn/LLaSaVZXZ0N3iXcXFm56n85frSVi8KsUM6QT4eiaK0rchhKlhk6t23bg4q/9
SMfLd37nk1yRS63gvTv24yq+yt76RwbzluDW3pIP7DXjn0R7CIA4l4SN2ORCAcWC
OQ/P6KiJQ8nTGMnVqrTY4pZoiTBs773r2PwyBxthOowP9u2cvFw=
=/GEu
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--
