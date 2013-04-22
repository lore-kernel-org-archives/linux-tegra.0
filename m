From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Retry transfer when no_ack status is detected
Date: Mon, 22 Apr 2013 09:02:45 +0200
Message-ID: <20130422070245.GA17002@avionic-0098.mockup.avionic-design.de>
References: <1366371804-7901-1-git-send-email-hendrik.lippek@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366371804-7901-1-git-send-email-hendrik.lippek-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hendrik Lippek <hendrik.lippek-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2013 at 01:43:24PM +0200, Hendrik Lippek wrote:
> In such conditions return -EAGAIN from driver.
> This will cause the i2c-core to retry
> the transmission as per the retry count and time-out specified by the
> platform data of the adapter.
>=20
> This fix is adapted from chromeos
> commit:	16d971dd7ee9571746ff1d352fa3c0092a36478d
>=20
> Signed-off-by: Hendrik Lippek <hendrik.lippek-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patches for I2C driver should go to the respective maintainers, not only
the Tegra mailing list. You can use scripts/get_maintainer.pl to obtain
a list of people and mailing lists to Cc (though you may want to apply
common sense and strip that list down a bit). In this case at least
Wolfram Sang and the linux-i2c mailing lists should be Cc'ed. I've added
them now.

Also it would be useful if you could describe the error case that this
patch fixes in more detail. That way people know the context and can
more easily judge whether the fix is appropriate or suggest alternative
solutions to the problem.

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index c1bd68d..81a6170 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -756,7 +756,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_bus *i=
2c_bus,
>  	if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
>  		if (msg->flags & I2C_M_IGNORE_NAK)
>  			return 0;
> -		return -EREMOTEIO;
> +		return -EAGAIN;
>  	}
> =20
>  	if (i2c_dev->msg_err & I2C_ERR_UNEXPECTED_STATUS)

I've looked a bit at what other drivers do when receiving a NAK, and
returning -EREMOTEIO is by far the most common way to deal with it.
Furthermore I'm not sure if repeating a transfer when no ACK is received
is the right thing to do. After all there's usually a good reason for a
missing ACK (e.g. slave not present). That also means if this patch is
applied, every access to a slave that isn't present will be retried
several times before failing. It also means that if the transfer finally
fails because the retry count reaches 0, the I2C core will actually
propagate -EAGAIN and hide the original cause of the error.

Perhaps a better alternative would be to use the I2C_M_IGNORE_NAK flag.
There is some useful information in Documentation/i2c/i2c-protocol,
section "Modified transactions". It seems like this isn't a general
problem with the Tegra I2C controller but rather with the specific chip
on this hardware. Can you try if adding the I2C_M_IGNORE_NAK flag to the
transfers makes the problem disappear as well?

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRdOCVAAoJEN0jrNd/PrOhifIQALDRrIWs+qvka0etmeTigBsw
8SGO0Iuax8AZ9lrTALyduNMUWSah3N3KoupzTp615Rl+se6FFVBN3foHblNphjmi
5dlaTqeh91hSDxeqKwjlQXh9rjL7T5xNEhg7AfwnZocdslLh+3vY5VIUI2vm2zHj
QQ8gKWqvfA+po8aZu8VS5lL1ZEL+4kfnWlYjZ0A7YZauEJDBiHxvjG0Fo1JdHXuj
Lgu+u5pdbdtvUSfbKEdGMvBE/vcnaUtisV8nKCzULZfXfXdKAMlwJtzrEenXq1oj
Yr/yReAWQtbkMcZiCWyOF1HlklkMyuAFyFkurDWT3CClpgM/GE371brOUqimhlV6
XjUMsMJjujiBHPfdZoboUhpzgOXMezinliI4rP3oqzOJXJWmiBBrHRXRusz775wC
PpIGNapLVJqC5zbQqc5L9HLuwrdbEbxKNFJ+PEagXntK2JkUUYrjZor4mR1CDrU3
ILy+ZL7Danavswltb5ohIrzVt7E1rq69pJieWYZjqwF0OOe6km3D5/6qQPwNObxn
amXqRFVeBoKYVqYC/UHLKZ/nBxIDWAwqvZuwV0AtBnZI6Tsf+0ekfTlyDNru/P9Z
7C3Mun+AvNMHDmrRcb5klUvLqKtvr9gPnMDr6z815ublh4Q4dDy15tQQxUKmyVgM
adEUZSqkoyv+X5xv7Zq9
=zqFO
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
