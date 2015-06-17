From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: remove duplicated const
Date: Wed, 17 Jun 2015 10:26:20 +0200
Message-ID: <1596867.Dc7iyCSx9r@fb07-iapwap2>
References: <1434467601-3290-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4882928341682814753=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1434467601-3290-1-git-send-email-van.freenix@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Peng Fan <van.freenix@gmail.com>, linux-tegra@vger.kernel.org
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--===============4882928341682814753==
Content-Type: multipart/signed; boundary="nextPart3219380.d6tjNLg1ce"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3219380.d6tjNLg1ce
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Am Dienstag, 16. Juni 2015, 23:13:21 schrieb Peng Fan:
> Sparse checking warning:
> "drivers/staging/nvec/nvec_ps2.c:172:14: warning: duplicate const".
> Remove the duplicated const to fix the warning.
> 
> Signed-off-by: Peng Fan <van.freenix@gmail.com>

Thanks!

Acked-by: Marc Dietrich <marvin24@gmx.de>

> ---
>  drivers/staging/nvec/nvec_ps2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec_ps2.c
> b/drivers/staging/nvec/nvec_ps2.c index 6ebbc82..0922dd3 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -169,8 +169,8 @@ static int nvec_mouse_resume(struct device *dev)
>  }
>  #endif
> 
> -static const SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
> -				nvec_mouse_resume);
> +static SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
> +			 nvec_mouse_resume);
> 
>  static struct platform_driver nvec_mouse_driver = {
>  	.probe  = nvec_mouse_probe,

--nextPart3219380.d6tjNLg1ce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVgS8sAAoJEKyeR39HFBtoYJcIAJ3cw4TjyHCXdo6fLXAJTejU
wiKCg/Tq9o+7hQi7zt96AmmnDdU4dEGxqa9IK/MMi303ulblxCINVAHRhI7/7gH6
RCSn0hg8ivADYhLmozkYHBAT8GF2iOd+I+9xuiDp9940tO1SaUSpSpIjjNbyEPCj
5jEVOpmKG4/W8rmTDBi6VWjQPu6/NlOiwGWzrZArubx16v5KFUwSfCYkjE082anH
gul6DpzOd5mzzaqMeiwIZ78Bp2CrEFmsbYLI7PUslT9zzhXSLpAGTAEuqs7M+3Gz
UAZ/i2h8yzkoAp+ZJj6lP5N+y7vdfncslIsbNM2h0zqIRUdqQTRaeJP3ZnyLksc=
=PoYE
-----END PGP SIGNATURE-----

--nextPart3219380.d6tjNLg1ce--


--===============4882928341682814753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============4882928341682814753==--
