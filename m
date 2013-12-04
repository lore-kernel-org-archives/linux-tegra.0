From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dma: tegra: register as an OF DMA controller
Date: Wed, 4 Dec 2013 09:29:34 +0100
Message-ID: <20131204082929.GC19943@ulmo.nvidia.com>
References: <1385416416-3536-1-git-send-email-swarren@wwwdotorg.org>
 <20131129141725.GA22771@ulmo.nvidia.com>
 <529E1C1A.5000709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E1C1A.5000709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 10:59:54AM -0700, Stephen Warren wrote:
> On 11/29/2013 07:17 AM, Thierry Reding wrote:
> > On Mon, Nov 25, 2013 at 02:53:36PM -0700, Stephen Warren wrote:=20
> > [...]
> >> memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig)); +	if
> >> (!tdc->slave_id) +		tdc->slave_id =3D sconfig->slave_id;=20
> >> tdc->config_init =3D true;
> >=20
> > This could use some blank lines to unclutter it a bit.
>=20
> To be honest, I feel the opposite; random blank lines sprinkled in the
> middle of related code make the code structure harder to follow.

I don't think they are random at all, but we can probably go on arguing
about that for a long time. So if you prefer to keep it cluttered, feel
free to do so. =3DP

> >> @@ -942,7 +947,7 @@ static struct dma_async_tx_descriptor
> >> *tegra_dma_prep_slave_sg( ahb_seq |=3D
> >> TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
> >>=20
> >> csr |=3D TEGRA_APBDMA_CSR_ONCE | TEGRA_APBDMA_CSR_FLOW; -	csr |=3D
> >> tdc->dma_sconfig.slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT; +
> >> csr |=3D tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
> >=20
> > Perhaps I'm missing something, but couldn't we reuse the .slave_id
> > field of struct dma_slave_config? It seems like it might be
> > overwritten by the DMA engine core or users when they call
> > dmaengine_slave_config().
>=20
> The slave ID seems channel-specific to me, and hence should be managed
> at the channel level. struct dma_slave_config is the client-specified
> runtime properties. As you mention, I also worry about client drivers
> trampling over the dma_slave_config data, so storing it where they
> can't doesn't seem like a good idea.

I think you meant "does seem like a good idea"? The reason why this had
me puzzled is probably that I haven't seen this pattern in subsystems
I'm more familiar with. Like you said, it seems like a channel-specific
property, so clients should have no business modifying it.

But I assume there were valid reasons for doing things this way, so I
withdraw my objections.

> >> static int tegra_dma_probe(struct platform_device *pdev) { struct
> >> resource	*res; @@ -1383,10 +1402,22 @@ static int
> >> tegra_dma_probe(struct platform_device *pdev) goto err_irq; }
> >>=20
> >> +	tdma->xlate_info.device =3D &tdma->dma_dev; +
> >> tdma->xlate_info.post_alloc =3D tegra_dma_of_xlate_post_alloc; +
> >> ret =3D of_dma_controller_register(pdev->dev.of_node, +
> >> of_dma_slave_xlate, &tdma->xlate_info); +	if (ret < 0) { +
> >> dev_err(&pdev->dev, +			"Tegra20 APB DMA OF registration failed
> >> %d\n", ret); +		goto err_unregister_dma_dev; +	}
> >=20
> > Would it be useful to move this into the core and have it register
> > the OF parts transparently to the driver? That's of course nothing
> > that should be done in this patch.
>=20
> That'd probably be possible, yes, given a few extra fields in struct
> dma_device, e.g. for the of_xlate function pointer. As you say, I
> won't address it in this patch though.

Okay, that's fine.

Thierry

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnufpAAoJEN0jrNd/PrOhmpwP/RAt5hlwhM/nxxWxs1sVR0ea
wCieUIxAbsW1gPHDyyUyXDODeQAeBmqbRkiChujhdDAnK7bn0LG16u12oUt0vU5c
6yMBd6ZxN6tf2Jek8351cZ6ctK77qTnKRlo6hO/juoAnfSszfZcHojHNFzJu02QA
bUWNZ039IOIE2plP0vcd3n7jEn/Fui8V1u90QxSTwzDhNrZ2NXEnQzOTeKvpjVLP
uqiF1QKM2pH2zKMGdXCRx1GuqqMyXxapmVewkYL6jOEn7OnFb4NP9tcdsIHPWTEi
sol7MVqQPTB2xx51So9IJBacoYcgjGQXseCO9e1ZINazJyHsDBAPAJjTLbLc42SS
xElSFmMas7PHKUeJEUwdTWcE7cICWWOMWTypygndqvzIcl2oQQDrnnv5ongJrdvg
662P6vKHV8IloOLhzvyKvMMJUOooApsjBfhx1x598IF4eEEDAmzGQCTqArHwJgv1
lQtnpiVgzY7A0ZX1SywFZ4Gp3sF2qQLdYcc0Kv9GHCJhMcq7xiBVIubYCpLQkZRV
72+j63lBOyonRkhBXuGw3s6srQblN01t4aHPJvEkG0DLuyrwK1unpYjYKfzDfiqu
n/9Oq5zUvqCA3xRQDi0wp1WNyoecS6Qk65n0P0x8qKkDpgDPyEbIfpyQXJOkgVHR
3s5V0U471xk59mfUOn8r
=9xzo
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
