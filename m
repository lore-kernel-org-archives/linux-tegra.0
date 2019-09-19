From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2] soc/tegra: fuse: Add fuse clock check in
 tegra_fuse_readl
Date: Thu, 19 Sep 2019 10:40:03 +0200
Message-ID: <20190919084003.GA5041@ulmo>
References: <1567508212-1194-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567508212-1194-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 04:26:52PM +0530, Nagarjuna Kristam wrote:
> tegra_fuse_readl() can be called from drivers at any time. If this API is
> called before tegra_fuse_probe(), we end up enabling clock before it is
> registered. Add check for fuse clock in tegra_fuse_readl() and return
> corresponding error if any.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
> 	- Added Null and other error checks for fuse->clk.
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Hi ARM-SoC maintainers,

can you pick this up as a bugfix for v5.4-rc1? Would you prefer to pick
it up directly or do you want a pull request for this?

The patchwork link is:

	http://patchwork.ozlabs.org/patch/1156928/

And in that case:

Acked-by: Thierry Reding <treding@nvidia.com>

Thanks,
Thierry

> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse=
/fuse-tegra.c
> index 3eb44e6..58996c6 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -186,9 +186,12 @@ u32 __init tegra_fuse_read_early(unsigned int offset)
> =20
>  int tegra_fuse_readl(unsigned long offset, u32 *value)
>  {
> -	if (!fuse->read)
> +	if (!fuse->read || !fuse->clk)
>  		return -EPROBE_DEFER;
> =20
> +	if (IS_ERR(fuse->clk))
> +		return PTR_ERR(fuse->clk);
> +
>  	*value =3D fuse->read(fuse, offset);
> =20
>  	return 0;
> --=20
> 2.7.4
>=20

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2DPuAACgkQ3SOs138+
s6GmAg/+Jhj7yV6aaQ9kxLakkr2/Th9Tz8TCfLK/J6wyD1YDS+AV8shbj0xqaJ+9
dyfl226iOR8PVxbjjSFe0w7oiUNooDVS8HpQrrvGgMqCoZLX5eewx9krafWilYzc
sq0ayCUteJjJ4FjygmoBkaKDyqXqosYnXMr3NMC7f6uXBBUTbQKAcO6Mg0igk1Ss
OkV2Pa1W771tKqlWyPAQy/DLXDeKsvp/mW2DId9GZhJw8pgToZUcCNiJoL2yFPmq
KsZBE4mxacIelukWGjYaGwufIP4r8qKSzp/99aYOM+dmhToKPGZG1XDQMNDseatM
7yNBKguVXZatZbHy8wXseC6LZy8KhDY5xOeNhZK5Im5sff30Egs1RKMj+NAZgrNo
Js4quAlLe0SqWf4sOC3iiPrqa1VctDKttd1mQg3rx2svu7Rg6AFD55zcNyy9R6Mm
tMXO5wi/G8Wd776caNI9jL2vZth/29P/hs+3Wo6HZ3p+KtiaVdUIMAgG2wcK6mkQ
r/kmk6d+nlrKL6WLNJLASmgeV6Hw3QCiOj5HWxCfhUvjA+0edcANinlxUNl20Wbe
AVd30Pkh8ISJxO7Kls+zGfDiTqsPmNZn/+i/rlHE6BUw2Rhjze9Wl3w3qMfrV485
EgpG8wYwsomtCX4DBdNsZaAo5UdfxyDPwXDZZIecEAstyJ67ymw=
=W88y
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
