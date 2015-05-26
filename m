From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging:nvec:nvec - Fix for typo in comment to function
 tegra_nvec_remove().
Date: Tue, 26 May 2015 13:47:17 +0200
Message-ID: <3269524.kNMZGSE8Ks@fb07-iapwap2>
References: <1432586801-5879-1-git-send-email-shailendra.capricorn@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1816191725490892658=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1432586801-5879-1-git-send-email-shailendra.capricorn@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Shailendra Verma <shailendra.capricorn@gmail.com>
Cc: devel@driverdev.osuosl.org, Julian Andres Klode <jak@jak-linux.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

--===============1816191725490892658==
Content-Type: multipart/signed; boundary="nextPart3725027.o5IgLPyd0C"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3725027.o5IgLPyd0C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

Hi Shailendra,

you should fill the patch description with something, even if trivial, =
and=20
trim the subject line a bit, e.g.

=2D--
staging: nvec: fix typo in comment (all lowercase, no full stop at the =
end)

Fix spelling error in comment in function tegra_nvec_remove.

S-o-b
=2D----

Thanks,

Marc

Am Dienstag, 26. Mai 2015, 02:16:41 schrieb Shailendra Verma:
> Signed-off-by: Shailendra Verma <shailendra.capricorn@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.=
c
> index 1bdc8d0..164634d 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -916,7 +916,7 @@ static int tegra_nvec_remove(struct platform_devi=
ce
> *pdev) nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
>  =09cancel_work_sync(&nvec->rx_work);
>  =09cancel_work_sync(&nvec->tx_work);
> -=09/* FIXME: needs check wether nvec is responsible for power off */=

> +=09/* FIXME: needs check whether nvec is responsible for power off *=
/
>  =09pm_power_off =3D NULL;
>=20
>  =09return 0;

--nextPart3725027.o5IgLPyd0C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVZF1FAAoJEKyeR39HFBtof+MH/AvR5Ke8QQS8HKLxM8xAXz3S
xBOTlLFJoHAPOze1oQ60UJk1nBvHeAK0oDAl9qsOAvOk9YO7aB//UPOgrPPy9x1X
7T/Wev0VI1A+mBgJxw7nyV/58rTmhyy+FNwS0+Av7Xpgng32LVg91hdAZT2we74Z
ycFTduv9K3u69vMPhZZ4r0v5LOUUDUt2WZ7tOIImmTptRt8aaiBO/N0K/wfn2eWM
Kz5/Ktw1jzZY7ws1A91cNx/TU6uiiUy3DmBiNz9wnQEfktQ3gTFcrYJc4+bGYsUT
uAaQ6VGp1BOz52tlqcPNS6GM26bbW3NGWFRnrcqcb2W42BIkRCoaN+BSNDe9NUI=
=d8Ib
-----END PGP SIGNATURE-----

--nextPart3725027.o5IgLPyd0C--


--===============1816191725490892658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1816191725490892658==--
