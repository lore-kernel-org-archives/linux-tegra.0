From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 02/13] drm/tegra: Add helper functions for setting up
 DPAUX pads
Date: Fri, 17 Jun 2016 18:11:38 +0200
Message-ID: <20160617161138.GC27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1980073429=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1466165027-17917-3-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1980073429==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:36PM +0100, Jon Hunter wrote:
> In preparation for adding pinctrl support for the DPAUX pads, add
> helpers functions for configuring the pads and controlling the power
> for the pads.
>=20
> Please note that although a simple if-statement could be used instead
> of a case statement for configuring the pads as there are only two
> possible modes, a case statement is used because when integrating with
> the pinctrl framework, we need to be able to handle invalid modes that
> could be passed.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 75 ++++++++++++++++++++++++++-----------=
------
>  1 file changed, 45 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 0874a7e5b37b..aa3a037fcd3b 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -267,6 +267,45 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *da=
ta)
>  	return ret;
>  }
> =20
> +static void tegra_dpaux_powerdown(struct tegra_dpaux *dpaux, bool enable)
> +{
> +	u32 value =3D tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
> +
> +	if (enable)
> +		value |=3D DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
> +	else
> +		value &=3D ~DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
> +
> +	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
> +}

I'd like for this to be two functions without the boolean parameter. The
reason is that without looking at the implementation there's no way to
understand what the meaning of true and false is. If instead you call
this:

	static void tegra_dpaux_pad_power_down(struct tegra_dpaux *dpaux)
	{
		...
	}

and

	static void tegra_dpaux_pad_power_up(struct tegra_dpaux *dpaux)
	{
		...
	}

you can easily deduce from the name what's going on.

> +static int tegra_dpaux_config(struct tegra_dpaux *dpaux, int function)

Can function not be unsigned?

Thierry

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCE4AAoJEN0jrNd/PrOhP0UQAJ32riW1d8L3fg7oZpPdDyaV
BeAEEIClUC1XmNI3ibaHBV6/9FfuKzaEtdJztOX4N09C2c+Gkj+LMOhkOcSGWhmy
Y8m34LGX86F5eMsbPWWPmiu630bq8kv2HL5Q9jneWB62gimI9Rf2Edyzi7ZXx4xQ
mGIHV4wCgW1JZBKU4L5B10807jIY6FQl5HEaEtNjwJhw68TKxjTIPYL0TYUi7Lai
2GsaQs6A+TRthUkQpzGLPxt2b9dsQef6bpHlcHQIQ1m1cc66nmHLVjN/SfDjfAj3
qFgzVAIvMLZ3rmMNOY1KkJ9ghF54K+1Mx+VVubeWBLK+Ezn69EA/PXc3caabhmx7
sU9DOU7DzIUtfRAFc7Pbo73bGBeJ+vXZONwa9jrBwc1nKcKdKEarGgmTN0NF9Nap
0kCHj0k21CytNcSZRquFI2aIbd/0fNemzIeLAQBracXER0egl3qC59ddUjNcJx8X
OdnMIlgcF8+069p1/qcZmKYCcBHHo5WWWGRCwLqeWvrlnLdTM0X5Agy5rXwS1FAm
BwqPEQn39z/l0gNX4YRqLqc7MWGBWQxnLa0bYWRRcq16y9H8qxT/C67uPO3Ij/op
U9Xv4L5OEpVuH6yfuxJ8iCcfr0Onq1tVgFguIw13dlpgYBMudI3t6WD4BOLN8/aS
HR4m1ME2eedBN54EjIyC
=Rr8o
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--

--===============1980073429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1980073429==--
