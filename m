From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] dma: tegra: register as an OF DMA controller
Date: Wed, 4 Dec 2013 10:45:54 +0100
Message-ID: <20131204094554.GQ19943@ulmo.nvidia.com>
References: <1386102787-21839-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GTGEtWEe6jD60dxL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386102787-21839-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GTGEtWEe6jD60dxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 01:33:07PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Call of_dma_controller_register() so that DMA clients can look up the
> Tegra DMA controller using standard APIs. This requires the of_xlate()
> function to save off the DMA slave ID, and for tegra_dma_slave_config()
> not to over-write this information; once DMA client drivers are converted
> to dma_request_slave_channel() and DT-based lookups, they won't set this
> field of struct dma_slave_config anymore.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v3: Rework of_xlate() to use new dma_get_any_slave_channel().
>=20
> v2: Use of_dma_slave_xlate() rather than of_dma_simple_xlate(), as
>     suggested by Arnd Bergmann.
>=20
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/dma/tegra20-apb-dma.c | 39 ++++++++++++++++++++++++++++++++++++-=
--
>  1 file changed, 36 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--GTGEtWEe6jD60dxL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnvnSAAoJEN0jrNd/PrOhqSEQAK48JH1d8po4yew/bfwCKfOZ
+4IlExllaba9fMcLPOaOWu/I3hz/PfoDUs2C2MgnQqwbzExqW9mtZ5hdepZh60Aq
6cYzTCrVrxMzf57SxssUddQtQFE6PeLWVY/7/nkGBc3isHeGvmvGoNrbgdSHuLub
43dCyUMvr7TCoaWg5sHDkhedxdaHzt5M/cfEL8XPGxwFTHO/JYmYrpuEQiLKYX6m
yJKLGHwR9bg6ozRY835y8yaG5kn1dc1O5XjfAEwxofb81oTGDSE0w+j+r/VjtEPF
S4QqNb5KuiCKqeowH3iIsH+/YAdD7TmKy8wET3gtNv1UM6v0+Axe3o5uzr/MGKqh
VmqgyoSqLQkX5nFk5Wvj6auBOO9diSWTLUEtHZ/pE8uSeXRa3JGVZICcYVz4yxwD
NkNBsQMCIOzRtX8UvNccy2ZC+JtLyNJFgJmf9Hhth35nVX3Dq+o0NrVKc5S+pIyf
eU73FsY8NgsZcqkiHzHlIM0hPWjTnE57Q2GO++OFZD0kuLj5XKB2AHRyyKMv+9bs
Ey43Ql70SRxojwv0gzwRNLrxtuyi7/SeZTmSObn4SLksh+A0DiM0V1Ud1PWB9xd/
VMYDIBA3xee1EJ4HHFhWLBGuFYfd0Spkbt7arz7r2TG4mL+jTbFTM9VJMhMxRhNY
79HzOgdZShHZ9onBU+lt
=U4pG
-----END PGP SIGNATURE-----

--GTGEtWEe6jD60dxL--
