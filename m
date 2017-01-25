From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ARM: tegra: nyan: Use external control for
 bq24735 charger
Date: Wed, 25 Jan 2017 11:59:40 +0100
Message-ID: <20170125105940.GC9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-2-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170122154753.31942-2-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 04:47:49PM +0100, Paul Kocialkowski wrote:
> Nyan boards come with an embedded controller that controls when to
> enable and disable the charge. Thus, it should not be left up to the
> kernel to handle that.
>=20
> Using the ti,external-control property allows specifying this use-case.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Is the ti,ac-detect-gpios property still useful in that case? I guess it
would still allow to monitor whether or not a charger is connected, even
if the EC determines that it shouldn't charge.

Anyway, I've applied this.

Thanks,
Thierry

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIhRsACgkQ3SOs138+
s6H40g//TS7s0qZArrh9kb1Jh1DSD6XQZynhMZyjWY938JvYwT5WdObY1/gPVxYd
2Jv192eM1OCpQ9PCR7TIvuqavC780BgVifypVfH83vrGq9ASUXlmOFfOm1Tc1Jjr
V0laBZUqTfVXaEvQc94ScJAAJKugySdgVSBEYrvmGH05Qkc3+VkuBDqztbxqW2pl
pBIKG5sFaCb0g8+HZbbfWO/aRDoY/i6iIrCXpGX5ELOM2HLjZtmp9DX5+yMXPOZ4
ehzBaNGjheqy2E0BOryQYyym3HzToZnPFFvWfrJUjdwREYLeOf8QApX8NMPRTeo8
I/i71Ps54uvucPHZm/3edWBvCoKZRMPfE1JeWnJl+zX4UYSYNNL7ErrNUVznKCW0
EV1FPRA4NpuBTGoMwFJx5AfvrF+iE6MW/X+N5tmleIwHIowI5NXAegAzSd+9GW37
338RWHa7vQCj1soaijt1aNBZfYfI6sdhMKWAkM1U6/D0yOvHWaSIMPy+QMi/Kx8T
DDNn65eS2hRBUK24fEfPeN+XI9Ahg+n0lEbkc8KASC4Og9cVkjgwdR0bts0nA9iv
Txvt0JNNhnQ6AYHUjwRapyZJzctHoHdEoevtI/mKqUC68Jk3kgT7fGbGsQRkYpLk
15MyecBBjFSkBjC3q/Ng78T/NryqhziDfJhO/6c8pIZrODlkt2o=
=XGiH
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
