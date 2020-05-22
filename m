From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: hub: Do not enable orphaned window group
Date: Fri, 22 May 2020 14:59:13 +0200
Message-ID: <20200522125913.GK2163848@ulmo>
References: <20200519090301.32689-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M9kwpIYUMbI/2cCx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200519090301.32689-1-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--M9kwpIYUMbI/2cCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 02:03:01AM -0700, Nicolin Chen wrote:
> Though the unconditional enable/disable code is not a final solution,
> we don't want to run into a NULL pointer situation when window group
> doesn't link to its DC parent if the DC is disabled in Device Tree.
>=20
> So this patch simply adds a check to make sure that window group has
> a valid parent before running into tegra_windowgroup_enable/disable.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/hub.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--M9kwpIYUMbI/2cCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7HzKEACgkQ3SOs138+
s6H7NxAAlocR8/osRzgQ4vml66I6m+TJuF9k2Ow7YvMDRZYSDXW/Vsl2rqwUZrwZ
A6wx5r9OxEq/eXjSpNHvF2nOqPRetvKHqJKBFFXOixDdD0UtIvlAKdIEZ8Ch3Gx0
fu+OHajYhSQwEUxgNToQy5lqRJz4nZKTmXJgirAHD1BBqxjc3FqZaXBnwkE2bmMx
rwJGkoylRBaw3TSxzSHx+CalaDf2yxfLHwcXa9/zcfFKJ8oEOBgREnL5PxbZhH5J
LOhqHzDR7TpQgGJjA3XAHYwt+nS04lfbQpiy+gYWwVQ+n5S0I5nThGUEXbNSKivR
REjA95NXLQLBziROaxWuUlH8iWggdfhnAP8PfM5pG/TR26/r3f//4VDaR3RZoqzA
dkaPwAg14VPir9OOOOkFxYp9hBw9fh91FbzwSMguAbG9bE4Dt9ENCH6+2EVYi3qo
14NESubshj9GpokX6gjs2Ksz6GDzvXsCygYC+gcmTRSYZq30D5LFgvWqLtElw2/P
j8w0Wq/yg9KSCf5/4YMGynGeZ6NLWbch+jolHGeothCJ1DbZqiZYbqO+UECEJtCh
+m0PRjJMLvCRsjGwyG8vGY9QoOtsoUT8nCKSy1bRaNcK+OGwOUpzAp0bZUyJKkgs
5ci/nJu96j3qB+W/5fKnjT9JMMiUxInzQyU91aeurJWtPIAH+Oo=
=G02C
-----END PGP SIGNATURE-----

--M9kwpIYUMbI/2cCx--
