From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [RFC] drm/nouveau: disable caching for VRAM BOs on ARM
Date: Tue, 27 May 2014 11:42:16 +0900
Message-ID: <CAAVeFuJNXH+EN6XekdfKnEzbz8n=LFSQBpKKbiOgsQ3cRyXrtw@mail.gmail.com>
References: <1400492771-9746-1-git-send-email-acourbot@nvidia.com>
 <1400493433.8467.24.camel@weser.hi.pengutronix.de> <5379D7A0.3050509@nvidia.com>
 <1400494582.8467.28.camel@weser.hi.pengutronix.de> <CAAVeFuLKTjaZPSxNSK3nEG+XK+mMmPDDq85qMF-EHp3bGwVJYA@mail.gmail.com>
 <1400837055.4921.4.camel@weser.hi.pengutronix.de> <537F1853.7050800@nvidia.com>
 <1400839186.4921.17.camel@weser.hi.pengutronix.de> <537F5DED.8050702@nvidia.com>
 <5382E324.5090108@nvidia.com> <1401096095.4829.16.camel@weser.hi.pengutronix.de>
 <CAAVeFuKfPKZy81ZO9Wbdtv6gzsCzEF=iJbqOVKPecPqZSnMVUQ@mail.gmail.com> <CACP_E++Kh467jPAWOngBxCyc+tscKgnRDBH+i324a6DQQDV1Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACP_E++Kh467jPAWOngBxCyc+tscKgnRDBH+i324a6DQQDV1Nw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 27, 2014 at 10:07 AM, St=C3=A9phane Marchesin
<stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, May 26, 2014 at 5:02 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>> On Mon, May 26, 2014 at 6:21 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org=
> wrote:
>>> Am Montag, den 26.05.2014, 09:45 +0300 schrieb Terje Bergstr=C3=B6m=
:
>>>> On 23.05.2014 17:40, Alex Courbot wrote:
>>>> > On 05/23/2014 06:59 PM, Lucas Stach wrote:
>>>> > So after checking with more knowledgeable people, it turns out t=
his is
>>>> > the expected behavior on ARM and BAR regions should be mapped un=
cached
>>>> > on GK20A. All the more reasons to avoid using the BAR at all.
>>>>
>>>> This is actually specific to Tegra.
>>>>
>>>> >> You may want to make yourself aware of all the quirks required =
for
>>>> >> sharing memory between the GPU and CPU on an ARM host. I think =
there are
>>>> >> far more involved than what you see now and writing an replacem=
ent for
>>>> >> TTM will not be an easy task.
>>>> >>
>>>> >> Doing away with the concept of two memory areas will not get yo=
u to a
>>>> >> single unified address space. You would have to deal with thing=
s like
>>>> >> not being able to change the caching state of pages in the syst=
ems
>>>> >> lowmem yourself. You will still have to deal with remapping pag=
es that
>>>> >> aren't currently visible to the CPU (ok this is not an issue on=
 Jetson
>>>> >> right now as it only has 2GB of RAM), because it's in systems h=
ighmem,
>>>> >> or even in a different LPAE area.
>>>> >>
>>>> >> You really want to be sure you are aware of all the consequence=
s of
>>>> >> this, before considering this task.
>>>> >
>>>> > Yep, that's why I am seeking advice here. My first hope is that =
with a
>>>> > few tweaks we will be able to keep using TTM and the current nou=
veau_bo
>>>> > implementation. But unless I missed something this is not going =
to be easy.
>>>> >
>>>> > We can also use something like the patch I originally sent to ma=
ke it
>>>> > work, although not with good performance, on GK20A. Not very gra=
ceful,
>>>> > but it will allow applications to run.
>>>> >
>>>> > In the long run though, we will want to achieve better performan=
ce, and
>>>> > it seems like a BO implementation targeted at UMA devices would =
also be
>>>> > beneficial to quite a few desktop GPUs. So as tricky as it may b=
e I'm
>>>> > interested in gathering thoughts and why not giving it a first t=
ry with
>>>> > GK20A, even if it imposes some limitations like having buffers i=
n lowmem
>>>> > in a first time (we can probably live with this one for a short =
while,
>>>> > and 64 bits will also be coming to the rescue :))
>>>>
>>>> I don't think lowmem or LPAE is any problem, if the memory manager=
 is
>>>> designed with that in mind. Vast majority of the buffers kernel
>>>> allocates do not need to be touched in kernel space.
>>>>
>>>> Actually I can't think of any buffers that we allocate on behalf o=
f user
>>>> space that would need to be permanently mapped also to kernel. In =
case
>>>> or relocs only push buffer needs to be temporarily mapped to kerne=
l.
>>>>
>>>> Ultimately even relocs are not necessary if we expose GPU virtual
>>>> addresses directly to user space. But that's another topic.
>>>>
>>> Nouveau already exposes constant virtual addresses to userspace and
>>> skips the pushbuf patching when the presumed offset from userspace =
is
>>> the same as what the kernel thinks it should be.
>>>
>>> The problem with lowmem on ARM is that you can't unmap those pages =
from
>>> the kernel cached mapping. So if you alloc a page, give it to users=
pace
>>> and userspace decides to map the page WC you just produced a confli=
cting
>>> mapping, which may yield undefined results on ARMv7. You may think =
this
>>> is not a problem as you are not touching the kernel cached mapping,=
 but
>>> in fact it is. The CPUs prefetcher can still access this mapping.
>>
>> Why would this memory be mapped into the kernel?
>
> On ARM the kernel keeps a linear mapping of lowmem using sections
> (ARM's version of huge pages). This is always cached, and because the
> sections are not 4k, it's a pain to remove parts of it. See
> arch/arm/mm/mmu.c

Ah, are we talking about the directly-mapped low memory region
starting at PAGE_OFFSET? Ok, it makes sense now, thanks.

But it seems to me that such different mappings can also happen in
many other scenarios as well, don't they? How is the issue handled in
these cases?
