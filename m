From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dma: tegra: register as an OF DMA controller
Date: Fri, 29 Nov 2013 15:17:26 +0100
Message-ID: <20131129141725.GA22771@ulmo.nvidia.com>
References: <1385416416-3536-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azskX66S5GHWoEK7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385416416-3536-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azskX66S5GHWoEK7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 02:53:36PM -0700, Stephen Warren wrote:
[...]
>  	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> +	if (!tdc->slave_id)
> +		tdc->slave_id =3D sconfig->slave_id;
>  	tdc->config_init =3D true;

This could use some blank lines to unclutter it a bit.

>  	return 0;
>  }
> @@ -942,7 +947,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep=
_slave_sg(
>  	ahb_seq |=3D TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
> =20
>  	csr |=3D TEGRA_APBDMA_CSR_ONCE | TEGRA_APBDMA_CSR_FLOW;
> -	csr |=3D tdc->dma_sconfig.slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
> +	csr |=3D tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;

Perhaps I'm missing something, but couldn't we reuse the .slave_id field
of struct dma_slave_config? It seems like it might be overwritten by the
DMA engine core or users when they call dmaengine_slave_config().

But wouldn't it be better to have the core take care of all the slave ID
management, so we don't have to jump through hoops? Or perhaps the
concept isn't general enough to map well to other drivers.

>  /* Tegra20 specific DMA controller information */
> @@ -1245,6 +1262,8 @@ static const struct of_device_id tegra_dma_of_match=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_dma_of_match);
> =20
> +static struct platform_driver tegra_dmac_driver;
> +

This doesn't seem to be used anymore.

>  static int tegra_dma_probe(struct platform_device *pdev)
>  {
>  	struct resource	*res;
> @@ -1383,10 +1402,22 @@ static int tegra_dma_probe(struct platform_device=
 *pdev)
>  		goto err_irq;
>  	}
> =20
> +	tdma->xlate_info.device =3D &tdma->dma_dev;
> +	tdma->xlate_info.post_alloc =3D tegra_dma_of_xlate_post_alloc;
> +	ret =3D of_dma_controller_register(pdev->dev.of_node,
> +					 of_dma_slave_xlate, &tdma->xlate_info);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev,
> +			"Tegra20 APB DMA OF registration failed %d\n", ret);
> +		goto err_unregister_dma_dev;
> +	}

Would it be useful to move this into the core and have it register the
OF parts transparently to the driver? That's of course nothing that
should be done in this patch.

Thierry

--azskX66S5GHWoEK7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKH1AAoJEN0jrNd/PrOhMqYQAKd9zJTPDGDT/8cuzEL6RHxh
ZeGHx+TSWBKUSLyz3uqvf+y6mV9+dw9utn7R1tyPT1Mu+tOFJtpq00gelCO1FgEJ
euuF4SUhr+UdyIZgKWuSo0C3KpVB3UjRCfRVxawG3f6SbMi3cBl+h+2zQ2O+8Pb/
cn3fhM131Mv3GzjnAULlW+QbSqUbKXNk517o7U0tmBk/gK2rNOUbHgMbVBShMoPY
5pRQvxbTXlfZe2JDV2kxC15KUcJrwiFOZGwCFfN1URrY+2eKPfPP2BFhqkiVTZan
ynuAi5KrltDUoEQbleXCUfkpH733h2YOYKisQYjpuz3nGUjViRYezPlCtFN4uDhF
MCjLga6n/F1kx48lLsPcw2BqjVWLlGCE0HozrgXYeYbAu9qHFJNMkgnUsjiKdck2
D5SYxLUp7pep8pA/txh34R8KD6/xM8ZWV3AtLCCgAULGPv9fvnSBZgs+tABDSn7N
OTVo7PYiBrlgRmoOqGr1JCnc1mS92YziRZ9rfqh/3LP/dNHcLk6y5CJ++VPhMRL7
3kDPNhHnAOMQUf7DAxyLG2rIv2P+GrH2X/azJfBR5jpWJzgDddWHN2NdNxuMuI2f
KBn82rPz1ww4N+rsvimV3Ux/e63iLbpH2sfh7K9oGmpnGakBWy/h+f4D9OMRISqK
ePHmrfhCCQJqbClUujr8
=NNFh
-----END PGP SIGNATURE-----

--azskX66S5GHWoEK7--
