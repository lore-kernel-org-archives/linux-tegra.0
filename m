From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH V2 0/9] Some Tegra I2C Updates
Date: Tue, 30 Aug 2016 22:38:44 +0200
Message-ID: <20160830203844.GD3645@katana>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 02:08:56PM +0100, Jon Hunter wrote:
> Add runtime-pm and pinctrl support for Tegra I2C driver.
>=20
> The first 6 patches are trivial clean-up/simplification changes.
>=20
> Changes since V1:
> - Fixed cppcheck warning reported by Wolfram
> - Added 3 more clean-up patches to fix some checkpatch issues
>=20
> Jon Hunter (9):
>   i2c: tegra: Fix lines over 80 characters
>   i2c: tegra: Use BIT macro
>   i2c: tegra: Fix missing blank lines after declarations
>   i2c: tegra: Add missing new line characters
>   i2c: tegra: Remove non device-tree support
>   i2c: tegra: Use device name for adapter name
>   i2c: tegra: Simplify I2C resume
>   i2c: tegra: Add runtime power-management support
>   i2c: tegra: Add pinctrl support
>=20

Applied to for-next, thanks!

If you are in for some more cleanups ;)

    SPATCH
drivers/i2c/busses/i2c-tegra.c:529:2-23: WARNING: Assignment of bool to 0/1
drivers/i2c/busses/i2c-tegra.c:555:3-24: WARNING: Assignment of bool to 0/1


--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxe7TAAoJEBQN5MwUoCm2GxYP+wSX8nsxb+i6y1s/FhFaiPMC
aiMmQDGyz6AUZ/mAWSzFTIJnxUD1wrb3vxU2RIbXYLGUm7Q+dDrxhHEQ110cCTxP
m2uO4ahJ5ILiw0D9ytYaLHpJse1ozhTPHityYzj7A468FPUqYa00RgUxRz54XRbM
m3Nk+wjGR0yiY3IoNWpeVRWxGTV7jREbl0gDrh01ASNybsHuOSFHFOjrROm/vS2O
03FqWCbgDdFafbkSa4UvXw7Zhy1qBV8avl3ZZ9Xi6VI9srDBjjnJIgZYA10/c154
qSgm+VN0MrfTx4LZH2iEwKUFPK9DLj8sbLhDohwrpuoXVa3jYjaEcvmN9UEPlOCh
Z5GjeDTRDk+QA/Y+TG/+2/IBe9rhlAn5h937jdj7gXt44O5e33WEQRCcWSdKw25f
6br5MW6iWnXHKCvMXq6drUS8XXQvJb/nQoo1idzuBqofbdEkAvjrkO7Ilo2VALmI
mB/oO2v4vCiu/pyCCq39PtpSQtkmV/Omnz45AebpzREXXZxOnky6ZsXYZGOxYfHm
cqqOIxQRf9xuxYqV15JvCG61DslSwst7oASfMW7eBN30zmaQd3xALVNr5Ch8uvij
ko5scJFvWNr2MvJjeZq8JMDkMS1O26lP9h4Mqpb0Odk4sZ+sTf6dhNfcG16IqsmM
80f5wl05HdfuBHmSPPt1
=j6tg
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
