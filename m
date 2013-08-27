From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch 2/2] gpu: host1x: returning success instead of -ENOMEM
Date: Tue, 27 Aug 2013 11:07:57 +0200
Message-ID: <20130827090755.GK8686@ulmo>
References: <20130823101911.GA1824@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W2ydbIOJmkm74tJ2"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130823101911.GA1824@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--W2ydbIOJmkm74tJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 01:19:11PM +0300, Dan Carpenter wrote:
> There is a mistake here so it returns PTR_ERR(NULL) which is success
> instead of -ENOMEM.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I can't compile this.

Good catch! Applied, thanks.

Thierry

--W2ydbIOJmkm74tJ2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHGxrAAoJEN0jrNd/PrOhD1MP/3oGRD7pkJOBf2UM0/sy0ydN
NRWB4fTEWSb6Y7RJNLGBD5cID2hNDnkXV1kstKg4dDhQjulenoi32yvoszCs5xS+
JBxh1wHJULPTcpEvKQ4MyB7PmlhcfEhToxOXd7fRi4mhHH7gBhQyu8+aJlfemT7e
MVYUoUkDVOr1JxaDFI0pHSr7HHV0p1a/KdDgHWZX2ss3/7LOqfA6HZcXkqZumEL0
Ft9mOuS+b7L2M5ba11XOh2vM4rxByzTNUOe7F4a1EeKKNP8ps4WWw5t7neoW3W+C
wLKILXj7+Dhj0iFmqon14K3ioIe9Km9MFjAVOCPnoBpQIkCqXQOwfFeH9l19hYI6
xIS1VzcfRKkQ6RN0Lcwd32g7pU2pWdCGSTG4K/7NkmYN3qw/X5T81BRP1YECDPDm
ZuwHTlKLA19wlotlmHbOzJ2uRn6pvA0bF4lylyKOAh5IzJ+oePQ/9rtMwsoboUg0
oKqbd8H4irbR61ACf2fB5L4ZF0QycVhl78MAAIs8M3UtwEr6khht2UDi9gP3FO0Z
Fy5xddprMQhjdDoTva2atWF2RYNd0U6EgNd4JlFQt5ZRsCTju+Bqj9XR45ZkzdVn
cmfOJBefTMurVH7O1HDOGEOsp7t4LyIZTCEUssJKDTGwl2LQBBwJ0Et0Ot4lPl44
+LtgT/qBgi8tGKO5+USH
=zws0
-----END PGP SIGNATURE-----

--W2ydbIOJmkm74tJ2--
