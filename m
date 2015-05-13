From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 19/21] clk: tegra: Add Super Gen5 Logic
Date: Wed, 13 May 2015 13:36:11 -0700
Message-ID: <CANLzEksCya8z7RPuj5yUGJi08DftDisSD2=349LD+pzW=x4RNQ@mail.gmail.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-21-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431451444-23155-21-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> From: Bill Huang <bilhuang@nvidia.com>
>
> Super clock divider control and clock source mux of Tegra210 has changed
> a little against prior SoCs, this patch adds Gen5 logic to address those
> differences.
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>

It looks like Mikko's and Thierry's EMC changes landed since you rebased  :

0c1135f clk: tegra: EMC clock driver depends on EMC driver
dc9fdb6 clk: tegra: Add EMC clock driver

So v5 doesn't apply cleanly anymore. Could you rebase?

> ---
> v2:
>   - Fixed sclk divider address (0x370 -> 0x2c)


-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
