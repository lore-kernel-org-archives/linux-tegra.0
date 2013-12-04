From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/31] ASoC: tegra: allocate AHUB FIFO during probe() not
 startup()
Date: Wed, 4 Dec 2013 10:00:13 +0100
Message-ID: <20131204090012.GJ19943@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-19-git-send-email-swarren@wwwdotorg.org>
 <20131129144025.GA9712@ulmo.nvidia.com>
 <529E374B.8090903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BEa57a89OpeoUzGD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E374B.8090903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BEa57a89OpeoUzGD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 12:55:55PM -0700, Stephen Warren wrote:
> On 11/29/2013 07:40 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:54:13PM -0700, Stephen Warren wrote:
> >> Teh Tegra30 I2S driver currently allocates DMA FIFOs from the
> >> AHUB only when an audio stream starts playback. This is
> >> theoretically nice for resource sharing, but makes no practical
> >> difference for any configuration the drivers currently support.
> >> However, this deferral prevents conversion to the standard DMA DT
> >> bindings, since conversion requires knowledge of the specific DMA
> >> channel to be allocated, which in turn depends on which specific
> >> FIFO was allocated.
> >>=20
> >> For this reason, move the FIFO allocate into probe() to allow
> >> later
> ...
> >> +	i2s->playback_dma_data.addr_width =3D
> >> DMA_SLAVE_BUSWIDTH_4_BYTES; +	i2s->playback_dma_data.maxburst =3D
> >> 4; +	ret =3D
> >> tegra30_ahub_allocate_tx_fifo(&i2s->playback_fifo_cif, +
> >> &i2s->playback_dma_data.addr, +
> >> &i2s->playback_dma_data.slave_id); +	if (ret) { +
> >> dev_err(&pdev->dev, "Could not alloc TX FIFO: %d\n", ret); +
> >> goto err_suspend; +	} +	ret =3D
> >> tegra30_ahub_set_rx_cif_source(i2s->playback_i2s_cif, +
> >> i2s->playback_fifo_cif); +	if (ret) { +		dev_err(&pdev->dev,
> >> "Could not route TX FIFO: %d\n", ret); +		goto err_free_tx_fifo;=20
> >> +	} + +	i2s->capture_dma_data.addr_width =3D
> >> DMA_SLAVE_BUSWIDTH_4_BYTES; +	i2s->capture_dma_data.maxburst =3D
> >> 4; +	ret =3D tegra30_ahub_allocate_rx_fifo(&i2s->capture_fifo_cif,=20
> >> +					    &i2s->capture_dma_data.addr, +
> >> &i2s->capture_dma_data.slave_id); +	if (ret) { +
> >> dev_err(&pdev->dev, "Could not alloc RX FIFO: %d\n", ret); +
> >> goto err_unroute_tx_fifo; +	} +	ret =3D
> >> tegra30_ahub_set_rx_cif_source(i2s->capture_fifo_cif, +
> >> i2s->capture_i2s_cif); +	if (ret) { +		dev_err(&pdev->dev, "Could
> >> not route TX FIFO: %d\n", ret); +		goto err_free_rx_fifo; +	} +
> >=20
> > It could be useful to have these in a separate function so as not
> > to make the .probe() any larger. It's already pretty big as it is.
>=20
> May I ignore this; I personally prefer larger linear functions; it's
> much easier to follow the code-flow without having to jump back/forth
> between a bunch of single-use functions.

Alright, I won't lose any sleep over it.

Thierry

--BEa57a89OpeoUzGD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnu8cAAoJEN0jrNd/PrOhgk0P/0rmmF8G0gdjOpxUo6zOpoDf
McI/jVvZbqR74XfAK6VdrJViDvFWhtTolBt3fK8UlFOWVjbPWKS9J5DBzevH1gnL
tqec1+d2c4LqaykuvgRnzj83FDOcjAfc3LjT246cwV5ge0egNI630JPWCX2xZ6q+
4f2N5lnTmJdrCbvb88rBzlAyFxrSh6mHxZyNm0fMZpcY1yWgycc5rAt4qkEAurPC
M9IPDQGq328Snsb+AjwnVFdcmM4KotM5kAvdDb15FKd9TD8Yw2/mHm8WL3dWybaD
qZAPkd+Tc8Yw4zyymsEludEBt1qkGP8xC4BqluXC6XiThzLNAsuBxrzRVp2Th69p
ImT2f8PQnmqubugkhlw/4Mg+0ddwANWZqBVhKPUO0C+pvXhfEszJGnixD+6FCHWJ
SV3uUfX0kUqNigOfiHI7hK8ZbOsjcFvcGy8VtpfZ2tfgvXxAOc3PlreW5146RMEQ
grFMLrLMrbFeAMT21XnQXe7oYNNX70w1J3PpgmY4zvhfaKzAuHcAR4io7xBgK1u0
SW7Wvt7xTCN2U7nM4tl4EnH90n2ePsdnhMg4J1v2s/aqnnhPH7vYmIn6BaSMspD2
5dY2TYB3Itdyu59HJIiDpoVuvNF1oTTpCtENqyXykFC36WluBtM9GTKClP+JwPvY
NguCAok8QsXBns4oSBIP
=Bkyi
-----END PGP SIGNATURE-----

--BEa57a89OpeoUzGD--
