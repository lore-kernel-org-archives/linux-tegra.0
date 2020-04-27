From: Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Ensure that clock is enabled
 during of DMA synchronization
Date: Mon, 27 Apr 2020 21:35:43 +0530
Message-ID: <20200427160543.GH56386@vkoul-mobl.Dlink>
References: <20200426190835.21950-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200426190835.21950-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 26-04-20, 22:08, Dmitry Osipenko wrote:
> DMA synchronization hook checks whether interrupt is raised by testing
> corresponding bit in a hardware status register, and thus, clock should
> be enabled in this case, otherwise CPU may hang if synchronization is
> invoked while Runtime PM is in suspended state. This patch resumes the RPM
> during of the DMA synchronization process in order to avoid potential
> problems. It is a minor clean up of a previous commit, no real problem is
> fixed by this patch because currently RPM is always in a resumed state
> while DMA is synchronized, although this may change in the future.

Applied, thanks

-- 
~Vinod
