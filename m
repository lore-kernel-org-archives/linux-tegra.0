From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 19/21] clk: tegra: Add Super Gen5 Logic
Date: Thu, 14 May 2015 12:37:24 -0700
Message-ID: <CANLzEkvUAhXCCvtdHEfmJGONkzNu_dBHj1UUm6Et93kXV1Mz0g@mail.gmail.com>
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
> ---
> v2:
>   - Fixed sclk divider address (0x370 -> 0x2c)
>
>  drivers/clk/tegra/Makefile               |    1 +
>  drivers/clk/tegra/clk-tegra-super-gen5.c |  150 ++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h                  |    3 +
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/clk/tegra/clk-tegra-super-gen5.c

I've diffed clk-tegra-super-gen5.c and the existing
clk-tegra-super-gen4.c, and there's a lot of code duplication here.
They're the same pair of functions, with several small changes. Since
the idea behind pulling out the super clock initialization into a
common file was to reuse the same init, could we extend the super-gen4
file (rename if you have to) to support both gens instead?

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
