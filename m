From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: tegra20: Add device tree node to
 describe IRAM
Date: Wed, 20 Dec 2017 20:19:39 +0100
Message-ID: <20171220191939.GE9687@ulmo>
References: <cover.1513038011.git.digetx@gmail.com>
 <92563f9030ab413ff8f6d5a6b6a5680124ec4d98.1513038011.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <92563f9030ab413ff8f6d5a6b6a5680124ec4d98.1513038011.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 03:26:09AM +0300, Dmitry Osipenko wrote:
> From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
>=20
> All Tegra20 SoCs contain 256KiB IRAM, which is used to store
> resume code and by a video decoder engine.
>=20
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

Thierry

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6t8sACgkQ3SOs138+
s6F3tQ//Qlj1LW9auRVzLNEljlIaVA9PvpaSI+bHlvcm2oaLI72x4+90goOb1FoU
bCBzHj8fgu3zu8pPGAskWhw3vx9OBA6tJjOywMBuxuEKtRXsXLe3tw4uKu4ASP6Q
MCM9RACnNCJf/mNFW3akz3L3WQKhozPGCdH5huANVvGGI3hChfNaPCX2N9Rc6Lkk
fUsTzUe+BpKUwN9Vm/XG6Bo0WbYuGBA+khGzGO4OGt9v95vhYoUOt7v1nuo3l0Wq
T0sN6UEQIyslunYLJqVwNmmBEPAuNCabdFhFfrto3BhkyFHsQqCG8S25EHWBHmcv
kbX47z/n89pdt0Frpz/c148lky/gr7T+BdWHvbuQw8FXAvRxOrtgnCzzCQyKd8Qi
xSZzbcjF5Wapy25m/N7KihAvuhWMsIENljarK5kHAGWqwZLrA+CyeVNrXXae1HFs
8TqCNUpBEoTKjBm4oZ5Cs7hazHM2XYjvddGdbWWO2B7AQRDXVf2WUCgicCvOU7nX
/6RbJqpiAPDB2W0Ye6S9B15ZAYxMzHy+B/+lBKql/pYysVEzqfvnUEkkLPayruyx
u9dRXxy2hQy7SYwuMM1/XP04b1Xrvn7S1rak09/W3GpbJrIJ56Q83Sl7L1XGb1GK
2fPn7POUiQGtY2auj4fD9K8PB3W2g5WWXSyj0ZERvoGZTL0OE2A=
=OB1z
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
