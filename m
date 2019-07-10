From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Wed, 10 Jul 2019 16:05:04 +0200
Message-ID: <20190710140504.t5lsk36gnn5cdn6b@flea>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bariuncpprpjv42x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--bariuncpprpjv42x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2019 at 04:29:19PM +0300, Dmitry Osipenko wrote:
> This works:
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 56d36779d213..e5a2f9c8f404 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -182,6 +182,8 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
>         mode = drm_mode_create_from_cmdline_mode(connector->dev, cmdline_mode);
>         if (mode)
>                 list_add(&mode->head, &connector->modes);
> +       else
> +               cmdline_mode->specified = false;

Hmmm, it's not clear to me why that wouldn't be the case.

If we come back to the beginning of that function, we retrieve the
cmdline_mode buffer from the connector pointer, that will probably
have been parsed a first time using drm_mode_create_from_cmdline_mode
in drm_helper_probe_add_cmdline_mode.

Now, I'm guessing that the issue is that in
drm_mode_parse_command_line_for_connector, if we have a named mode, we
just copy the mode over and set mode->specified.

And we then move over to do other checks, and that's probably what
fails and returns, but our drm_cmdline_mode will have been modified.

I'm not entirely sure how to deal with that though.

I guess we could allocate a drm_cmdline_mode structure on the stack,
fill that, and if successful copy over its content to the one in
drm_connector. That would allow us to only change the content on
success, which is what I would expect from such a function?

How does that sound?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bariuncpprpjv42x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSXwjwAKCRDj7w1vZxhR
xbW+AP9G0wdD7eMxSNjs35WcStnrObO54j7WGEY71hdPnh7yDgD+Ky5utQLhxr2w
LBn3jxYg3tyjfdWY04f+p6Cj0pBLhQI=
=wZot
-----END PGP SIGNATURE-----

--bariuncpprpjv42x--
