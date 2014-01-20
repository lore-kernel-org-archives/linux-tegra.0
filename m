From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 REPOST3] dma: tegra: add support for Tegra148/124
Date: Mon, 20 Jan 2014 14:36:39 +0530
Message-ID: <20140120090639.GP26823@intel.com>
References: <1389032205-2503-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389032205-2503-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Kunal Agrawal <kunala-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 06, 2014 at 11:16:45AM -0700, Stephen Warren wrote:
> From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra148 introduces a few changes to the APB DMA HW registers. Update the
> driver to cope with them. Tegra124 inherits these changes.
> 
> * The register address stride between DMA channels increases.
> 
> * A new per-channel WCOUNT register is introduced.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Kunal Agrawal <kunala-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [swarren, remove .dts file change, rewrote commit description, removed
> some duplicate/unused code and register IO]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks


--
~Vinod
