From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: introduce CPU cache flushing macro
Date: Fri, 23 May 2014 15:58:30 +0900
Message-ID: <CAAVeFu+TaRahuv+7e90W5ZOH86jT4Nt3k0O24dZKX-DgQQqp5w@mail.gmail.com>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-5-git-send-email-acourbot@nvidia.com> <20140519090202.GC7138@ulmo>
 <1400491331.8467.8.camel@weser.hi.pengutronix.de> <20140519100316.GE7138@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140519100316.GE7138@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 19, 2014 at 7:03 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, May 19, 2014 at 11:22:11AM +0200, Lucas Stach wrote:
>> Am Montag, den 19.05.2014, 11:02 +0200 schrieb Thierry Reding:
>> > On Mon, May 19, 2014 at 04:10:58PM +0900, Alexandre Courbot wrote:
>> > > Some architectures (e.g. ARM) need the CPU buffers to be explicitely
>> > > flushed for a memory write to take effect. Not doing so results in
>> > > synchronization issues, especially after writing to BOs.
>> >
>> > It seems to me that the above is generally true for all architectures,
>> > not just ARM.
>> >
>> No, on PCI coherent arches, like x86 and some PowerPCs, the GPU will
>> snoop the CPU caches and therefore an explicit cache flush is not
>> required.
>
> I was criticizing the wording in the commit message. Perhaps it could be
> enhanced with what you just said.
>
>> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > [...]
>> > > index 0886f47e5244..b9c9729c5733 100644
>> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > > @@ -437,8 +437,10 @@ nouveau_bo_wr16(struct nouveau_bo *nvbo, unsigned index, u16 val)
>> > >   mem = &mem[index];
>> > >   if (is_iomem)
>> > >           iowrite16_native(val, (void __force __iomem *)mem);
>> > > - else
>> > > + else {
>> > >           *mem = val;
>> > > +         nv_cpu_cache_flush_area(mem, 2);
>> > > + }
>> > >  }
>> > >
>> > >  u32
>> > > @@ -461,8 +463,10 @@ nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val)
>> > >   mem = &mem[index];
>> > >   if (is_iomem)
>> > >           iowrite32_native(val, (void __force __iomem *)mem);
>> > > - else
>> > > + else {
>> > >           *mem = val;
>> > > +         nv_cpu_cache_flush_area(mem, 4);
>> > > + }
>> >
>> > This looks rather like a sledgehammer to me. Effectively this turns nvbo
>> > into an uncached buffer. With additional overhead of constantly flushing
>> > caches. Wouldn't it make more sense to locate the places where these are
>> > called and flush the cache after all the writes have completed?
>> >
>> I don't think the explicit flushing for those things makes sense. I
>> think it is a lot more effective to just map the BOs write-combined on
>> PCI non-coherent arches. This way any writes will be buffered. Reads
>> will be slow, but I don't think nouveau is reading back a lot from those
>> buffers.
>> Using the write-combining buffer doesn't need any additional
>> synchronization as it will get flushed on pushbuf kickoff anyways.
>
> Sounds good to me.

I will need to wrap my head around TTM some more to understand how to
do this the right way, but it is true that brute-forcing in-memory BO
mappings to be WC make the addition of nv_cpu_cache_flush_area()
unneeded. Is that the direction we want to take with this?
