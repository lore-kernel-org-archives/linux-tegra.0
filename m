From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] thermal: tegra_soctherm: fix sign bit of temperature
Date: Mon, 7 Mar 2016 09:38:42 +0100
Message-ID: <20160307083842.GC31189@ulmo.nvidia.com>
References: <1456739480-3304-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456739480-3304-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 05:51:20PM +0800, Wei Ni wrote:
> The sign bit of temperature readback is bit 0, not bit 1.
> Change to BIT(0) to fix it.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/thermal/tegra_soctherm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegra_soc=
therm.c
> index 74ea5765938b..136975220c92 100644
> --- a/drivers/thermal/tegra_soctherm.c
> +++ b/drivers/thermal/tegra_soctherm.c
> @@ -57,7 +57,7 @@
>  #define READBACK_VALUE_MASK			0xff00
>  #define READBACK_VALUE_SHIFT			8
>  #define READBACK_ADD_HALF			BIT(7)
> -#define READBACK_NEGATE				BIT(1)
> +#define READBACK_NEGATE				BIT(0)

I haven't found this documented anywhere. The register documentation
indicates that the SOC_THERM_TSENSOR_TEMP1 and SOC_THERM_TSENSOR_TEMP2
registers are in some kind of "temp readback format", but I can't find
any specification of that format. Can you point me at the source for
this information and file an internal bug report so that we can get
the documentation updated?

Thierry

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3T4SAAoJEN0jrNd/PrOhse4QAI/h8xYt9W1wd2XPGKQeqZrX
BuWzqUHYWrRkyPxWfjK7mHSwCvlRJeXbto40iZL5DDvVLjKI8wrB+8s2/5d0YQ5K
s56io8NW9UQVn6WOO7wG2Y+jKLUoFECYrmSKItojVkzqi6IOk+dhMRPcvYH8FhOj
edKX1uDd0IiFH6XsSXEymmrItm6a+Q1t/mhfyqGZAnG0Md/sat1Sic/jKN4hOU9x
5ne18cks4r4mb4xB8IgguVCTXd0ykh8dZ8mDQeiFW9PWoS5jDkPYxDZclS0xkuVU
ZB0W+DXS907i52cQ7KcJZ1ZdQ44dX6Y0VW4N/An7oR5r7SFIC9OiOk4OMFYBdBbK
UpiEr/xxS8qioMRkJKe+F9O7S6DdISvx8ucZWHmCh/5YwuglbU7DWr3bgUQCzSoA
R8D5GMZM6QVLE1hhvCcZAoadyZQOXnDxmDOr49/jvl96fIUHkTCoFjnwxbHfT+Or
ZXhA0Vc4zU9xghUgK4xVPh99Ik8a644RNIhq4YCRRY/5O9WJJ7mVKowk4fmhmsLG
C8fNSab4uWMI82SknMofOSrNriazTnTZRAHMmG4EKI9Oy7iqXrOmGKLVPNlyfD7U
7VdopzHYhSPCIkYjh4Yd/3qPaXn9rHbcQvN+EWjWPuicz9C6AMpMMB6wNNqVScTx
+xZDdoBcOWm3Nic+coGK
=b0j7
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
