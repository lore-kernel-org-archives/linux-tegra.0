From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] DMA: Remove .owner field for driver
Date: Thu, 25 Sep 2014 08:57:05 +0200
Message-ID: <20140925065704.GE12423@ulmo>
References: <1411540764-27571-1-git-send-email-kiran.padwal@smartplayin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411540764-27571-1-git-send-email-kiran.padwal-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kiran Padwal <kiran.padwal-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kiran.padwal21-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 24, 2014 at 12:09:23PM +0530, Kiran Padwal wrote:
[...]
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 16efa60..a6c0b3f 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1597,7 +1597,6 @@ static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>  static struct platform_driver tegra_dmac_driver = {
>  	.driver = {
>  		.name	= "tegra-apbdma",
> -		.owner = THIS_MODULE,
>  		.pm	= &tegra_dma_dev_pm_ops,
>  		.of_match_table = tegra_dma_of_match,
>  	},

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUI7zAAAoJEN0jrNd/PrOhW5kP/1Xj4rhyUhkcJKCBAzEYqiDw
m0s5PUV2NtnjRvNJcLleu0XG4tgOFaUfy589riDn5rqP2Z7irP4HuubSl4174xWR
3jJ+UI+KanUFBvpE1uAn70vRU5ElYH08cmtw+qOtPqLOV/n9rUFjelKnu92wgEXI
ukK6CacAoxdtvh3TIwqNthu1t0l/Q8Ex1ltbXxmk8rZFNa8Dgqm0azcdyCRTsQ+p
Asi+Yz8dwCf5RgQuOf0M5EuKjgy/b3+NLgY9GGq7HMwy2MDRDE7SVNA8CrOFi3d3
lbTxBbRZpYjlhPbNTS4DITCaCzU5P/nvN+9eF/IbpBX2HKPqm87P5OM2b3wvwf2o
l+EdBAePxrb5ovc37/GM/zT4GbC3VXFU2O1YJIPhoQ+dJ83YtArQ//GqRPXbGSZy
RI6r2Nr8qcXYxpZ6QT63En5QQfmgSyiKysRFbFk1ffk65Lag/e12Ia2ZIwO/8Q+E
r5Eom29IsYKSJPgDRKj++IOudzbsuGkdmHDyL5y6Nefb/JpGoq8bhJtuyi6BuExO
mIA7R+P1ELFBS7tfto0h+enqXvdkmfTAnC+tmqIl0SIFHDbjB7icXm3Av3Exoc61
C6/nWNeYIVHslistwHTt25V9qYdr8Ng+aWf/GRTOn17ZQ78YpbaXj15TJEbXzL8Y
lEubLCNU/ZvhEuLiU/x2
=SWTd
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
