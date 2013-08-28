From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] PCI: tegra: replace devm_request_and_ioremap by
 devm_ioremap_resource
Date: Wed, 28 Aug 2013 08:38:43 +0200
Message-ID: <20130828063842.GC5141@ulmo>
References: <1377629554-17490-1-git-send-email-swarren@wwwdotorg.org>
 <1377629554-17490-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377629554-17490-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 12:52:33PM -0600, Stephen Warren wrote:
> From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
>=20
> Use devm_ioremap_resource instead of devm_request_and_ioremap.
>=20
> This was done using the semantic patch
> scripts/coccinelle/api/devm_ioremap_resource.cocci
>=20
> Error-handling code was manually removed from the associated calls to
> platform_get_resource.
>=20
> Adjust the comment at the third platform_get_resource_byname to make clear
> why ioremap is not done at this point.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)

I bounced that patch to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org a few days ago but haven't
received a response yet. In case it already got applied someone will
probably notice, so no harm done.

Thierry

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHZryAAoJEN0jrNd/PrOheuYP/j+BZioJHnZ2jZptwwcvesUu
Hd/BBPymgs4G23nA00olI0eJxCh/PNsCapubw0szq3Wr2HzS6lyrp2qm/ZmjHNDG
p0kAN9TeEN2YpA7GogDTMFGv95xcnpmfUAA3/izK0k0vaazrOp5XQJ3wOSnNK6z0
bgGMAAecfwFUrviMxO5yp1lSn3TzhSBn76Z9ZadjUEsabadQ8oCqBl7o5XU4kJ+i
8xiRyrWs2yyBxavV8OTvRFsrUrYKTieuXuWMVR2bdi8FKN4pjg/2Vvg1IEcg++gh
2NOdENFZNblHy/EA6KA1kpqGNJfecjoXNBU4rzEepi1eDvEieqwS58ICm+nQVhyV
WqWJtra7ekqT3NXHZRd+7rDp2uaG9rMdobTjV3JiLBwlTSt1E0lBIA0RFUAj8Jtk
MTExqxC09Pj4NDdccIjwFU9245vmCUK0sUX3GxMnC9RTZEuUpKcm0CltWtojr6nZ
L4B1TR/vU4pB2Azc/XIC8aRo/0mN4xNJbBu/Z4n1m4dVGxCp0zMz0GZMqPlTNm0E
N+gND/jNmi9wwrD56vran7yoiZ98FVprnagIutNuAm1GxYQTFlkosE79VG8kRpNr
2L4pCIqXS7GPSON1yMASHBnSXD6+cAVZQF52qkQ4g+KOOP51B00ayJTDDAGIUrlN
gQqzeAKirKWVZJ4Gu0HZ
=m6mn
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
