From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 15:35:51 +0200
Message-ID: <20160422133551.GP9047@ulmo.ba.sec>
References: <1461329093-20300-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kynn+LdAwU9N+JqL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461329093-20300-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Kynn+LdAwU9N+JqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 06:14:53PM +0530, Shardar Shariff Md wrote:
> Initialize default channel slave_id(req_sel) to invalid id
> (i.e max supported slave id + 1) to avoid overwriting of slave_id
> during tegra_dma_slave_config() with client data if slave_id
> is not initialized through DT
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ---
> - Instead of initializing the slave id to -1 define macros for
>   max slave id and invalid slave id and do the checks accordingly.
> ---
>  drivers/dma/tegra20-apb-dma.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3871f29..2957e26 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -114,6 +114,9 @@
>  /* Channel base address offset from APBDMA base address */
>  #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
> =20
> +#define TEGRA_APBDMA_SLAVE_ID_MAX		31
> +#define TEGRA_APBDMA_SLAVE_ID_INVALID		(TEGRA_APBDMA_SLAVE_ID_MAX + 1)
> +
>  struct tegra_dma;
> =20
>  /*
> @@ -353,7 +356,7 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
>  	}
> =20
>  	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> -	if (!tdc->slave_id)
> +	if (tdc->slave_id =3D=3D TEGRA_APBDMA_SLAVE_ID_INVALID)
>  		tdc->slave_id =3D sconfig->slave_id;
>  	tdc->config_init =3D true;
>  	return 0;
> @@ -1236,7 +1239,7 @@ static void tegra_dma_free_chan_resources(struct dm=
a_chan *dc)
>  	}
>  	pm_runtime_put(tdma->dev);
> =20
> -	tdc->slave_id =3D 0;
> +	tdc->slave_id =3D TEGRA_APBDMA_SLAVE_ID_INVALID;
>  }
> =20
>  static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_s=
pec,
> @@ -1253,6 +1256,11 @@ static struct dma_chan *tegra_dma_of_xlate(struct =
of_phandle_args *dma_spec,
>  	tdc =3D to_tegra_dma_chan(chan);
>  	tdc->slave_id =3D dma_spec->args[0];
> =20
> +	if (tdc->slave_id > TEGRA_APBDMA_SLAVE_ID_MAX) {
> +		dev_err(tdc2dev(tdc), "Invalid slave id\n");
> +		return NULL;
> +	}

Should this check happen before the channel is requested? As it is,
you're setting up the private data of the channel with a slave_id and
error out after that. As I understand the channel would already have
its ID set to the invalid ID, but without going too deep into the DMA
engine core code it looks as though once requested, the channel needs
to be released again (which the invalid ID handling code here doesn't).

Thierry

--Kynn+LdAwU9N+JqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGii3AAoJEN0jrNd/PrOhzksP/1vJLswcIWmSD3M1u/H4Qc9B
MP3YwqrU4TiPuQdyI1Pf2shZzD3vKLJePATWNIJUglAPQZ4NWRTV1XwRi+Cpm3ON
T+kvXgqN6IfJF53f128eanqORF4k1Q+IE/4BCVEsKPmYqKvg42xR0Dw+JI9ZWtgq
ZtrxG4GvP480WDMB4qThCbZymm+9nAn2utqO1ppbmcRoNrpRd5xo3GWNG7DsWeuu
UZ5StvzbcB+YB60XiLsStWI8Xq/ihoo1yJ1TTjW7noZO5qubTlWig/e7NoE775gn
+kHOtiokLKqeMmOZc1QubmYR6ftGVLXoEpAUttfh+tDJN2J2rqf48eUwjfvtk1wJ
qmcZr9pC2D7wrVof6C/XoO09Zng3k1K8ngGypIoONPUuEcGYpLOEvDEoEo8vyhsy
UNc7nN3E30wcUtoYhSFzQAW2eGETiadFoUn4F01Dc6oMsAHwlPZmif7339DgxFbo
85iTjSv7JjTvqCXsqQtd0+SFWJ7tQyywudBAn2yn124lUhKJibdE43KzYXIeDTJO
wJ91SS3Z/cHcByLzeWsunrciCVFf4PAqV1zqQfbIT8eXsJvMGRVeq+X/tCx/8Dq+
3HUxDAUURWu3qAsUmJjE8UheDTnhmCoXUr5+12q4/oB7Mc9pe5TFNzC2Sz5M4wJ2
/6tLV5cXD5qSO/N1ITD/
=OySa
-----END PGP SIGNATURE-----

--Kynn+LdAwU9N+JqL--
