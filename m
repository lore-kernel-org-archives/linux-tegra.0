From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/31] ASoC: tegra: allocate AHUB FIFO during probe() not
 startup()
Date: Fri, 29 Nov 2013 15:40:27 +0100
Message-ID: <20131129144025.GA9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-19-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-19-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:13PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Teh Tegra30 I2S driver currently allocates DMA FIFOs from the AHUB only

s/Teh/The/

> when an audio stream starts playback. This is theoretically nice for
> resource sharing, but makes no practical difference for any configuration
> the drivers currently support. However, this deferral prevents conversion
> to the standard DMA DT bindings, since conversion requires knowledge of
> the specific DMA channel to be allocated, which in turn depends on which
> specific FIFO was allocated.
>=20
> For this reason, move the FIFO allocate into probe() to allow later

s/allocate/allocation/?

[...]
> +	i2s->playback_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	i2s->playback_dma_data.maxburst =3D 4;
> +	ret =3D tegra30_ahub_allocate_tx_fifo(&i2s->playback_fifo_cif,
> +					    &i2s->playback_dma_data.addr,
> +					    &i2s->playback_dma_data.slave_id);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not alloc TX FIFO: %d\n", ret);
> +		goto err_suspend;
> +	}
> +	ret =3D tegra30_ahub_set_rx_cif_source(i2s->playback_i2s_cif,
> +					     i2s->playback_fifo_cif);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not route TX FIFO: %d\n", ret);
> +		goto err_free_tx_fifo;
> +	}
> +
> +	i2s->capture_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	i2s->capture_dma_data.maxburst =3D 4;
> +	ret =3D tegra30_ahub_allocate_rx_fifo(&i2s->capture_fifo_cif,
> +					    &i2s->capture_dma_data.addr,
> +					    &i2s->capture_dma_data.slave_id);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not alloc RX FIFO: %d\n", ret);
> +		goto err_unroute_tx_fifo;
> +	}
> +	ret =3D tegra30_ahub_set_rx_cif_source(i2s->capture_fifo_cif,
> +					     i2s->capture_i2s_cif);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not route TX FIFO: %d\n", ret);
> +		goto err_free_rx_fifo;
> +	}
> +

It could be useful to have these in a separate function so as not to
make the .probe() any larger. It's already pretty big as it is.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKdZAAoJEN0jrNd/PrOhENUP/iGKSGTY1gGiV0/ljyTANg9m
AaR12bP1FbvAfPu4xn6UYzeFRzVNqSivlJ6St/mE1z+Hmf6nGPNS1cysermVarci
X3cMWB4S1KyMHu+G3Odf21Zi1aun5QofO6A0qlqUUNdHQaLmVXnfJ/DNVvNYd7QX
rErDhiZGQA0IjKcTs6EJ+V311Dhfyu/vTvEiuGY3E0VVzQviEJ+qbSSL23HFrkCG
qdAKomHWWog2+ujprb7Ds92WMcyyq37q0iMsR8PXxO9zf++VNOiAIXZtk15qKvDL
WUoSMRZBwoB/vc1xz2jH4YrxHgCmsEKAutQg9nr7N4XkOhUdi5EG64GeaHRTlKv1
H0n5rDb5N/XD/XJeV3IhRLHMOQPBiTJ9yZrbcGQRqkYVuoZs7Tt2K5hyBhQmI6ra
AlWSNStTJRU77V21XjTKzfIIoNuPumMg879e+8VkhGOMTStzmDOSkviHhuVsHOFy
icaqujxrtx1Lqagk6c3uMlz3xgvTsWBP8ZaJqy7lpeeqiKfhWFAb7H2dJtrQi7R4
2XYQpIBbfCw6lZVCt2489q7MRPhMamjHktY33HvSu20IAItQXfYalyMPoArAGHyF
ISg5qD7GxE3UeF052EWyYXEDrGonnFNCu7laBigksAwKoiNy+qINW7hoAyh9wDYo
lkThyoHIgF+Hy+vu/7dU
=1cks
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
