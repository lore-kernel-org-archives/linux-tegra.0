From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: dts: tegra210: Add L2 cache topology
Date: Thu, 28 Mar 2019 17:10:46 +0100
Message-ID: <20190328161046.GD5518@ulmo>
References: <20190201034347.18470-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6985600594115736702=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201034347.18470-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============6985600594115736702==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 11:43:47AM +0800, Joseph Lo wrote:
> Add L2 cache topology.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> Notice that,
> This patch depends on the series of CPU idle support[1].
> And that one depneds on [2].
> [1]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D89446
> [2]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D84380
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to for-5.2/arm64/dt, thanks.

Thierry

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyc8gYACgkQ3SOs138+
s6EPjg//f+abMf/KNaL/rgI949ONUF0l/BXzumxXM69whY3HHRWwerHZguJxzSaR
A8MGuH3XQowQLZZaaHfY4VWDzPKP17rnJCqAp8SxXvgLisv0buYkL6PiZ9FsEhLj
4TuvJmU4aNI1M0CXXOnl3ohPnFM2bVpucjo9LzskwY4i1+bLil+oYyeoYSmeHQYD
IgqcwoYICjGBuVS56/hjtXN+9akAM3cQK+JVxWgXwesQWfGR7eiCIk6pUgWWSYB9
jex0WK3XsLIdrllUvHdW9bCkejZdJh9AYFWZfNXlz/j+VnGyPdJUy1VgZQfB1txO
3FhWUw3bC3MpGWV8ERQ+Kt6nZMoD6CUaqTdbtyUBly0Y2zIWWg9wO65rYYs2521c
cZqrTFkGqbmw8sIwTWVus5YSfbi3wnVE+EzHoU7F4FWePmqi6eOa8H36iMBz8E+u
D8SthCDcSPzISDYl2U9NFuIzTB84GdzJm6Kf2fPIzXTqGJdhJKNo86moC584MB9F
VtcnG4zEC/m75zhNbU+3A49FR5UjXcUZO23e7L2LgG1eYl86F7764F19CWR6xo9i
P5/cYtDCJqWRrIvy/a8plxEfOeFg4pfxxbvvX4H3jVUCKcQLb+cqn75yMU+Fcgyq
ru4Qg12rQkS7BIaGKmPR8j5HYIefQKC26xhdYLEsKWfIijXa5G4=
=YKd9
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--


--===============6985600594115736702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6985600594115736702==--
