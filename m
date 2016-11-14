From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: tegra210-adma: convert TEGRA210_ADMA from bool to
 tristate
Date: Mon, 14 Nov 2016 09:11:44 +0530
Message-ID: <20161114034144.GN3000@localhost>
References: <20161022222510.11373-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161022222510.11373-1-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Oct 22, 2016 at 06:25:10PM -0400, Paul Gortmaker wrote:
> This driver currently uses modular infrastructure but is controlled
> by a bool Kconfig.
> 
> There is a general consensus from the DMA reviewers and maintainers
> that "if it can be modular, it should be modular" in order to keep
> the bzImage size under control for multi platform kernels.
> 
> Build tested only.  Also needed some new pm_clk symbols exported
> before this commit is applied to tree in order to avoid modpost
> errors like:
> 
>   ERROR: "pm_clk_add_clk" [drivers/dma/tegra210-adma.ko] undefined!
>   ERROR: "pm_clk_create" [drivers/dma/tegra210-adma.ko] undefined!
>   ERROR: "pm_clk_destroy" [drivers/dma/tegra210-adma.ko] undefined!
>   ERROR: "pm_clk_suspend" [drivers/dma/tegra210-adma.ko] undefined!
>   ERROR: "pm_clk_resume" [drivers/dma/tegra210-adma.ko] undefined!
> 
> These were added as exports in the v4.8-rc1 merge window.

Applied, thanks

-- 
~Vinod
