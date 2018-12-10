From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RESEND PATCH 1/2] clk: tegra: Fix maximum audio sync clock for Tegra124/210
Date: Mon, 10 Dec 2018 11:10:35 -0800
Message-ID: <154446903563.17204.4474332644824804669@swboyd.mtv.corp.google.com>
References: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Jon Hunter (2018-12-03 02:28:40)
> The maximum frequency supported for I2S on Tegra124 and Tegra210 is
> 24.576MHz (as stated in the Tegra TK1 data sheet for Tegra124 and the
> Jetson TX1 module data sheet for Tegra210). However, the maximum I2S
> frequency is limited to 24MHz because that is the maximum frequency of
> the audio sync clock. Increase the maximum audio sync clock frequency
> to 24.576MHz for Tegra124 and Tegra210 in order to support 24.576MHz
> for I2S.
>=20
> Update the tegra_clk_register_sync_source() function so that it does
> not set the initial rate for the sync clocks and use the clock init
> tables to set the initial rate instead.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next
