From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 12/20] clk: tegra: pll: Add specialized logic for T210
Date: Thu, 7 May 2015 17:11:11 +0200
Message-ID: <20150507151108.GA25866@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-13-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430757460-9478-13-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2015 at 12:37:32PM -0400, Rhyland Klein wrote:
[...]
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
[...]
> +struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
> +			const char *parent_name, void __iomem *clk_base,
> +			void __iomem *pmc, unsigned long flags,
> +			struct tegra_clk_pll_params *pll_params,
> +			spinlock_t *lock)
> +{
> +	struct tegra_clk_pll *pll;
> +	struct clk *clk, *parent;
> +	unsigned long parent_rate;
> +	u32 val, val_iddq;

These two variables don't seem to be used.

Thierry

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVS4CJAAoJEN0jrNd/PrOhnm0P/ifjf9+FNMbUqXeey+S9uahJ
p6/fXQJNxGXoABCy0N28hb0XEMCRKLMYKYXH/Uzdz5dFIgqFOt0iCgifVhZsQlpj
yRApxkokzKK9NZ8lgQfsXBCCY3SOHELzHOzTTf7nB47UWXEKodIxjfrWzgvBdfg4
MisnsBpxjubHVxZS43Y+EYuB963t49/5UORjux9b7PKwUkpnAnt/44aC3+Pfl6Lq
8uKb1g5pEt6wGkMyLHfUL04JV6buGfA272VDYGnguYc9la82FsGMDFvE30V9Q52F
CztjkeqIm2LxjhCaoHqoDnyWpGD4WVBh102+eh4XvuaPZJ9jsmOFQVf/VFgrfbhN
rnR68ZW/3AfQcSgi+eO+hpGlpldzXS/AcdOz0/YOs764RF2HyLYI/mKQ/YMSnaFd
Ix2KopM0eht/jtmkBm2f3DmTVMWKQDeEj7w/LrK9jF7o7J0a+nBcr9HmOGrYvuTh
qGOy4fx1iko3r6xB035BEpL9WqXPgyiqKMc34dfQ1HPl3R/uF/9/mSy4ZvebDdI6
0p+LERXbr82rzu+KXyTHQPvpTDR6Iy65t+eKFU9s0rB6KJeyg0pILvr5fiFRvC0y
uHBvKkQobzCuanWK2RF0AHQaPXq9dU+h8oljV9iQb1qAu2gfSG9olzNb4kU/9o06
1u6grImE0IGB6BN1lUf8
=xIGI
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
