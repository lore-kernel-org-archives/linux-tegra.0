From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: don't flip master of DT-instantiated DAI links
Date: Wed, 16 May 2012 09:45:03 +0100
Message-ID: <20120516084503.GB6801@opensource.wolfsonmicro.com>
References: <1337028442-5603-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337028442-5603-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 02:47:22PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Commit 4924082 "ASoC: core: Flip master for CODECs in the CPU slot of a
> CODEC<->CODEC link" added code that was conditional on there being no
> PCM/DMA driver for the link. However, it failed to cover the case where
> the link was instantiated from device tree, and hence was specified by
> DT node rather than name.

Applied, thanks.

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPs2j5AAoJEBus8iNuMP3dNr4P/RjNgG/s0yVdfVMeSr/CdYh+
XEuOgfbNsIUW8G0bZ4SrIx/53Tm5T+0yffGXLu3LvF6GrM8HrMwCU901yKR8Biny
oFjmcyaQ8m7A7fIiATj1tNiCTu31LrWoTk9iyHGqlc39HdfrTkrsC6HmHWYsEcMf
6HGnGueV/d2+MsqAxoYs8tq9gMWzYb70zArL+KhNbh3Ef0VSduL39srG3W5pW0Q1
U78zMvdXc4HstdPkBdxyKuh5kEnLufoQE0CUvW0L8uAUao302fOhs5nqglfyK649
0tY/i+LMHW0YE2DXMSIZ3HqgkFe6wPh4bS2nT0ymd81z23K85z1defU84g7Htqtv
Wet55VatVYtjFYK9xLut93u06mkcTNMNqk/iiMAvOyAl0KW84RGpanzXZ57whCsL
My8W/CX6PvfIYjAK7TXFWET+ErSNiz6NzyFNAz+AtqVtBXpQoTURiazeRqa+8Wnt
HWDXw7v1NlQ3gSnDKsdHuNnLl5LsEP9mlK+OF5DHL0UkkXbcPjr+UgjOknekgt19
Cl4ggWL6XbQNuiPaSQGGiYYrFkxyOzyl/TOTwYKamzAWdkT++IER4FzsxM7sRJ6+
1x+IsfZBzuGn2jGyC+TZSVKK43nob/zO4CG4Q8+sS4PwXqahxjgcKMN+qbICo1+5
1BL9tuGWvmeCXd6CPUBb
=9H8Z
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
