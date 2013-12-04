From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dma: tegra: add support for Tegra148/124
Date: Wed, 4 Dec 2013 09:37:54 +0100
Message-ID: <20131204083753.GD19943@ulmo.nvidia.com>
References: <1386094550-5011-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386094550-5011-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, kunala-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:15:50AM -0700, Stephen Warren wrote:
[...]
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
[...]
> @@ -986,7 +1014,8 @@ static struct dma_async_tx_descriptor *tegra_dma_pre=
p_slave_sg(
> =20
>  		sg_req->ch_regs.apb_ptr =3D apb_ptr;
>  		sg_req->ch_regs.ahb_ptr =3D mem;
> -		sg_req->ch_regs.csr =3D csr | ((len - 4) & 0xFFFC);
> +		sg_req->ch_regs.csr =3D csr;
> +		tegra_dma_prep_wcount(tdc, &(sg_req->ch_regs), len);

The parentheses aren't required here.

>  		sg_req->ch_regs.apb_seq =3D apb_seq;
>  		sg_req->ch_regs.ahb_seq =3D ahb_seq;
>  		sg_req->configured =3D false;
> @@ -1115,7 +1144,8 @@ static struct dma_async_tx_descriptor *tegra_dma_pr=
ep_dma_cyclic(
>  		ahb_seq |=3D get_burst_size(tdc, burst_size, slave_bw, len);
>  		sg_req->ch_regs.apb_ptr =3D apb_ptr;
>  		sg_req->ch_regs.ahb_ptr =3D mem;
> -		sg_req->ch_regs.csr =3D csr | ((len - 4) & 0xFFFC);
> +		sg_req->ch_regs.csr =3D csr;
> +		tegra_dma_prep_wcount(tdc, &(sg_req->ch_regs), len);

Nor here. Other than that, looks good to me:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

And since I've had this same patch in my tree for a while:

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnunhAAoJEN0jrNd/PrOh+MQP/jac+CmrJrL3EMvV9OoCNKEm
ZBtm9T5e0yKOq8jIkF6fxEFKl5srnamRjglOuGVb5Crgwqb7dD8gfkwkNBdJpDnG
yj0H7moUrsVXl9fOZHeTBI/C865wOng2+PM0Rev0Yn8PtKfqHXk6Y6chmpjXhTK9
N5SZHrmSdkpWROSQbY20O3i70nuiqGw73fo0+kUHg+KxlAkmYZSE57g6WAGLRM8W
GRcEm8ElLDMMGgvFJ6DtFUfQh+jpbIe24ajo2c1r6OkLr39JgoQozVpC5huoURYT
38lHl25FGr2s7hFD6MbegEttjQAOZyedo3zzgw+VBIo3KWfHgeTKwmag4SsoJzjd
1oiTRvf2qx9CFiUz5hkLzmp10qUybOxoiIKjUFCoShaBwAUhItskLqljfUVJLOI6
U02ldQIwi2bdCsjba3FQIRJ6OsQusGy/FOQRMzocIHNXStg+ZCuGvE3G8rplb1KA
m4PxXq0WWXZ0rmYiSg9YvqtduKdvLodTd+TAw2dZB/0YptCitKzV8dwW+ONu5GJc
751CtMTgzFYoRELVyHj2li8tUdl25QA5yiGdTu5xpj5YmscjUwc9NBO1pux3x+Kb
6t+zHdBmhWeXc67ZDSg8Un4s4OHzoqC03+4LOGPsUyZE0saynkzkMCeAFtmCAdy1
+igZM9k2E3EUwvAxLHe9
=hLZz
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
