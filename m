From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND v2] dmaengine: tegra-apb: Support non-flow
 controlled slave configuration
Date: Wed, 29 Nov 2017 19:35:31 +0530
Message-ID: <20171129140531.GG32417@localhost>
References: <20171116171106.25932-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171116171106.25932-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 16, 2017 at 08:11:06PM +0300, Dmitry Osipenko wrote:
> This allows DMA client to issue a non-flow controlled TX. In particular
> it is needed for the fuse driver that reads fuse registers using APBDMA
> to workaround a HW bug that results in hang when CPU and DMA perform
> simultaneous access to fuse peripheral.

Applied, thanks

-- 
~Vinod
