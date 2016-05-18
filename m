From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] drm/tegra: Fix crash caused by reference count
 imbalance
Date: Wed, 18 May 2016 16:12:14 +0200
Message-ID: <20160518141214.GA26795@ulmo.ba.sec>
References: <1463569889-14632-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0217598868=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463569889-14632-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0217598868==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 12:11:29PM +0100, Jon Hunter wrote:
> Commit d2307dea14a4 ("drm/atomic: use connector references (v3)") added
> reference counting for DRM connectors and this caused a crash when
> exercising system suspend on Tegra114 Dalmore.
>=20
> The Tegra DSI driver implements a Tegra specific function,
> tegra_dsi_connector_duplicate_state(), to duplicate the connector state
> and destroys the state using the generic helper function,
> drm_atomic_helper_connector_destroy_state(). Following commit
> d2307dea14a4 ("drm/atomic: use connector references (v3)") there is
> now an imbalance in the connector reference count because the Tegra
> function to duplicate state does not take a reference when duplicating
> the state information. However, the generic helper function to destroy
> the state information assumes a reference has been taken and during
> system suspend, when the connector state is destroyed, this leads to a
> crash because we attempt to put the reference for an object that has
> already been freed.
>=20
> Fix this by calling __drm_atomic_helper_connector_duplicate_state() from
> tegra_dsi_connector_duplicate_state() to ensure that we take a reference
> on a connector if crtc is set. Note that this will also copy the
> connector state a 2nd time, but this should be harmless.

Initially when I wrote these subclassing helpers the idea was that
drivers would allocate a new structure, call the subclassing helpers and
then duplicate the driver-specific data. Here's what the implementation
would look like the way I imagined it at the time:

	copy =3D kzalloc(sizeof(*state), GFP_KERNEL);
	if (!copy)
		return NULL;

	__drm_atomic_helper_connector_duplicate_state(connector, &copy->base);
	copy->timing =3D state->timing;
	copy->period =3D state->period;
	copy->vrefresh =3D state->vrefresh;
	copy->lanes =3D state->lanes;
	copy->pclk =3D state->pclk;
	copy->bclk =3D state->bclk;
	copy->format =3D state->format;
	copy->mul =3D state->mul;
	copy->div =3D state->div;

	return &copy->base;

Of course that has the slight drawback of having to remember that this
implementation needs to be updated when the state structure is changed.
On the other hand that might not be a bad thing, because some of the
data may end up being non-trivial to copy (reference count, ...).

The above has the advantage of avoiding the extra copy, but at the same
time it's a little verbose. I don't feel very strongly either way, so
the current proposal is fine with me.

> By fixing tegra_dsi_connector_duplicate_state() to take a reference,
> although a crash was no longer seen, it was then observed that after
> each system suspend-resume cycle, the reference would be one greater
> than before the suspend-resume cycle. Following commit d2307dea14a4
> ("drm/atomic: use connector references (v3)"), it was found that we
> also need to put the reference when calling the function
> tegra_dsi_connector_reset() before freeing the state. Fix this by
> updating tegra_dsi_connector_reset() to call the function
> __drm_atomic_helper_connector_destroy_state() in order to put the
> reference for the connector.
>=20
> Finally, add a warning if allocating memory for the state information
> fails in tegra_dsi_connector_reset().

I don't think that's necessary. The allocator will already provide a
strong warning if the allocation fails, so an additional WARN_ON() is
not going to help much, and in the worst case may even add confusion.

> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 44e102799195..a49bb006182d 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -745,13 +745,17 @@ static void tegra_dsi_soft_reset(struct tegra_dsi *=
dsi)
> =20
>  static void tegra_dsi_connector_reset(struct drm_connector *connector)
>  {
> -	struct tegra_dsi_state *state =3D
> -		kzalloc(sizeof(*state), GFP_KERNEL);
> +	struct tegra_dsi_state *state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> =20
> -	if (state) {
> +	if (WARN_ON(!state))
> +		return;
> +
> +	if (connector->state) {
> +		__drm_atomic_helper_connector_destroy_state(connector->state);
>  		kfree(connector->state);
> -		__drm_atomic_helper_connector_reset(connector, &state->base);
>  	}
> +
> +	__drm_atomic_helper_connector_reset(connector, &state->base);
>  }
> =20
>  static struct drm_connector_state *
> @@ -764,6 +768,9 @@ tegra_dsi_connector_duplicate_state(struct drm_connec=
tor *connector)
>  	if (!copy)
>  		return NULL;
> =20
> +	__drm_atomic_helper_connector_duplicate_state(connector,
> +						      &copy->base);
> +
>  	return &copy->base;
>  }
> =20

With the WARN_ON() dropped this looks good to me:

Acked-by: Thierry Reding <treding@nvidia.com>

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXPHg7AAoJEN0jrNd/PrOhTjgP/24elfQTXEsmn5xSQegm8dR6
tdhJ6PkIEVKDm6U8cow7MDughCLker/O5HZX9Aozn8faWyPPZzpBBc1nFqxhOV38
nEs2zTwrgxzkOw+yyvnXs5eUaECIDyH1zgG4ZQ7+f604u0tT+Wt/gdioXG0Acy+N
BUFNGTTRwopfCCUPvr7s2M96VzBOpmOcuBCIPDXYgBIF80UtYYcMSFXvStO8QuBs
C3Kj/90MuqPL2i4ObTRI/osIczSKGg8cf7a77BEHDtVjuOWT7c6Ph7A2d7CszhWy
N7cA6BJxAAz31f3FfhjPNeS6Si9nS1tKKZN10O44AnhYCDB44AySZq+ep0h1USGx
w/OKsOt2DL053fYjVIXAE8IDu7kZ0AWkWYAHWw5BK3nnUkfeEsSxezDU4KP2Kq+D
c/y8zg4I0jNwnNs2b0Z7BB1TAR6Mb4Ot4NaBJvn4F1nhNRksvqNvdn3ReafNWwrS
KF/6v4vpXGJ5/XjhL6po9h7i+21FkVG0OsEA3JIAvqoX1JHwIs+YIs5vxB5jWYkX
K1EaybwzBOHuJRwGVEGQ4s9aHpr6Ui3xPJcYPZMpX1R2jlizAF7WCNREZ+8yMZWj
R0WvE9269h0FEGFZ5/Mpfpup1lfwid6YqsteG0mzSFlCA+18ol2SlufmViczfynK
/vcPShClklcBIqzRobe7
=mWoZ
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

--===============0217598868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0217598868==--
