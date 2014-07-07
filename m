From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] staging: nvec: remove unnecessary 'else' after
 'return' statement
Date: Mon, 7 Jul 2014 07:53:25 +0200
Message-ID: <20140707055324.GB15216@ulmo>
References: <cover.1404586529.git.pawel.lebioda89@gmail.com>
 <55d9b3cb9cf1c54d1fc87dd1d6a582f6067cc295.1404586529.git.pawel.lebioda89@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0907320595958050516=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <55d9b3cb9cf1c54d1fc87dd1d6a582f6067cc295.1404586529.git.pawel.lebioda89@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Pawel Lebioda <pawel.lebioda89@gmail.com>
Cc: devel@driverdev.osuosl.org, Julian Andres Klode <jak@jak-linux.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org


--===============0907320595958050516==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 05, 2014 at 10:30:55PM +0200, Pawel Lebioda wrote:
> Fix the following warning reported by checkpatch.pl:
>=20
> WARNING: else is not generally useful after a break or return
> 235: FILE: drivers/staging/nvec/nvec.c:235
>=20
> Signed-off-by: Pawel Lebioda <pawel.lebioda89@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTujXUAAoJEN0jrNd/PrOhbcMP/iiRMnLKuRAtXfu2ruzFOZfR
Xim7F3M+CmK/Cklt7aVWvN1/z4uwjJm/dAKxf32F82R0K1KCSzSMvaETgglheM8I
J5rjLGm6BMD0TjqdhYVgJuvhykBON0i53URnzOsQ6u7ADqJTP2e+LNUbtjfFujpj
GAovR3IenBqQ42kMnr5s2l/LTg9TapQoECxvkXrK2lrSSMjhGQ3FF1FOEGcvBEwz
n8dG4MFF4L9bblWJhsWkd2IfU3Tx1UuV5gT8u1zr9kxv7V0TD1nwS0aKNy/9w9ZW
ACzdoS2Qr9uJ3a5yPypTRsbzjKtfd77ERMqegLTgL40TDgjNZUP1MukpG4banC2H
4MDz4P+q5a67zraTmuXQ0TnfKKlvUQzwQnP1/TnxfVoFfbX7SnxBRBS3nhX1FwIl
XvzZ6gYjiMqbniyw9AdGDtYHDlVrKfMdUqx3T2TRhnbcIc3WHOHwp0jrtK5j/t89
OybSwJahjR2Kh6KTshP1YxsIxW23BjW8oXUMSQ/R1X0yD6GQo9gs8S3fHYiIo+N0
J2RBXbzPE+smrwiNZYSQJP6GMr9++ngLkli15eK2JwhwDzTLERalVE3XhGNNIK32
uAzBMlZwUQiMOYQe7rMv7w8fvpItqFt0pwp8XbzTsayROnXVeDbUEFCLf2nJwbLT
A6JzI1Zv/0alCB40RGMe
=xzUD
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

--===============0907320595958050516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============0907320595958050516==--
