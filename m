From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: tegra: Fix an infinite loop when clock rate is zero
Date: Tue, 02 Oct 2018 00:35:59 -0700
Message-ID: <153846575952.119890.6094475401652816252@swboyd.mtv.corp.google.com>
References: <20180921220037.16862-1-decatf@gmail.com>
 <153843172633.119890.17243129066234373128@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153843172633.119890.17243129066234373128@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ryang <decatf@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Boyd (2018-10-01 15:08:46)
> Quoting ryang (2018-09-21 15:00:37)
> > Calling clk_set_rate or clk_round_rate will lock up the kernel when the
> > rate is zero. This avoids the infinite loop and uses a slightly more
> > optimized p divider calculation.
> > =

> > Signed-off-by: ryang <decatf@gmail.com>
> =

> Do you have a more proper name? Or you want the author name to show up as
> "ryang"?
> =


I see a v2 on the list, and it looks similar so I'm going to assume this
is superseded now.
