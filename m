From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2] clk: tegra: Return the exact clock rate from clk_round_rate
Date: Tue, 16 Oct 2018 15:47:11 -0700
Message-ID: <153973003125.5275.211113451006447179@swboyd.mtv.corp.google.com>
References: <20180925214940.15188-1-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925214940.15188-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Yang <decatf@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Robert Yang (2018-09-25 14:49:40)
> The current behavior is that clk_round_rate would return the same clock
> rate passed to it for valid PLL configurations. This change will return
> the exact rate the PLL will provide in accordance with clk API.
> =

> Signed-off-by: Robert Yang <decatf@gmail.com>
> ---

I'm waiting for someone from Nvidia/Tegra background to review this
change.
