From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 19/20] clk: tegra210: add support for Tegra210 clocks
Date: Thu, 7 May 2015 17:18:12 +0200
Message-ID: <20150507151811.GD25866@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-20-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430757460-9478-20-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2015 at 12:37:39PM -0400, Rhyland Klein wrote:
[...]
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
[...]
> +static void __init tegra210_clock_init(struct device_node *np)
> +{
[...]
> +	tegra_fixed_clk_init(tegra210_clks);
> +	tegra210_pll_init(clk_base, pmc_base);
> +	tegra210_periph_clk_init(clk_base, pmc_base);
> +	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
> +			     tegra210_audio_plls, 2);

Should use ARRAY_SIZE() here as well.

Thierry

--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVS4IzAAoJEN0jrNd/PrOh2y4P+gMnm/dUAC4z8n3egGWdENxH
hbDWkNsvdg/rOVY+nWdoyfWGzb399o4ev2ZSSTVtW7Ec8t8doupCqBrmZ/r7OoIE
/03DN+bRWgc8LtVlw0I4LSadx4bw877tJjYTYqevxrqJQXCQxZvRGs4Us7Y7mxel
PgR6fR0611qQjjyMpShWHFHL7cTkTUa7ROXHGcaazQdlAChHvERFDVPfAOAEp8r4
9tFJOwvZCxFn5ulCgMvM8IN+RKtWlqxffFw1lgg/ZLYAmiI+huLXYyyZZcME6JGz
6afhlI6/136NVBTVAOwru/QLLS0k0VysNUIiLoUf/vgR5kmWvhg/6tbV8DEN4RSA
B+jxYTXmHG+xMnrN4kmsML4qGdrGe7m/7EPHU7e0maROwJb8Lrlvub8f4qBDadZe
bGQKIZmY0SixY3SN8HHDxhhGXjMlr2SNHmAleew02/A3yJjRjjhV6tLv54JcuESt
TOoSBjyYS6bqjNjdInoiUZEmMUV4OJC17K6iUqOgs23e6QHOTVJiPUm897BeukTG
T7V9miB5WGzclNtH7t6a55o4//g/VuKoInPr2pNafp68TqnYqSL6fWNz430DEFFK
CCHV9EosNm5y4nadZ5/AelZVm3I4gRkdDA9qa8ED716X5plQd+eXiCyuXVtMEMAZ
nE7H8jQpedG7UkDc8d74
=4USg
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--
