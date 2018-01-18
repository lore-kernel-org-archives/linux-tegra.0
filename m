From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/vgem: flush page during page fault
Date: Thu, 18 Jan 2018 08:38:00 +0100
Message-ID: <CAKMK7uGV=JxX4BB2OTPAWRVR8ugytxnr8+5JVE1SRZELNnuwhA@mail.gmail.com>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-4-gurchetansingh@chromium.org> <20180117083928.GH2759@phenom.ffwll.local>
 <CAAfnVBkxhEec1U8Ck4UyMXjwKvSFJs-bpip5K-7sbB51TNK0bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfnVBkxhEec1U8Ck4UyMXjwKvSFJs-bpip5K-7sbB51TNK0bA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 17, 2018 at 11:49 PM, Gurchetan Singh
<gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> On Wed, Jan 17, 2018 at 12:39 AM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
>>
>> On Tue, Jan 16, 2018 at 04:35:59PM -0800, Gurchetan Singh wrote:
>> > This is required to use buffers allocated by vgem on AMD and ARM
>> > devices.
>> > We're experiencing a case where eviction of the cache races with
>> > userspace
>> > writes. To fix this, flush the cache after retrieving a page.
>> >
>> > Signed-off-by: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > ---
>> >  drivers/gpu/drm/vgem/vgem_drv.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
>> > b/drivers/gpu/drm/vgem/vgem_drv.c
>> > index 35bfdfb746a7..fb263969f02d 100644
>> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
>> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
>> > @@ -112,6 +112,7 @@ static int vgem_gem_fault(struct vm_fault *vmf)
>> >                               break;
>> >               }
>> >
>> > +             drm_flush_pages(obj->base.dev->dev, &page, 1);
>>
>> Uh ... what exactly are you doing?
>>
>> Asking because the entire "who's responsible for coherency" story is
>> entirely undefined still when doing buffer sharing :-/ What is clear is
>> that currently vgem entirely ignores this (there's not
>> begin/end_cpu_access callback), mostly because the shared dma-buf support
>> in drm_prime.c also entirely ignores this.
>
>
>
> This patch isn't trying to address the case of a dma-buf imported into vgem.
> It's trying to address the case when a buffer is created by
> vgem_gem_dumb_create, mapped by vgem_gem_dumb_map and then accessed by user
> space.  Since the page retrieved by shmem_read_mapping_page during the page
> fault may still be in the cache, we're experiencing incorrect data in
> buffer.  Here's the test case we're running:
>
> https://chromium.googlesource.com/chromiumos/platform/drm-tests/+/master/vgem_test.c

404s over here (Internal url?).

> It fails on line 210 on AMD and ARM devices (not Intel though).

So you _do_ import it on the other device driver as a dma-buf (and
export it from vgem)? Because coherency isn't well-defined for dma-buf
no matter who the exporter/importer is.

>> And doing a one-time only
>> flushing in your fault handler is definitely not going to fix this (at
>> least not if you do anything else than one-shot uploads).
>
>
> There used to be a be vgem_gem_get_pages function, but that's been removed.
> I don't know where else to flush in this situation.

dma_buf begin/end cpu access. Even exposed as an ioctl when you're
using the dma-buf mmap stuff. Vgem doesn't have that, which means
as-is the dumb mmap support of vgem can't really support this if you
want to do explicit flushing.

What would work is uncached/writecombine/coherent dma memory. But then
we're in the middle of the entire
"who's responsible.
-Daniel

>
>>
>> -Daniel
>>
>> >       }
>> >       return ret;
>> >  }
>> > --
>> > 2.13.5
>> >
>> > _______________________________________________
>> > dri-devel mailing list
>> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>
>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
