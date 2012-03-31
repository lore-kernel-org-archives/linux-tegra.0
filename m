From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 15/17] ASoC: tegra: add tegra30-i2s driver
Date: Sat, 31 Mar 2012 22:34:02 +0100
Message-ID: <20120331213401.GP5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-16-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aMDdG8xNveJz2ruI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148852-17806-16-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--aMDdG8xNveJz2ruI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 30, 2012 at 05:07:30PM -0600, Stephen Warren wrote:

> +#ifdef CONFIG_DEBUG_FS
> +static int tegra30_i2s_show(struct seq_file *s, void *unused)
> +{

Abstraction please - this is open coded in several of your drivers.

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = tegra30_ahub_allocate_tx_fifo(&i2s->txcif,
> +					&i2s->playback_dma_data.addr,
> +					&i2s->playback_dma_data.req_sel);
> +		i2s->playback_dma_data.wrap = 4;
> +		i2s->playback_dma_data.width = 32;
> +		tegra30_ahub_set_rx_cif_source(
> +				TEGRA30_AHUB_RXCIF_I2S0_RX0 + i2s->cif_id,
> +				i2s->txcif);

So.  This is all fairly straightforward, simple and non-invasive for
CPU<->I2S streams but obviously it's locking out any loopbacks within
the AHUB which is a bit sad.

Looking at this it seems like all that's required is to propagate stream
events back up the chain and do the routing, there doesn't seem to be
much other interaction between the AHUB and the interfaces?

--aMDdG8xNveJz2ruI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd3fgAAoJEBus8iNuMP3dI3gP/jE4ciS2Zuv509vMsE5dBU0N
pf6S8pngidMWe8F6snK1lYkHcGTmmdg9TmFoS71lon2MVMA157047+xkEqbx+x32
Wm6iCcm0nB+KnRLar9Da9UnbwsOJ9VWOlXkr0rfiEkg8RnSSs9tAheQ8iQ9cwV6M
d+RVqhNhPGi7t8YZTYKKQzLnqNfHdRx3cNjarbvBh+Scvi3VlYULmvNheQhAEDVF
Cp0ms6uUUH9AM+LRmvtF5uJzC8Y5/LgypL0E/F8zXgd+fkQK7cs6Q3Bau6Z0i1Yg
pdPxpFyhJBxSNWSFHVMR0DxvcCgeHNeqQFZfJBRVjegj3kz/xJUD42D5y+p/vtC2
DqaWktu7sVpjKkb/JVplcirdKEgZ6qM6f76RS5Czk9GS8eUms0EwbZWgImiECl5H
8jE5zjyfylDUhMhYkcX9fJPSzxJcAyegz0fwCwUe4+CvFB6yjpTy2KaeWJgfMraF
G/sRKSLRY59dFulzExAUjIdDSjdm2NoyNnMHzfyKmoC7o4qMGeF/1yP++YX2Vesu
lchQCGn516b3wdN6SyKbBrpndnbUBT2xXNWLgMJ62AMNSXwB60DGnmyVKNBPFiKs
isdLWQgrdchdssaVheFOWx6T+FD/+n8QuriPMpwjN16sddtvvqU0W6IrbIpVoetT
JSU8BaDBenDHlXcnOhKH
=yxCA
-----END PGP SIGNATURE-----

--aMDdG8xNveJz2ruI--
