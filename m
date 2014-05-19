From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: introduce CPU cache flushing
 macro
Date: Mon, 19 May 2014 12:27:50 +0200
Message-ID: <20140519102750.GI8790@phenom.ffwll.local>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-5-git-send-email-acourbot@nvidia.com>
 <20140519090202.GC7138@ulmo>
 <1400491331.8467.8.camel@weser.hi.pengutronix.de>
 <20140519100316.GE7138@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140519100316.GE7138@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 19, 2014 at 12:03:17PM +0200, Thierry Reding wrote:
> On Mon, May 19, 2014 at 11:22:11AM +0200, Lucas Stach wrote:
> > Am Montag, den 19.05.2014, 11:02 +0200 schrieb Thierry Reding:
> > > On Mon, May 19, 2014 at 04:10:58PM +0900, Alexandre Courbot wrote:
> > > > Some architectures (e.g. ARM) need the CPU buffers to be explicitely
> > > > flushed for a memory write to take effect. Not doing so results in
> > > > synchronization issues, especially after writing to BOs.
> > > 
> > > It seems to me that the above is generally true for all architectures,
> > > not just ARM.
> > > 
> > No, on PCI coherent arches, like x86 and some PowerPCs, the GPU will
> > snoop the CPU caches and therefore an explicit cache flush is not
> > required.
> 
> I was criticizing the wording in the commit message. Perhaps it could be
> enhanced with what you just said.

Shouldn't this be done in the dma mapping layer? I know that i915 does all
the cpu cache flushing itself, but that's because the x86 dma layer
refuses to believe that there are non-coherent platforms on x86. But on
arm it can cope.

This is somewhat important for dma-buf buffer sharing since if the cpu
cache control is done in drivers you must do double-flushing on shared
buffers. Atm you have to do that anyway, but at least this would make it
easier. The other problem is that ttm reinvents half of the dma mapping
functions.

Just my 2 cents.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
