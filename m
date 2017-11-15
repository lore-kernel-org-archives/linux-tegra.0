From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dmaengine: tegra-apb: Support non-flow controlled
 slave configuration
Date: Wed, 15 Nov 2017 21:24:22 +0530
Message-ID: <20171115155422.GN3187@localhost>
References: <20171019221308.18707-1-digetx@gmail.com>
 <57ef35f0-d8fa-5238-901e-11cd9d001e02@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57ef35f0-d8fa-5238-901e-11cd9d001e02-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 14, 2017 at 02:23:07PM +0300, Dmitry Osipenko wrote:
> On 20.10.2017 01:13, Dmitry Osipenko wrote:
> > This allows DMA client to issue a non-flow controlled TX. In particular
> > it is needed for the fuse driver that reads fuse registers using APBDMA
> > to workaround a HW bug that results in hang when CPU and DMA perform
> > simultaneous access to fuse peripheral.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Vinod, are you going to apply this patch for 4.15?

Sorry I dont seem to have this one in my queue and dont see it applied, not
sure why. Can you guys resend please

-- 
~Vinod
