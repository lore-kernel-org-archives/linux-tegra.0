From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it
 wasn't specified
Date: Tue, 16 Jul 2019 10:42:25 +0200
Message-ID: <20190716084225.6wf5lsdzukyb6cz5@flea>
References: <20190711021313.29445-1-digetx@gmail.com>
 <20190712195429.dlz5ofwoafciedcq@flea>
 <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="octe5474vzs7zgnm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--octe5474vzs7zgnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2019 at 09:57:32PM +0300, Dmitry Osipenko wrote:
> 12.07.2019 22:54, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Jul 11, 2019 at 05:13:13AM +0300, Dmitry Osipenko wrote:
> >> The rotation mode from cmdline shouldn't be taken into account if it
> >> wasn't specified in the cmdline. This fixes ignored default display
> >> orientation when display mode is given using cmdline without the
> >> rotation being specified.
> >>
> >> Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflect=
ion on the commandline")
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >
> > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Thanks!
> > Maxime
>
> Thank you. Please note that I'm not a DRM maintainer, hence either you
> should pick up and apply the patch by yourself or somebody else who has
> the commit rights will have do that. I guess Thierry could also pick up
> the patch into the Tegra's tree, but this patch is more DRM-generic.

Right, I've applied it now

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--octe5474vzs7zgnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXS2N8QAKCRDj7w1vZxhR
xZU/APwMSaCF6bmFUXlM1KJUOeNWQxXyRsoece/0gjVsiShCfAD+INMwbkotiFNg
3y6stSLHSrLJF4aCkziA0WYN6xwACQ4=
=/jaE
-----END PGP SIGNATURE-----

--octe5474vzs7zgnm--
