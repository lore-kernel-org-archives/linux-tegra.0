From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5.7] clk: tegra: Fix initial rate for pll_a on Tegra124
Date: Tue, 12 May 2020 16:26:21 -0700
Message-ID: <158932598121.215346.2534633370744131523@swboyd.mtv.corp.google.com>
References: <20200505071655.644773-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200505071655.644773-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-05-05 00:16:55)
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> pll_a_out0 and the I2S clocks are already configured to default to rates
> corresponding to a 44.1 kHz sampling rate, but the pll_a configuration
> was set to a default that is not listed in the frequency table, which
> caused the PLL code to compute an invalid configuration. As a result of
> this invalid configuration, Jetson TK1 fails to resume from suspend.
>=20
> This used to get papered over because the ASoC driver would force audio
> clocks to a 44.1 kHz configuration on boot. However, that's not really
> necessary and was hence removed in commit ff5d18cb04f4 ("ASoC: tegra:
> Enable audio mclk during tegra_asoc_utils_init()").
>=20
> Fix the initial rate for pll_a so that it matches the 44.1 kHz entry in
> the pll_a frequency table.
>=20
> Fixes: ff5d18cb04f4 ("ASoC: tegra: Enable audio mclk during tegra_asoc_ut=
ils_init()")
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Applied to clk-fixes
