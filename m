From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dynamically calculate pll_d parameters
Date: Tue, 18 Dec 2012 07:58:57 +0100
Message-ID: <20121218065857.GA5151@avionic-0098.adnet.avionic-design.de>
References: <1355767103-5303-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1355767103-5303-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 17, 2012 at 06:58:23PM +0100, Lucas Stach wrote:
[...]
> +static int tegra20_plld_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	struct clk_tegra *c = to_clk_tegra(hw);
> +	unsigned long input_rate = parent_rate;
> +	u64 n = 0;
> +	int m_max, m_min, m = 0;
> +	u32 val, rem = 0;
> +	u8 cpcon = 0;
> +
> +	m_max = input_rate / c->u.pll.cf_min;
> +	m_min = (input_rate / c->u.pll.cf_max) + 1;
> +
> +	for (m = m_min; m <= m_max; m++) {
> +		n = (u64)rate * m;
> +		rem = do_div(n, input_rate);
> +		if (!rem)
> +			break;
> +	}
> +
> +	if (rem)
> +		return -EINVAL;

This code is common to both .round_rate() and .set_rate() so maybe you
should factor it out.

> +
> +	c->mul = n;
> +	c->div = n;
> +
> +	val = clk_readl(c->reg + PLL_BASE);
> +	val &= ~(PLL_BASE_DIVP_MASK | PLL_BASE_DIVN_MASK |
> +		 PLL_BASE_DIVM_MASK);
> +	val |= (m << PLL_BASE_DIVM_SHIFT) | (n << PLL_BASE_DIVN_SHIFT);
> +	clk_writel(val, c->reg + PLL_BASE);
> +
> +	if (n <= 50)
> +		cpcon = 2;
> +	else if (n <= 300)
> +		cpcon = 4;
> +	else if (n <= 600)
> +		cpcon = 8;
> +	else if (n <= 1000)
> +		cpcon = 12;
> +
> +	val = clk_readl(c->reg + PLL_MISC(c));
> +	val &= ~PLL_MISC_CPCON_MASK;
> +	val |= cpcon << PLL_MISC_CPCON_SHIFT;
> +	clk_writel(val, c->reg + PLL_MISC(c));
> +
> +

There's a gratuitous blank line here.

Other than that this algorithm looks pretty much like what I came up
with in an earlier prototype. One difference is that I used an
additional outer loop for the p-divider. Taking that into account should
allow even more frequencies to be matched.

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ0BQxAAoJEN0jrNd/PrOhnqMQAJ0lfIOs5O1ACApKlzH9Ovr9
mAmgacMhKj+P9WQCn/4rxhmPyc/Fgp21K30zsKZNtX5I61wZfmr/8coY5b2Yjpn6
UHOl78HtI/KBeEkgvknMMEBhlHe+Sxdf35eM009+rpTlt/9fkqq6gMrUuZ159gBc
gh2tOIHzx5veg4ACgiW9GgH0OP3OAe88Eanx37MfZkVhd92OC84DBOiQ0UvUUCDv
LcAwibrmmiG1LXdqSckXrByAGcZiENRSb9NRN0P6/3rryAa6rruv2R/B9cp3Ob9e
qiACikWTrpQjXsSjwLqXsXsa4EQeEFDlK7ysTD2pTxy+OTMGmT68QeXb6oeKBF8P
iBcUkRaXep6O6yejRYHEESDRyTI01tTQjmG0pV97MMiuEyI3KHbaGndYUB1WYspE
GyoyNfyFtGeuLXx8Zxn5Qdkn+iExEub1UjzFBtAgeZYrC+e4rwT/gj/FixXBqQen
ADU1uqPBCq8/dOFDEujSCrc8PwRXO8Z9blg7wOW9vVylulTpdHHUTJAERWfKgHWI
KRhaFzXML4cZ2K2vDwbj79smtJBREUjDq79I+bSaHzZzf2XWbgqyuom8GTA+RMxD
hFPL+1AnrCr4g1saqgs1NUBdYlpsP+JvVOCES0KsfMHSO6RdCXVKO9g0ZTNorS7P
l0Iwd4xWnmk513ENTzpq
=DT/W
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
