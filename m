From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] gpu: host1x: Set DMA ops on device creation
Date: Wed, 2 Mar 2016 18:08:38 +0100
Message-ID: <20160302170838.GB486@ulmo.nvidia.com>
References: <1456477613-24995-1-git-send-email-acourbot@nvidia.com>
 <1456477613-24995-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456477613-24995-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 06:06:53PM +0900, Alexandre Courbot wrote:
> Currently host1x-instanciated devices have their dma_ops left to NULL,
> which makes any DMA operation (like buffer import) on ARM64 fallback
> to the dummy_dma_ops and fail with an error.
>=20
> This patch calls of_dma_configure() with the host1x node when creating
> such a device, so the proper DMA operations are set.
>=20
> Suggested-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/bus.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thierry

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1x4VAAoJEN0jrNd/PrOhgQwP/2QrvrZjRFlnhN7piknbXR8z
6Aihz2zB8e3qiZmiY0POn2LYxZDyAgvz3efvcrsH7/qQ4Idev23crxe4DN16sq3Y
kpUMwy7lMcANAckVj365npppZHP+zYV8s9IX0gUuGti320F0bQ4JXGqiCLM0uvmK
3Uu0RcYWiu5GGW9PaIPrFPijYVxuiVNvJAwloRKTND2XLoASt/3ZMF+D/3TlugSg
kLcs+xdRhvwbHJjwu15d1Oq4FsOYyEl6Gfqdg8XDrSdNkqRhAvzZIJqD8jw2SSSa
4P/313Wd+TqSHARO2ssmNTLppp65jSmownm+I6cppEmeXtr66yZD3XaSuhRq9axd
dnwVq6TsARW+W6IahVfUIOOAhmdP1WYA5vXDNkQs+G2+ZUV550w3ipr7onow06J4
J5bmP15PEYLWkQ5b4oQRXpEKL0PcXHbR8hdeurd3k/tzYcNuYixD7CSpuOI6bK3p
mZrO+49P8ax2ag+ZKQ6fdAbu4g9fMybGTBU5xE/wqt57UhTaquB1UNil+K51a3cj
pieg46UVodWVbIUr4qJuJ5hETskLlApLoocne1fN2mRvG2YNTXP7zqOFVdPKE4Ic
xIhT2eIvylDKakZcCzkRFrmSmAa0NdxceFPY1D8bAZy1j2Bti5At6FW9MR+HGdTe
+1Lv+Cnmj7LQAA5JxqMJ
=7bQZ
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
