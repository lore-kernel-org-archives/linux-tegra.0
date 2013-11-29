From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: add support for Tegra148/124
Date: Fri, 29 Nov 2013 16:54:43 +0100
Message-ID: <20131129155442.GO9712@ulmo.nvidia.com>
References: <1385417732-7767-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RHdRtM27np9fZUoh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385417732-7767-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kunal Agrawal <kunala-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--RHdRtM27np9fZUoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 25, 2013 at 03:15:32PM -0700, Stephen Warren wrote:
[...]
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
[...]
> +/* Tegra148 specific registers */
> +#define TEGRA_APBDMA_CHAN_WCOUNT		0x20
> +#define TEGRA_APBDMA_WCOUNT_WCOUNT_SHIFT	2
> +#define TEGRA_APBDMA_WCOUNT_WCOUNT_MASK		0xfffffffc

According to the TRM this field spans bits 29:2, so the mask should be
0x3ffffffc.

> +#define TEGRA_APBDMA_CHAN_WORD_TRANSFER		0x24
> +#define TEGRA_APBDMA_WORD_TRANSFER_WXFER_SHIFT	2
> +#define TEGRA_APBDMA_WORD_TRANSFER_WXFER_MASK	0xfffc

Comparing to the TRM these should be named:

	TEGRA_APBDMA_CHAN_WORD_TRANSFER_COUNT_SHIFT
	TEGRA_APBDMA_CHAN_WORD_TRANSFER_COUNT_MASK

Also the COUNT field spans bits 29:2, so the mask should be 0x3ffffffc.

> @@ -719,6 +735,7 @@ static void tegra_dma_terminate_all(struct dma_chan *dc)
>  	struct tegra_dma_desc *dma_desc;
>  	unsigned long flags;
>  	unsigned long status;
> +	unsigned long wcount = 0;

You assign a value to this later on, so I don't think this needs to be
initialized.

Thierry

--RHdRtM27np9fZUoh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmLjCAAoJEN0jrNd/PrOh1HgQAJYhxbJ3Q+ffehYmieYNwGmB
eMGwrkja4j3iBFMsY3/CJhVLZ5LX96Kd3RR+qOqrLsncZm6aYlNTROKmgQmR4TbO
AIGDCpVBmpSnoKVJyaw8cMj0ZyB/mwRGiwiBawIBtNBVOQgy7eRiRatOGRz+cemB
RbbimKlzNzLj8AOXvr9EzL4uOHRLxppcF4hGj3807T+esyOXxpNCfBarcZDZEigf
oWnzGwJ+m3h/74AgVlY573Kx8IPjM+wafby72ghdT3GcCuCQ7XADxz8SckW0wM5l
GlbcJ9UF6norSBumvx3vWzDb7Q191k7QTObI6SrrV0yMXckdmO/NWnrscSC3Us0k
8uRkZk4UFDjgHVz+8m4gcFg6tYO+ngFdDqLIBi3g6VIq9GdO0qV5AJjbPh6zNLYK
Hu0gauvHKhsHEYwMwaVJyJDElcJ2p115LPrgODvo+vSLI23GBfeu9PcG77VQRfNM
F7T9IdhC976v0nvlMVCIPKCjfIRieSWEhFU0EXFjcE2cXxfp8NCQw/5jjcnwID4k
o0J7EhKtc3lACfElwpK2+6tY5CbvYNQ5xRDjhy63BIgEVMRUP5ReNJsKqzYSt730
H2JyCxBeR46Y7gtmk0n8cnTtT53/gaacqR8QEBbymd3LjwI2gimxXwWOEU0GZ9Y4
VIpHB0Q+/2QNoOrZCyXn
=hv+f
-----END PGP SIGNATURE-----

--RHdRtM27np9fZUoh--
