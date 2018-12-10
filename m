From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RESEND PATCH 2/2] clk: tegra30: Use Tegra CPU powergate helper function
Date: Mon, 10 Dec 2018 11:10:38 -0800
Message-ID: <154446903833.17204.13305750659921013123@swboyd.mtv.corp.google.com>
References: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com> <1543832921-11661-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543832921-11661-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Jon Hunter (2018-12-03 02:28:41)
> Rather than using the tegra_powergate_is_powered() function for
> determining if a CPU is powered, use the tegra_pmc_cpu_is_powered()
> instead which was created to get the CPU power status. Internally
> tegra_pmc_cpu_is_powered() calls tegra_powergate_is_powered() and so
> is equivalent.
>=20
> The Tegra30 clock driver is the only public user of
> tegra_powergate_is_powered() and so by updating the Tegra30 clock
> driver to use tegra_pmc_cpu_is_powered(), we can then make
> tegra_powergate_is_powered() a non-public function.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next
