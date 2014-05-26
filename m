From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] drm/nouveau: disable caching for VRAM BOs on ARM
Date: Mon, 26 May 2014 09:45:56 +0300
Message-ID: <5382E324.5090108@nvidia.com>
References: <1400492771-9746-1-git-send-email-acourbot@nvidia.com>
 <1400493433.8467.24.camel@weser.hi.pengutronix.de>
 <5379D7A0.3050509@nvidia.com>
 <1400494582.8467.28.camel@weser.hi.pengutronix.de>
 <CAAVeFuLKTjaZPSxNSK3nEG+XK+mMmPDDq85qMF-EHp3bGwVJYA@mail.gmail.com>
 <1400837055.4921.4.camel@weser.hi.pengutronix.de>
 <537F1853.7050800@nvidia.com>
 <1400839186.4921.17.camel@weser.hi.pengutronix.de>
 <537F5DED.8050702@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <537F5DED.8050702-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 23.05.2014 17:40, Alex Courbot wrote:
> On 05/23/2014 06:59 PM, Lucas Stach wrote:
> So after checking with more knowledgeable people, it turns out this is 
> the expected behavior on ARM and BAR regions should be mapped uncached 
> on GK20A. All the more reasons to avoid using the BAR at all.

This is actually specific to Tegra.

>> You may want to make yourself aware of all the quirks required for
>> sharing memory between the GPU and CPU on an ARM host. I think there are
>> far more involved than what you see now and writing an replacement for
>> TTM will not be an easy task.
>>
>> Doing away with the concept of two memory areas will not get you to a
>> single unified address space. You would have to deal with things like
>> not being able to change the caching state of pages in the systems
>> lowmem yourself. You will still have to deal with remapping pages that
>> aren't currently visible to the CPU (ok this is not an issue on Jetson
>> right now as it only has 2GB of RAM), because it's in systems highmem,
>> or even in a different LPAE area.
>>
>> You really want to be sure you are aware of all the consequences of
>> this, before considering this task.
> 
> Yep, that's why I am seeking advice here. My first hope is that with a 
> few tweaks we will be able to keep using TTM and the current nouveau_bo 
> implementation. But unless I missed something this is not going to be easy.
> 
> We can also use something like the patch I originally sent to make it 
> work, although not with good performance, on GK20A. Not very graceful, 
> but it will allow applications to run.
> 
> In the long run though, we will want to achieve better performance, and 
> it seems like a BO implementation targeted at UMA devices would also be 
> beneficial to quite a few desktop GPUs. So as tricky as it may be I'm 
> interested in gathering thoughts and why not giving it a first try with 
> GK20A, even if it imposes some limitations like having buffers in lowmem 
> in a first time (we can probably live with this one for a short while, 
> and 64 bits will also be coming to the rescue :))

I don't think lowmem or LPAE is any problem, if the memory manager is
designed with that in mind. Vast majority of the buffers kernel
allocates do not need to be touched in kernel space.

Actually I can't think of any buffers that we allocate on behalf of user
space that would need to be permanently mapped also to kernel. In case
or relocs only push buffer needs to be temporarily mapped to kernel.

Ultimately even relocs are not necessary if we expose GPU virtual
addresses directly to user space. But that's another topic.

Terje
