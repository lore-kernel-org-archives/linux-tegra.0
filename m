From: Laura Abbott <labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] dma-buf: Rename dma-ops to prevent conflict with
 kunmap_atomic macro
Date: Wed, 19 Apr 2017 17:28:46 -0700
Message-ID: <69283988-3a6b-fba3-529a-d5ad70eda32b@redhat.com>
References: <1492630570-879-1-git-send-email-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492630570-879-1-git-send-email-logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh@linuxfo>
List-Id: linux-tegra@vger.kernel.org

On 04/19/2017 12:36 PM, Logan Gunthorpe wrote:
> Seeing the kunmap_atomic dma_buf_ops share the same name with a macro
> in highmem.h, the former can be aliased if any dma-buf user includes
> that header.
> 
> I'm personally trying to include highmem.h inside scatterlist.h and this
> breaks the dma-buf code proper.
> 
> Christoph Hellwig suggested [1] renaming it and pushing this patch ASAP.
> 
> To maintain consistency I've renamed all four of kmap* and kunmap* to be
> map* and unmap*. (Even though only kmap_atomic presently conflicts.)
> 
> [1] https://www.spinics.net/lists/target-devel/msg15070.html
> 
> Signed-off-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> ---
> 
> Changes since v1:
> 
> - Added the missing tegra driver (noticed by kbuild robot)
> - Rebased off of drm-intel-next to get the i915 selftest that is new
> - Fixed nits Sinclair pointed out.
> 
>   drivers/dma-buf/dma-buf.c                      | 16 ++++++++--------
>   drivers/gpu/drm/armada/armada_gem.c            |  8 ++++----
>   drivers/gpu/drm/drm_prime.c                    |  8 ++++----
>   drivers/gpu/drm/i915/i915_gem_dmabuf.c         |  8 ++++----
>   drivers/gpu/drm/i915/selftests/mock_dmabuf.c   |  8 ++++----
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c      |  8 ++++----
>   drivers/gpu/drm/tegra/gem.c                    |  8 ++++----
>   drivers/gpu/drm/udl/udl_dmabuf.c               |  8 ++++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_prime.c          |  8 ++++----
>   drivers/media/v4l2-core/videobuf2-dma-contig.c |  4 ++--
>   drivers/media/v4l2-core/videobuf2-dma-sg.c     |  4 ++--
>   drivers/media/v4l2-core/videobuf2-vmalloc.c    |  4 ++--
>   drivers/staging/android/ion/ion.c              |  8 ++++----
>   include/linux/dma-buf.h                        | 22 +++++++++++-----------
>   14 files changed, 61 insertions(+), 61 deletions(-)
> 

For Ion,

Acked-by: Laura Abbott <labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

I did some major Ion refactoring but I don't think this
will conflict.

Thanks,
Laura
