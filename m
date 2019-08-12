From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 12/21] cpufreq: tegra124: Add suspend and resume
 support
Date: Mon, 12 Aug 2019 12:07:06 +0200
Message-ID: <20190812100706.GK8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-13-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwbb4r/vLufKlfJs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-13-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rwbb4r/vLufKlfJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:51PM -0700, Sowjanya Komatineni wrote:
> This patch adds suspend and resume pm ops for cpufreq driver.
>=20
> PLLP is the safe clock source for CPU during system suspend and
> resume as PLLP rate is below the CPU Fmax at Vmin.
>=20
> CPUFreq driver suspend switches the CPU clock source to PLLP and
> disables the DFLL clock.
>=20
> During system resume, warmboot code powers up the CPU with PLLP
> clock source. So CPUFreq driver resume enabled DFLL clock and
> switches CPU back to DFLL clock source.
>=20
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 60 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra12=
4-cpufreq.c
> index 4f0c637b3b49..e979a3370988 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -6,6 +6,7 @@
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> =20
>  #include <linux/clk.h>
> +#include <linux/cpufreq.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -128,8 +129,67 @@ static int tegra124_cpufreq_probe(struct platform_de=
vice *pdev)
>  	return ret;
>  }
> =20
> +static int __maybe_unused tegra124_cpufreq_suspend(struct device *dev)
> +{
> +	struct tegra124_cpufreq_priv *priv =3D dev_get_drvdata(dev);
> +	int err;
> +
> +	/*
> +	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
> +	 * use during suspend and resume. So, switch the CPU clock source
> +	 * to PLLP and disable DFLL.
> +	 */
> +	err =3D clk_set_parent(priv->cpu_clk, priv->pllp_clk);
> +	if (err < 0) {
> +		dev_err(dev, "failed to reparent to PLLP: %d\n", err);
> +		return err;
> +	}
> +
> +	/* disable DFLL clock */
> +	clk_disable_unprepare(priv->dfll_clk);

This comment is superfluous since it doesn't explain anything that the
code below doesn't explain already.

Not sure who will end up merging this. If not me, then this is:

Acked-by: Thierry Reding <treding@nvidia.com>

--rwbb4r/vLufKlfJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1ROkoACgkQ3SOs138+
s6EJKQ/+I3cbYEQ/nCqI+FT9m+vu0hLSkyzx0lJlJVnxlgxIi4AJGx6Pb3bXgNy4
LEOQC2nlCzm1Lr9JeKBVpZ/AtP8axsHNXtAffRCITM3nfaXZhLCq1dhCXbf4uobC
RCS8mOavaYc3hiqjb3Kg0V7CsGJ7TbNmAiCv32yIRKt21/vFz4nR+cyEEFZqYmkc
BoCTX1+soYNwseydeRYxzCh619PxkfhENk41LrFlERSmQ7Ao4NVi1kq0FKLANmoi
eY0Z++jK0OBTn74N2txmRuzguQe5UwqC6AAgMAzB7dvBHyFLc8iOJUmrNNL8bqj7
vorJ7UK5f61JX9rEDC8Wq4i3RApb9aEyG+PiCpRTXlMbQOscpIZUnTU7P86DSfBt
OxB1ZF2VZs9m/zoGOOKBPkO6ZpPNGKjjC+W1vhNNcHbB7uKolgABRgqvIK74wUrK
ldM4+ba2hQxur5YU3Nrffaml2KORg2zBXm4YAm0DElONwx4Xtx0eQ1ymX2k9k/Dj
KMiWTNSrN+jXruhyECkO90ogxk/DIzaBkVfieIDTzKYOggXKEo/PNUAepL0Osq7q
IpQ576FFctxafQLakYMk0O89nTJnNtVkAUmdVi1BK2m0vKQclpzlE4w43UcJl3zb
MYbIcsCnKZwWz9QsUmRI76d8JLPKsPiTtFjUopToIkOhSMcVO10=
=xDLq
-----END PGP SIGNATURE-----

--rwbb4r/vLufKlfJs--
