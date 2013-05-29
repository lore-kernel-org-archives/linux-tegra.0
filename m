From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu/host1x: Remove DRIVER_BUS_PLATFORM from
 driver_features
Date: Wed, 29 May 2013 12:50:40 +0200
Message-ID: <20130529105039.GA30742@manwe>
References: <1369806274-19046-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369806274-19046-1-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2013 at 07:44:34AM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>=20
> DRIVER_BUS_PLATFORM is not a DRM driver feature flag, it must not be set
> in the driver's driver_features field.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  drivers/gpu/host1x/drm/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. I did modify the subject's prefix to "drm/tegra: " for
consistency, though.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRpd1/AAoJEN0jrNd/PrOhB9EQAKmkiN95ZCuHJ/1hwLOmIaJM
MOErR4/jcKtv9WvHZVMAhBX3vul1XM5J/auIoooFuemBolGVB/B8cDm5RvXXxbCU
WOtaM6T82Kf9PazetwljSnSYeINsJfFQIrB6dO/cwZsu3tP9Vc/oGYSEqk8WvG+L
NjDhPl1wYzstlwVa13GK+n/889FAxWuZ2h2C9lVCX4TRcZ2mohqE+fjlT9jdfn+c
JAEI7AiAeVRiw7DU3xFksTqrI+79XqSeMvtqaKMJD6noobJxqCdR5bVH2gFrTKZB
gJ6TZsqmCzW2VfSa18zILNstjunOcICOS3DyCqsbwCIiGhYNaeafWzAHzZxPfkoz
Vf4yxz5doztbVvfJVJkDrHow6k4tPtRgsjQQYGT8NizCTFz3QJBsXpFAHHhlCu95
n8VE9cak87hKhMhPNrWhcL+F5nQPw3mgDRaoq6Vf7et1w+2wmeQvQ4gK/PQZ7dOe
7FKR1Qa2e03zEhdHegELNT+He2+cR29d45NwPTqVGbSwKk4dGWH4rZzl9t2ZKEnJ
YnzLfd8RkGZauYB1tD+CabrKHxHZ0dpWqh1xwRsRiR6aZAy0toXz1byto3/n8gyr
y6JihMmL0i2eUf5aBOCVN/sWskwEaY+C75zQHxPzac2uWyNNlb3fkCf70h8u01HN
eoR37hkFxFJETReBbtth
=eJR3
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
