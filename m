From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V1] dmaengine: tegra: add dma driver
Date: Mon, 23 Apr 2012 17:53:39 +0530
Message-ID: <1335183819.31825.110.camel@vkoul-udesk3>
References: <1334912896-4614-1-git-send-email-ldewangan@nvidia.com>
	 <1334920487.31825.98.camel@vkoul-udesk3>  <4F9153AF.7020901@nvidia.com>
	 <1335170491.31825.104.camel@vkoul-udesk3>  <4F95483F.5020005@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F95483F.5020005-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rmk <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2012-04-23 at 17:47 +0530, Laxman Dewangan wrote:
> Hi Russell,
> On Monday 23 April 2012 02:11 PM, Vinod Koul wrote:
> > On Fri, 2012-04-20 at 17:46 +0530, Laxman Dewangan wrote:
> >> Thanks Vinod for quick review.
> > Since I was on vacation, I hadn't noticed Russell has already sent the
> > patches for omap dma support.
> > http://permalink.gmane.org/gmane.linux.ports.arm.omap/75034
> >
> > It would be nice if both the efforts are coordinated.
> >
> > Btw I like the virtual channel support introduced by Russell
> >
> 
> Can you please point me the virtual channel related change? I am not 
> able to locate this like search for function vchan_* ().
> My driver is also on same line but not used vchan_* and also having 
> support for cyclic transfer.
See the patch 3/8 in this series


-- 
~Vinod
