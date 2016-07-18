From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-apb: Return the actual descriptor
 status
Date: Mon, 18 Jul 2016 09:17:40 +0200
Message-ID: <20160718071740.GF10785@ulmo.ba.sec>
References: <1467216519-7200-1-git-send-email-jonathanh@nvidia.com>
 <1467216519-7200-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467216519-7200-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 05:08:39PM +0100, Jon Hunter wrote:
> Commit 71f7e6cc5500 ('dmaengine: tegra20-apb-dma: Only calculate residue
> if txstate exists') changed the tegra_dma_tx_status() function to only
> calculate the residue if there is a valid 'txstate' pointer for storing
> the residue. Although this makes sense, this changed the behaviour of
> the function tegra_dma_tx_status() such that if the pointer 'txstate' is
> not valid, then we will return whatever state is returned by
> dma_cookie_status() and no longer return the state by looking up the DMA
> descriptor and returning it's state.
>=20
> Please note that dma_cookie_status() will either return DMA_COMPLETE or
> DMA_IN_PROGRESS. However, if dma_cookie_status() returns DMA_IN_PROGRESS
> the actual status could be DMA_ERROR which will only be seen from
> checking the descriptor status. Therefore, even if 'txstate' is not
> valid, still check to see if there is a valid descriptor for the cookie
> in question and if so return the descriptor state. Finally, ensure the
> residue is still not calculated if the 'txstate' is not valid.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXjIKUAAoJEN0jrNd/PrOhklIP/RTuNMBjv1ST3QKdC+gtcIA8
G9k0umDsiWKHaeenn4QrUJc2quFfyACCR8LZyuQN0zPbJcTsQa20XRwdN1wAUSbM
2l2RJsbsX99aUvUWZo3cZgs7WLkp+r2C6SCU0rDYEJ9UZyQVpRTfJYHJolFmosW8
6LVTaVn4ByxVdfVBXtp+Wkj0YGF8Eri53qkSOAmRjPxeLTAkWEqEmSKjoaznsBVn
z4BFiDDBCCe6zTjXmmUDTsnm/ui6pIPLPYLF+FSts2JL2IeAdbCC7xRPfpq5ns/5
W5e0RVVZkbt1kQEXXIH3AYNWY0o9qCykxNdTt9pF/gFYLPX1hOe0m82pnMduxDlY
n6DYjVqyU3V4WjZs4xeBI1LYoHJqHLsSMbX/ciOKa2pjDsvcepv4sx0ar84ZHx2Z
dywuRbQLDzTQuzcph47Uey+Ywr4BrBlDycCzO/984PL21PrGkVVQb3DCQFpK0Jt5
NyJvPHxWZJvpLHSt2q0ExJbpsq6TEPfZClYycASdsQD9YECWRXR1cfVsdSyTI/y9
1F80oB9C8Xm3PVIZbAv6bErKeCpOrbmgokPWfBL2hOSBd3hg91w5kWSdwlh4470c
85W7mol5TWG11bbWi7pyqZURQJbAKkU8RSTwbAfC03l3yp/swWxv6ajASet1rnD8
mxDjJqyndW9p9aeI8fgy
=xrWM
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
