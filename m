From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 7 Apr 2014 10:18:39 +0200
Message-ID: <20140407081838.GB25718@ulmo>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396650665-6992-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2014 at 04:31:05PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> BIT_WORD() truncates rather than rounds, so the loops in
> syncpt_thresh_isr() and _host1x_intr_disable_all_syncpt_intrs() use <=3D
> rather than < in an attempt to process the correct number of registers
> when rounding of the conversion of count of bits to count of words is
> necessary. However, when rounding isn't necessary because the value is
> already a multiple of the divisor (as is the case for all values of
> nb_pts the code actually sees), this causes one too many registers to
> be processed.
>=20
> Solve this by using and explicit DIV_ROUND_UP() call, rather than
> BIT_WORD(), and comparing with < rather than <=3D.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Use DIV_ROUND_UP rather than BITS_TO_LONGS to avoid problems on 64-bi=
t.
> ---
>  drivers/gpu/host1x/hw/intr_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

If I understand correctly there's no immediate need for this to go to
stable kernels, nor for it to be queued for 3.15, right? That is the
potential extra write isn't causing any harm on actual hardware, is it?

In that case I'll queue this up for 3.16.

Thierry

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTQl9eAAoJEN0jrNd/PrOhEPYP/jZy8ng768uSqin8SUZJXNOG
FY0LQwy6uw/lA8q2oHTNQ6zNbX0Wkcyl8NgS6kYktMJO+/5cbXi9acfVtNGsx35w
YBfeo3hTSUu/9/O4Icw6WzHOcRbGfFXe4vZAodHo4N1aCPBt34JbChJb1HeLsaA2
alMyH500VJ5VEBnPLZTkq4tgSjbYokkQAbrJjzHbWB1w7o5bh+gjQZTvVrfCQHSh
82p2Yd9xbe7KWWrGYIC37qLfk7E5UlDVkE0qCeo+CTOE9vPQPTt2EYTd7FExhXCQ
GVF9hMjXXDUYAz6gIgq2MAVCbkhI72wPdX21uyQxceui7Izsdo7a//VfPLgX2Nqh
YCcmxU6G9sLVhUGCA5yFvdU5SjzkuZdFGxgD0SrPYg84Nrr+d7XJdLvYAoZ0kmrY
5lwFAwW/6Cwu/06I7eQ7PrTGmdhkKjMipoHmypR1yZTFPrDAfbSUgWMMufk2T62C
WrWr37yEm4rzK99aoSwaN4gdsWAsNGTETjcp/Lgn2Wf9fB+TfbcG+Jkfbvz2A4wF
w5Wsig/aUfvCaKAAgOBYB0cAeA4tY/6S4xgo8mcsdPbK850Nttp4zE7CAHCVrHyy
Kpz/u4jIGHyoUoBjJP9ozgBhMIoaDqoUh3VZkxKfM+LoGCrYVkFQq9F6mD+CEsof
ZCv0cO0mVhQhL0KEEMMX
=rPMk
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
