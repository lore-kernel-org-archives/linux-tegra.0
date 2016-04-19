From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 1/3] gpio: tegra: Don't open code
 of_device_get_match_data()
Date: Tue, 19 Apr 2016 14:06:06 +0200
Message-ID: <20160419120606.GB8284@ulmo.ba.sec>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 03:13:38PM +0530, Laxman Dewangan wrote:
> Use of_device_get_match_data() for getting matched data
> instead of implementing this locally.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
>=20
> ---
> Collected reviewed by from Stephen.
> ---
>  drivers/gpio/gpio-tegra.c | 50 +++++++++++++++++++++++------------------=
------
>  1 file changed, 24 insertions(+), 26 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFh8sAAoJEN0jrNd/PrOhiIkP/0wV7SKpcXd4XToCv1GbzBUI
EJTVHAcyzrIDmYDZz5KJTYQnc5rCDVw3g2iEqgyE/D5LHXviLLiFZTXETHTTN333
l0ctfsPsYEHzphDx/ickfsXqQWUZHYNzVKnu7g8DsavBzJNnvp/1bFgJ0nPCPkG3
qZOQmSNW1PwIGI4rCEDDv9c6Rzh9Rq37xrWwRAaUAXzfoRvrySVizFaxOk9RmjPC
JQr1g8aKu4V8pEHiuZaXd6Dgk0SrcxNZevh98jDPGZo0ZxR80VQ7gveJUIv6wEXy
wTzzKvL8nZ7rECJcmSzypxnienlaRoMQ0+XDi+PwFsihqE8nAW4zavPu8fCslq/d
2XU3Ht3VIEB5MFlbg21HSuIP8t+jnC0kDKqqZtPz8keIewwqUq1luxjzlxpTbSZT
n+4gViy7Y5PJnueAdPe7bLXctpeuQqVmgw6mPisbKWsaOccp6hjtvbWyDAdB1jso
fkKB63+GHk5WmcIqyAzZpu3Wmwa5Op9MSn4VMsWTr29LWh2J/318MdoE7eUAO3Ly
bTC5O+JWp6eiiQQQZKMdQFEvdy/tQNTM8Y/8jMftBD3kfJcieBg9i8SM0hlmQWOb
zWBSJAcJWmMTK55mVteChoIVFtEaQCJGiWbHuZffM5JxlKbUMLpG4MqsGNRjUMa3
38ZRJjW3bqzUlKClOYbl
=XJF7
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
