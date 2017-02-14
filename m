From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: Fix incorrect type of i2c address
Date: Tue, 14 Feb 2017 11:39:37 +0100
Message-ID: <6772464.KSTSTH2iUx@fb07-iapwap2>
References: <20170213083519.10309-1-fdemathieu@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5206132917988864028=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170213083519.10309-1-fdemathieu@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Franck Demathieu <fdemathieu@gmail.com>, linux-tegra@vger.kernel.org
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org
List-Id: linux-tegra@vger.kernel.org

--===============5206132917988864028==
Content-Type: multipart/signed; boundary="nextPart7561633.zGTobP2yQ5"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7561633.zGTobP2yQ5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Am Montag, 13. Februar 2017, 09:35:19 CET schrieb Franck Demathieu:
> From: Franck Demathieu <franck.demathieu@intel.com>
> 
> The i2c address is unsigned according to the dt-bindings.
> Fix sparse issue (-Wtypesign):
> 
>   drivers/staging/nvec/nvec.c:781:35: warning: incorrect type in argument 3
> (different signedness) drivers/staging/nvec/nvec.c:781:35:    expected
> unsigned int [usertype] *out_value drivers/staging/nvec/nvec.c:781:35:   
> got int *<noident>
> 
> Signed-off-by: Franck Demathieu <fdemathieu@gmail.com>

looks correct. Thanks!

Acked-by: Marc Dietrich <marvin24@gmx.de>

> ---
>  drivers/staging/nvec/nvec.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.h b/drivers/staging/nvec/nvec.h
> index c03ca8d..aa7c70e 100644
> --- a/drivers/staging/nvec/nvec.h
> +++ b/drivers/staging/nvec/nvec.h
> @@ -138,7 +138,7 @@ struct nvec_chip {
>  	struct device *dev;
>  	int gpio;
>  	int irq;
> -	int i2c_addr;
> +	u32 i2c_addr;
>  	void __iomem *base;
>  	struct clk *i2c_clk;
>  	struct reset_control *rst;


--nextPart7561633.zGTobP2yQ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEySF+t0C8+8jyqfBvrJ5Hf0cUG2gFAlii3mkACgkQrJ5Hf0cU
G2iA8wf/RVivxEQ5SltMAo5lp0efRkWHJ+auX3rZvWMjYTQy/lw64lFca9hla+kV
qqGv5ZwIpn8/+d1t3irl9/b1+cWX5LhbWfCrRyhUWRifiXgZbTDYIq3cEUBMMZHR
d3qm++mU4HbCo0EplkojBtVxVQGAyUudAWviZKZ+PdYa6KsU2KtyGU7bgPeGj0XY
qCUhGWE3pcJNff+sSMeMfD/hSmBvfhTwOCy7SGKm75X7X3CjCb0XXtKkfsJhNTyM
HCvxbSPslKWsCRhT1qQgmQLe6td4QPKDiTFhLyI7JxKl5jEalM0CNZ+wzVYe9qLr
QJ0KR3zIphWs+77iQK4JMHLDVjBVHg==
=TgoM
-----END PGP SIGNATURE-----

--nextPart7561633.zGTobP2yQ5--


--===============5206132917988864028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============5206132917988864028==--
