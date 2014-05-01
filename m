From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v3 6/9] drm/nouveau/graph: enable when using
 external firmware
Date: Thu, 1 May 2014 14:59:26 +1000
Message-ID: <CACAvsv4hAzq7HhBZNbcbnE7eKADT_unWuNR2+bJ2swa_S+LnMg@mail.gmail.com>
References: <1398410396-23338-1-git-send-email-acourbot@nvidia.com>
	<1398410396-23338-7-git-send-email-acourbot@nvidia.com>
	<CACAvsv51Ju_ZqJfNU5GzzEmDzf2Fr6Xr_5yGRtfqOQRVTgvDPg@mail.gmail.com>
	<CAAVeFuK7H3zK3CaxYT4MP4pY=r2dF0oojjYHG1DGRf7Sq0TExg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuK7H3zK3CaxYT4MP4pY=r2dF0oojjYHG1DGRf7Sq0TExg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 1, 2014 at 2:53 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Apr 28, 2014 at 11:10 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Apr 25, 2014 at 5:19 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> nvc0_graph_ctor() would only let the graphics engine be enabled if its
>>> oclass has a proper microcode linked to it. This prevents GR from being
>>> enabled at all on chips that rely exclusively on external firmware, even
>>> though such a use-case is valid.
>>>
>>> Relax the conditions enabling the GR engine to also include the case
>>> where an external firmware has also been loaded.
>> I'm happy to take this patch as-is.  I do wonder if we should do
>> something like this though:
>>
>> if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", oclass->fecs.ucode == NULL))
>>
>> Which will automatically switch to external firmware if there's no
>> internal implementation available.
>>
>> Thoughts?  This could be a separate patch even, if preferred.
>
> Sure, that should work. Do you mind if I come with a follow-up patch
> for this so I don't have to re-sent the current patch series? Since
> this is the only comment it received so far.
Yeah that's fine.  I suspect I'll merge this tomorrow, assuming no
further objections are raised.

Ben.

>
> Thanks,
> Alex.
