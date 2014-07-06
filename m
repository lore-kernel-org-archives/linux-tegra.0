From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH 0/2] staging: nvec: fix some coding style problems
Date: Sun, 06 Jul 2014 10:26:41 +0200
Message-ID: <280954076.FMFuBvGU15@fb07-iapwap2>
References: <cover.1404586529.git.pawel.lebioda89@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1032843673445446678=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1404586529.git.pawel.lebioda89@gmail.com>
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


--===============1032843673445446678==
Content-Type: multipart/signed; boundary="nextPart9849659.i5ZEGLnPSd"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--nextPart9849659.i5ZEGLnPSd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi Pawel,

Am Samstag, 5. Juli 2014, 22:30:54 schrieb Pawel Lebioda:
> The following patches fix some warnings reported by checkpatch.pl
> 
> Pawel Lebioda (2):
>   staging: nvec: remove unnecessary 'else' after 'return' statement
>   staging: nvec: remove unneccessary 'out of memory' message
> 
>  drivers/staging/nvec/nvec.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

thanks for fixing, so for this series

Acked-by: Marc Dietrich <marvin24@gmx.de>

--nextPart9849659.i5ZEGLnPSd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTuQhBAAoJEKyeR39HFBto4KsH/2xv2G50rEedyYWKUUvWwi8P
zpC0SUKt0OHQiihuWx3VaORFqZUWZoR/8mlOftu0/EUoH2YRc4AmNlBPkoMeM/pa
Xg+nKltAyYAh8iA2aZdzOdt/++LemCHmq4oYwmR8tLbzf96vtCQvSarwGoQj0NBT
HuFAS0M+PwgilJkXTUy2XtkzURiDZ2hula3xEKFgI/5nluJ3V5g4WeYmhwT4Pm7F
6rUWrz9zgPWXYHS3lYbA74I4Ib1xh5k7hlsMb/XqWq8FSX1kld8GX+WC79lOe3yY
FBLJnipU30AwvpBF4dCVPHQjB7d2q1CuErcJqa3AbRzjyz6cD35HC1IalkEG5jA=
=EGnp
-----END PGP SIGNATURE-----

--nextPart9849659.i5ZEGLnPSd--


--===============1032843673445446678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1032843673445446678==--
