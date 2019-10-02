From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] usb: host: xhci-tegra: use
 regulator_bulk_set_supply_names()
Date: Wed, 2 Oct 2019 14:26:48 +0200
Message-ID: <20191002122648.GC3908655@ulmo>
References: <20191001132333.20146-1-brgl@bgdev.pl>
 <20191001132333.20146-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001132333.20146-4-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 03:23:33PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Use the new regulator helper instead of a for loop.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Ul4gACgkQ3SOs138+
s6HhUA/5Ab4y4CUvbNGI3qBuN5kszxhX3js9RnOzfvLMECkxSStw0S9bI4cluZBJ
Y9T9McYbSoWyoAqGuvVAK5BnqcgytzaqBMvLqmsYb0q5hYxQGCSHeQkpYir0Aq9q
0GiFHGkbqg0+y5UQkM0SlfWHwIYT7arDhd0XHncmNQtaAWWEKopZTSR2mys4XAE+
bXskoedemp3oIvjxXIvYQZzMYnJyMXTzLjtjEZFetaOWq1QVXY0Dqf5YasutN5/K
Urs9TGZtW31qxC9z6T6xWxLuPtS0kXOIhYQ+dlS66+sra4MNQaRse5h+1BWFKeee
Vmn81FVXniTLbpCMQ0M/gxFSGIoAADiK2EI0sDju3KzoOcq1Ol9gxQGeTnkXklSj
gXxt/1PwZPQLJxlerrYUvlv2gQLjdv74pRKCgAN5/JOKw25kXzANWjmNfWn3E3p0
/CUmrVCrCgIFG6yTt9bGGWCMsgMieEQP+scabwBYEi1Vflt+I4lwvxNFMD/3Qk4A
N7TRvhVMB8o4pa1jls6/NM6edqFnj7KZqBk4RhkCWsYbAECVgDB01rOsCH9sRIj9
mZMG6HUatyG3auomJxl4PZl4COre1ECfu92u182uqyt6+cIh1xyuZo0fNd9FJCei
TKkVS8C8ryl0zFEjPnObWBdD0HLb8aQJedzelvubwCU1U1bek28=
=qTAb
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
