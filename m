From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Mon, 21 Jul 2014 15:12:34 +0200
Message-ID: <20140721131233.GG15238@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <111661024.qGiugVUugr@wuerfel>
 <20140717110652.GA18383@ulmo>
 <6373493.kzO00ziuYq@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6373493.kzO00ziuYq@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 02:06:10PM +0200, Arnd Bergmann wrote:
> On Thursday 17 July 2014 13:06:53 Thierry Reding wrote:
> >=20
> > We could go all the way and make it include/soc/tegra/*.h for better
> > namespacing. I guess either way would be fine, really, since the number
> > of files in those directories should be small by definition, so we
> > should be able to do without the extra SoC directory, too. I have a
> > slight preference for a separate SoC directory, do you have any
> > objections?
>=20
> I'm fine with it either way. I just noticed that you have now
> moved the file, which resulted in a build error:
>=20
> ../drivers/ata/ahci_tegra.c:27:35: fatal error: linux/tegra-powergate.h: =
No such file or directory
>  #include <linux/tegra-powergate.h>
>                                    ^
> compilation terminated.
> make[4]: *** [drivers/ata/ahci_tegra.o] Error 1
>=20
> so somebody needs to pick up this patch:
>=20
> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> index d30bb21afd67..d7c6b1f550cd 100644
> --- a/drivers/ata/ahci_tegra.c
> +++ b/drivers/ata/ahci_tegra.c
> @@ -24,8 +24,8 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> -#include <linux/tegra-powergate.h>
>  #include <linux/regulator/consumer.h>
> +#include <soc/tegra/pmc.h>
>  #include "ahci.h"
> =20
>  #define SATA_CONFIGURATION_0				0x180
>=20
>=20
> I haven't checked which trees are affected of if you have already posted
> a patch to do this.
>=20
> 	Arnd

Adding Tejun, since he took this into his tree on Friday I think, just a
few hours after I sent out pull requests for this.

I hadn't considered this build dependency. We could resolve this in two
ways I think:

	- merge the for-3.17/fuse-move branch from the Tegra tree into
	  the libata tree and apply Arnd's patch to the libata tree

	- provide a dummy include/linux/tegra-powergate.h header that
	  includes soc/tegra/powergate.h

In the latter case the dummy could possibly be removed right after
v3.17-rc1 along with a patch to convert the AHCI driver to use the new
header file. Or we could keep the compatibility header until the v3.18
merge window. I have a slight preference for this, even though it's a
wee bit of churn.

The problem is that we can't simply apply the patch that Arnd provided
because it would break the standalone libata tree if somebody were to
build Tegra with the new driver enabled.

Thierry

--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzRHBAAoJEN0jrNd/PrOhJhcP/ikzvcQeUZDZJmv134H8tYGT
7s2lsfCU9pIbwcJpxL4ma5DBLgv+kPsg45O5Y/EHApZGDA130mJp24a+9kc3te7a
xWDNb6ZX7Qimt8QIhcfbnUBNw2ilT8HX9i4SlMISrI9WUc9GcWIXLc4u376m+VJv
jQpgjnmioYx5zt4nBQHmPyXLRwnv9D0Oehn3QY0wO8Qc8SIM4zMkFYozgPgA4xgy
CcV2UepOFYDpe8jvTa5Kp++2TKRr/oA5EPw/W9AT3kOezYzwKRVn3I+iKV8KFd2f
mw67V4oE1xgL2GCKPDSIzhhvDCSMUVm3zHV9e8Qmg7xZiJillTbv80bDcmDprzYL
qDsPXJzS558dL44l+Rb89Z+MaamH3+PyVFQNVxpMClBLhW4g6Nn3WegCJqGBq/0a
giGxJa1w1trc9jBdi+3LvfOTn4DPvGAXHPOCe8SC38ICGr6SNdb7VmqtF3phfEkb
ryopctRxZxIBG4AtuW9l4/WWtSKz2L7SFkdTFU/ZxsPeqEtEmpNjcoVt8nky05FL
pRqj3Pxu24ulKUMAb8Wn8zrvTTuvYtArUMIkEqfbvh9OB8UdVmhai/PT9vw35kQr
3sJ8Wo8Sdao7PjwbAYA8OBAQmfj1zaKitsQOf/Zj2gs2FlRJ8tfqto0zB0vx7Uqf
+4aPRFXgMqwd5XIGAQoo
=T4bj
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--
