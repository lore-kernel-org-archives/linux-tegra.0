From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] dmaengine: tegra-apb: Really fix runtime-pm usage
Date: Fri, 30 Jun 2017 11:14:31 +0530
Message-ID: <20170630054431.GP19154@localhost>
References: <1496753369-5356-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496753369-5356-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 06, 2017 at 01:49:29PM +0100, Jon Hunter wrote:
> Commit edd3bdbe9db1 ("dmaengine: tegra-apb: Correct runtime-pm usage")
> added pm_runtime_get/put() calls to the tegra-apb DMA system suspend
> callbacks. Runtime PM is disabled during system suspend and so these
> APIs cannot be used. Fix the suspend handling for the tegra-apb DMA by
> moving the save and restore of the DMA register context into the
> runtime PM suspend and resume callbacks, and then use the
> pm_runtime_force_suspend/resume() APIs to invoke the runtime PM
> callbacks during system suspend.

Applied, thanks

-- 
~Vinod
