From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: check HDMI sink capability
Date: Tue, 18 Dec 2012 07:50:56 +0100
Message-ID: <20121218065056.GA4909@avionic-0098.adnet.avionic-design.de>
References: <1355767163-5423-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1355767163-5423-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2012 at 06:59:23PM +0100, Lucas Stach wrote:
> Check if sink is HDMI capable when enabling an output. This disables
> HDMI audio/infoframes if we are talking to a plain DVI sink. All things
> except this check are already in place.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 3 +++
>  1 Datei ge=C3=A4ndert, 3 Zeilen hinzugef=C3=BCgt(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index ab40164..32ea7d4 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -673,6 +673,9 @@ static int tegra_output_hdmi_enable(struct tegra_outp=
ut *output)
>  	usleep_range(1000, 2000);
>  	tegra_periph_reset_deassert(hdmi->clk);
> =20
> +	/* if the connected sink is not HDMI capable fall back to plain DVI */
> +	hdmi->dvi =3D !drm_detect_hdmi_monitor((struct edid *)output->edid);

Shouldn't we update drm_detect_hdmi_monitor() to take a const struct
edid * instead so that this cast isn't required?

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ0BJQAAoJEN0jrNd/PrOh+REP/05jbXEpRj9UXMxgsuxmGOSN
VoBMsmJd4BPVRRALMruCpSBSCTVQBrZUUqRY/YSP670x/4xPBXR8BJ8oX58oaxzE
b9K3hq1vsj9947/jeoug+8q1Ib+pgjtp4bEpg1NrR0sEZ/YxJBqYgGPFN9+oRTh4
gGw2XPzG0Mm+x5TYnsGvVZ9+QMdIftHGYCa8NBD7KiIgKjir/sIVKGWwcTHZoemP
gCTVOitGtcwQefdAqZD/hSgrSA+u+T40bo34HStqYp/5RAHxF64dVVJimdW0GuMv
rv+E+86aWZ1sohc4M8rGay5d3AXMnRnx+WN2Ab3vOL84gxJudR0OypuOpVrfFGkO
gZ0C8/FQZvIdQrzJCwygYCPTb9YXdH8HneMpeWcIeMiD5oVvgxd2vg6mHiAJzrMG
uIHZFnTcZJ9rZDlaWPkcv2lkPwBk5kI7iwlAtMH7giOFq/OFsCct0hhmDILRI2KR
0eNAbu83OvCXqta5Bef9zXz65sY843Yd4JvW2eVhK2Q4FIvdhGTrgqqNEtjzO43l
fjEK05P7KU4oIeDScgqzZwW8+JsQNEqdXfflbCGHjdmkc2blPSRctsWZx9YnUn35
Jk2aDNpwF7iPq3nw/PXouOaqB9YPvsRYegZgI42NAdKjSJYSXjXqe0te+3nhF3FU
jMoSZ2amsa5muFS7GKs4
=CYqk
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
