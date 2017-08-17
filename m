From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] gpu: host1x: Don't fail on NULL bo physical address
Date: Thu, 17 Aug 2017 17:30:51 +0200
Message-ID: <20170817153051.GC30664@ulmo>
References: <20170802095505.27250-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170802095505.27250-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 12:55:04PM +0300, Mikko Perttunen wrote:
> Pinning a Host1x BO currently cannot fail and zero is a valid address
> for a BO when IOMMU is enabled. To avoid false errors remove checks
> for NULL BO physical addresses.
>=20
> Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c | 8 --------
>  1 file changed, 8 deletions(-)

Applied, thanks.

Thierry

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVtqsACgkQ3SOs138+
s6HfAg//edUafSyddEXz8KnudTdVFgXljIYjSjt0bZ1uxdCtA6I8SVzfv2JJpfPZ
Nxy6AGGKRRkybGzsn1OKk9V61cVcmv5hHuMBtEHzxA1kJT+KfvYYjYSKRaNf6vMt
UASnrcHKuLrBRc19jqILYm2hENO77sXyv9M1yrHq5E3NhpDlegg+7L/OzfjOOzJl
26nNr7svM5tpWm+CrOgsiEpuWLrx9fLUcBS5B5SQwHoaE/1Xd/fJsSrkPA+YHjCi
RKh0eLeK4dnIk9P2eXfsbAG1vE8ojAQOikym0wxeK/skxfG0p1tbzmMPe4ad3NNU
A48vxwd8LGAuQqHY3KkmUu3jLFhs+GI5prpGpRRAd0SCmOtiMVef4hg0tKXWstQH
lfE7JyKykIzKqc9l8CJ2y03Jt02h/CdUW7ELnitxZVEkHXqBXUFdjOP1ZpyOh2wz
HgJBiZ01o5XiriRlznCV4bo1qTl4Z+AtaiGWqUWMVqTGrKoyUmPaINf7PnRlpS6G
zjSizs2/xmIiy3P+PvzvUVOn05EEO1HkPXRvUoCaf0XobfVPg3JuG3lkcgl5DDuH
5bkr6klpGDHl40iRse2wlLaZPah3MxVqmNWRAweI4+ZpvUvulD45VKRYGWAFdDNR
TZrNx6n3oMQw9Ujc8mkbaqLrw01AFWWwECjUSsQVTj9AuKiuemQ=
=gqWf
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
