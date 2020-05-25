From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
Date: Mon, 25 May 2020 23:52:30 +0200
Message-ID: <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com> <20200515145311.1580134-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-8-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 15, 2020 at 4:53 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>
> ----------------------------------------------------------------
> memory: tegra: Changes for v5.8-rc1
>
> Contains a few cleanup patches and an implementation to scale the EMC
> frequency on Tegra210 systems.

I don't mind taking the memory driver patches, but it seems odd that this
pull request has so many drivers/clk changes but does not mention that
in the pull request, and does not Cc the clk maintainers or include Acks
from them.

I would assume that the reason for this is that you have based
the memory controller changes on a branch that was already
accepted by the clk maintainers in to their tree, but when you do that
please be more explicit so I know what is going on.

Waiting for clarification before I can pull this.

      Arnd

> Dmitry Osipenko (9):
>       dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
>       clk: tegra: Add custom CCLK implementation
>       clk: tegra: pll: Add pre/post rate-change hooks
>       clk: tegra: cclk: Add helpers for handling PLLX rate changes
>       clk: tegra20: Use custom CCLK implementation
>       clk: tegra30: Use custom CCLK implementation

> Joseph Lo (7):
>       dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
>       clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
>       clk: tegra: Export functions for EMC clock scaling
>       clk: tegra: Implement Tegra210 EMC clock
>       clk: tegra: Remove the old emc_mux clock for Tegra210
