From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clocksource: add missing line break to error messages
Date: Mon, 13 Mar 2017 18:51:53 +0100
Message-ID: <20170313175153.GC19679@ulmo.ba.sec>
References: <20170309094710.31003-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170309094710.31003-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>Ba
List-Id: linux-tegra@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 10:47:10AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
[...]
> diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/te=
gra20_timer.c
> index f960891aa04e..b9990b9c98c5 100644
> --- a/drivers/clocksource/tegra20_timer.c
> +++ b/drivers/clocksource/tegra20_timer.c
> @@ -245,7 +245,7 @@ static int __init tegra20_init_rtc(struct device_node=
 *np)
> =20
>  	rtc_base =3D of_iomap(np, 0);
>  	if (!rtc_base) {
> -		pr_err("Can't map RTC registers");
> +		pr_err("Can't map RTC registers\n");
>  		return -ENXIO;
>  	}
> =20

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljG3DkACgkQ3SOs138+
s6EIiA/8D0Nmav+tFXE1bSX9WvEaVbsDxBMaCfObYCOJ5vmgb0pFT0rwQM4TgrcS
Oyk8b2/lJ8GgZtibDzq1Gmpr7PeFg7Q1NqO5CpDCcV2+8V4L6ceSq9CVULJh8fcg
buZyncc+CqFfLru/5NmDqHQu9kYxfk5V9LlmiH2pS7/ZmcPFrtLAVzgi/iOXv46f
akQ9075pDcLtCWxClavnv3XH7l/PnDVa8Ca0Chl2PtY4U6RhM7JjwsKTNA2t4o/p
F7P2FOxbKEqjyA6du4p6oIhkliWs9c5gg47qmdiIj/dNNz1RRqEmdWowoyoPEcGz
G9y1L1V4UojCTWokgML/x29Ev5gRzg4fxR8axEQgwIsjdjn8dStVI3cpBo77/prH
LvejYeCLB9hg/IDOO8K7ocmJHTAFGstuaE8WouWSwqGtqPgGicDceHGwfdHS2b7I
RcXtR0maDLccE3idb3HbRXPY1M2/7X6A+acTLjC7BWaluhWsMWFVwmtkVZ62Wgq6
TLPFhL9phOc0jKTQESj/Jt0Gkq/bznGnndJk86ula5GjYtiqqCZarrCf5qTcx3he
WiwiEkKxBxIKvL7KiuxB8dU1hTuqHlH1w8YQFrCZzPSlhIUvrrsbnKv+GtOnkVdm
bpBg5dGFkJ07QQSL8doq3bR+Ulhg4o3R9vSNAMQaN04hh6HxQ6w=
=IFoR
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
