From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 3 Nov 2015 11:06:12 +0000
Message-ID: <56389524.6090300@nvidia.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-3-git-send-email-jonathanh@nvidia.com>
 <CAHp75VcJOxE9iwBJvhp6-TjuF85rLYT4O2F-wHNvDxQpEpMiGg@mail.gmail.com>
 <56378DB1.4020107@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56378DB1.4020107-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 02/11/15 16:22, Jon Hunter wrote:
> On 29/10/15 21:03, Andy Shevchenko wrote:
>> On Fri, Oct 16, 2015 at 10:35 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> Add support for the Tegra210 Audio DMA controller that is used for
>>> transferring data between system memory and the Audio sub-system.
>>> The driver only supports cyclic transfers because this is being solely
>>> used for audio.
>>>
>>> This driver is based upon the work by Dara Ramesh <dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

[snip]

>>> +static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
>>> +{
>>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>>> +       int ret;
>>> +
>>> +       ret = pm_runtime_get_sync(tdc2dev(tdc));
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       dma_cookie_init(&tdc->vc.chan);
>>> +       tdc->sconfig_valid = false;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void tegra_adma_free_chan_resources(struct dma_chan *dc)
>>> +{
>>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>>> +
>>> +       if (tdc->desc)
>>> +               tegra_adma_terminate_all(dc);
>>
>> Seems after Lars' patchset be merged this will become redundant.
>> And you may call this unconditionally of course.
> 
> Ok.
> 
>>> +
>>> +       tdc->sconfig_valid = false;
>>> +       vchan_free_chan_resources(&tdc->vc);
>>> +
>>> +       pm_runtime_put(tdc2dev(tdc));
>>
>> pm_runtime_get_sync() in alloc() till pm_runtime_put() in free() seems
>> too much to cover in time. Imagine if user allocates resources, but
>> will never use them. How possible to suspend device?
> 
> In the current use-case (for audio) the dma channel is allocated and
> freed everytime audio is started and stopped. However, if audio is
> active at the time of suspend then yes it would block. May be I can move
> this to the start/stop of the ADMA.

I have been looking at this and although I could potentially improve
this from a power perspective, I would need to ensure I handle all
potential races (ie between interrupts and turning off clocks). It is
do-able, but for now I would prefer to leave as is. The rationale being
that the sole purpose of the DMA is for audio and in the current use
case the DMA channels are acquired and freed when audio is started and
stopped.

I have also looked at a few other DMA drivers and several all seem to do
the same. That is turn on clocks in allocate and turn them off in the free.

Cheers
Jon
