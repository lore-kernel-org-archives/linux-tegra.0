From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] host1x: hdmi: Make sure clock is enabled before dumping
 registers
Date: Tue, 27 Aug 2013 10:04:48 +0200
Message-ID: <20130827080447.GH8686@ulmo>
References: <1375173303-4275-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1375173303-4275-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2013 at 11:35:03AM +0300, Mikko Perttunen wrote:
> The debugfs register dumping function did not enable the HDMI clock.
> This led to a possible system hang when reading the debugfs entry
> while no HDMI cable was connected to the system. This patch makes
> sure that the clock is enabled during the read.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/drm/hdmi.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thierry

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHF2fAAoJEN0jrNd/PrOhjD0P/25n4NrF/zsYVKXY7oDEeM0k
D24bAqBHLySDysys0DEqhA6XQZV3JoBkGK++QjEAoRAE/A6a5dzTbwQbELhlO8+z
iuLuYx7aBuJh7lT1ghvoctgP2p8lJvD1FhrVS/ucTYJyNhnNebp2gXW45PqUOG61
YleJ1kfYBKI6lEZgZ6JP5AWdVxD8ETrqs9zoSjY+1KK93Q70y87JSzMqR0/ounJO
JXYdXepWa8yIC7ywwaTykcFvpgXPEjocn06i7BJr4MS5axYhJvcfKIWxRVBXwYA5
Z14RmGOuVlmvlkUsc3F+9udjgKzzm6XG38QtXY1QsIcwYWQQqfT7uPpcP1P4mu81
8xtrw58ZPDzJhbk3v8310MYg81q2f7HtZ9jnZPQIn7eTa7646xmhHtdC9ZD+IUjx
QYAY+X9X4FtGDqMRZnonK3FcI+ao0xI9rdwnMbUNDpWf2trOxiDAeDYaLa1EkJ+1
5J/B61FRVi4N3fB/IEntLcMVBSAPiIrXQUDpTANgOLDm1KYr5FDTLM711wmUeHMd
2toNbMdvEuisNkHoDfXyAm5Tsq7Yg9dahPHTluUQAvZqDS44fef/lPn7zFJtqAuG
ikcn8l6OrFwpv/Qm5ptmVNs5ZCpqrn08VYj/J2mlzcIm7PTd1zakJpPcJmOvn9s7
0QvKcvOxlbphSUCGUev2
=8APv
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--
