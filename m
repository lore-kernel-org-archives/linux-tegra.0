From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm: tegra: check HDMI sink capability
Date: Wed, 16 Jan 2013 16:24:21 +0100
Message-ID: <20130116152421.GB965@avionic-0098.adnet.avionic-design.de>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
 <1358347002-10999-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358347002-10999-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 03:36:42PM +0100, Lucas Stach wrote:
> Check if sink is HDMI capable when enabling an output. This disables
> HDMI audio/infoframes if we are talking to a plain DVI sink. All things
> except this check are already in place.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9sYlAAoJEN0jrNd/PrOhqbwQAI/G30AxaRcMv5py/2C7vig6
8+J+DFKAmNLfev0gtNGRhfXcfWV4VwWnGdktGOd8YmvxZVuaotpxK5ozj19dX9yN
7fwLR1NFHKuL+TyHlc1oo2g85fJbAW5lJkZf9OoFXbaybdzeCSR/hJICJB5dtG07
cYNr03xRA4DhelZsdYmQqpzWeGmshPM5YIq3aGedNY0DnoZqIMDmzOxASany9Tv4
Qbhp6lK9mpY7q5AbOrmrzFRlswGsFeOJc7gjdlvpA+N85n6t1vBham1F97cjxGiq
jtbd0wPswQQCArN1kJJsRhW6fOdVbbfpvI3apz97AeMixr0xakCC8tZiC6IoaNC4
ckfsc7RbtsYRbISfnz4zumD1IDE9V2vLmczAU9SMAo2L2GvBrMxUUF/GzamWRYas
qWMcKanQ8uV2/dQH/q1pfTwD3+KFM7Au6RUjdXILfG9UBPG6Kl0pEwv2PSSjij7O
NhTXFxQUxQl+hZ7niPpYuEzBOkuMYrgKPDUvLUi+l9ydpYk06calOw6G5UAjHssz
pfwx4r+YjHcSo/A/kuB0ErcNSTK9OIH6vKzV2i0ZAjTupXNDvLqdxx76g+xwmylD
NmP19LDB1SlRXfEnDZlrx/UKoWNMH2NbnOrBxtPvZoIBzeTyy7xWP0VwGZMR+LWf
blbC37C0lAq+NHzi/uGZ
=Pl/J
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
