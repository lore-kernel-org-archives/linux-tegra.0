From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: tegra: nyan: Use proper IRQ type definitions
Date: Wed, 25 Jan 2017 11:58:12 +0100
Message-ID: <20170125105812.GB9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170122154753.31942-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 04:47:48PM +0100, Paul Kocialkowski wrote:
> This switches a few interrupt definitions that were using
> GPIO_ACTIVE_HIGH as IRQ type, which is invalid.
>=20
> This is mostly a cosmetic change, that doesn't affect any driver.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIhMMACgkQ3SOs138+
s6EYww//Qxfao/weYy3A/uZPX/7Uqg2P3cM+X7OtJVUBJoAJGUgLGd7igM5RX/UC
aQqPMgY2JWHpynJGzjUWNfK3dFH9RrFTvJxG5+phDVKJAEcprrejceOS0157FCeH
C2W1iZlJQBU0AlujBf3jCtxdpOJ9DQ3T3GTnB3ri8ylQgpYNpkDyWu5o4uCunppM
LPxXAD0mFf++1kOUNjfOjIe4yyHfCR3vfKpWyJQmk/H40jL7AVEOGxjR/v3MK2AA
hgj8DgtkeQxpOTAnP0TNIYaeCzlnBXOkeEfsjmeMdPDUoQ2hobqwaW4u41C3nXH0
swMT/fqPPxJVwPctmL24YlJmkHS9dRKKXn3XKsJIKgk+TFNyDoUjBrXM7/TCLwa/
IgIvv8qpCpS3GOxjkmXllFaC3f5BNpWhpFNMzhM5c4kcNEkO+BkFipc4h3Lbhs7K
M9Sibv7CXoP8PpqLZELrm/poeYoxYK7IcX4JzCrLODrfEPn2Yr9EaDIo+tmzt4pg
SP3WxB8+HVdWo63olBqZcsvNPCpxXsafGh8INa2ZTt3BuYUH7JAV64t9t2hbr+eK
49h7eYmZPfxCUmgvKhEYCkILSSwA1fX/Rsl4G+2iM/rjoroRH4hCHix/C/0PHAeV
IIznXd0jqr/i32IYU33SIobyOcJ7tJHupNd7FH4pM7m90yS4+So=
=2/Rc
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
