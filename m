From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clocksource: tegra: Maintain CPU endianness
Date: Thu, 26 Mar 2015 16:31:15 +0100
Message-ID: <20150326153114.GA22227@ulmo>
References: <1426693503-6056-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426693503-6056-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 06:44:49PM +0300, Dmitry Osipenko wrote:
> Support big-endian kernel by using endian-aware register access functions.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/clocksource/tegra20_timer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVFCZAAAoJEN0jrNd/PrOhiXUQAIISWyqTE8YUDbRwxtAddSKZ
24Wjz6HS+8Rx7wfgXLPnYLbxFgKUCAkWP74ZISR2hj5tMVyXoKA6XwWwFxklLzCl
hsPsuPaoxrELKS2F1IvzGLeycWhDrOmbPDI79cR7x+oJfD08d1edVa82dNbsWudw
JXVSKTjJsecF8poaQGOpLGEFzfEqLNA5Rg7axtIcWhsXWw2J5XducqSgLEmePO3R
SDHjl9Qu8n36ZymVtNuHR+IP3hul26MK1pIqBx6iwyr1uQETMw5kRmey8OOPdici
E6av9YtwunmDUdDoYp2XKEv3cHLCQV5ZsznXqK47mbJc6ocKwoMyhLr84x7E5BDn
FqTmKSB8Oje/6e34GOLVztMesbzrrAgSJ+X0udFPxbtuyHmluHCrZVGXxz3lU9wB
kO/vx1+Mr81u3WEZBJSRenuq9V0/zQfXinMDpdr13MiWFECsiQgr36nZcEQYsrpY
HxNFq0GVl3+K38KGKIm84HV/O5iLSMiiX2DuehYyZ0UQxvQaNRx3lX3Gg2AV/Ykf
Ju60GjUwR7hjPI43hECEuMWKuVeDslWXVLDfgPxzGNubQFfvfn//SjK2mqZOrsal
5QaJPSGyS2zjbnA2GSzz82tVUEYhl5r23oLCECI53eG8+CugdJtVVO/+9BaeyQge
dVFMsp54Qeu1ogXXK/JH
=f9S8
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
