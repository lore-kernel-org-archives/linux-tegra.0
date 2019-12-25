From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Date: Wed, 25 Dec 2019 17:57:36 +0000
Message-ID: <20191225175736.GC27497@sirena.org.uk>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2019 at 12:14:34AM +0300, Dmitry Osipenko wrote:
> 21.12.2019 01:26, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
> > through Tegra210 and currently Tegra clock driver does initial parent
> > configuration for audio mclk "clk_out_1" and enables them by default.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > -	clk_disable_unprepare(data->clk_cdev1);
> > -	clk_disable_unprepare(data->clk_pll_a_out0);
> > -	clk_disable_unprepare(data->clk_pll_a);
> > +	if (__clk_is_enabled(data->clk_cdev1))
> > +		clk_disable_unprepare(data->clk_cdev1);

> The root of the problem is that you removed clocks enabling from
> tegra_asoc_utils_init().

> I'm not sure why clocks should be disabled during the rate-changing,
> probably this action is not really needed.

I know nothing about this particular device but this is not that
unusual a restriction for audio hardware, you often can't
robustly reconfigure the clocking for a device while it's active
due to issues in the hardware.  You often see issues with FIFOs
glitching or state machines getting stuck.  This may not be an
issue here but if it's something that's documented as a
requirement it's probably good to pay attention.

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Dow8ACgkQJNaLcl1U
h9CI+gf+NTSVmEXknNylmrROVvkijHFJkHpvx7hDJFGvYsu/qNKP8FkbIRWeKkE1
h1R5yupSd5QDSNRwtOG2Z3ZO5Dv/HYo+FmOIz+XDFNyKI7MU3fr4CkEzwZXcUzKt
GcGGfzcxYPJ8H7f5tbVvNjRHu+DiDvHEFvShhKUbHk7HJYqCrG6eMCfEDHlEkHU5
PkAp309INr7VEQSuch/JBXbvvI0glE66kcLH9CrHVdmrqc7hR8DmCm+49lGBOfIM
Jv1ylQj/Kx52U/zErkRqc9nsAkgJtQVafmwwCFj5SEeJIpCIanlTUXbRFRMkaMBL
5zpR7FZej7V40gjlWEGR0RaT9x6r5Q==
=c7E7
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
