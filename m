From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
Date: Tue, 30 Jun 2020 13:22:29 +0530
Message-ID: <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ftadyrec.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 12:25 PM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
> Thank you for explaining detail at off-list mail.
>
> Your issue happen on (C) case, and you are tring to solve it.
> It is easy to understand if it was indicated at log area.
> I have imagined other system from "multiple CPU/Codec support".
>
>          (A)    (B)
>          FE <-> BE
>
>          (C)    (D)
>          BE <-> BE
>
>>> I'm not sure, this is just my guess.
>>> I'm happy if we can support it more easily :)
>> Right now I am trying re-use simple-card driver as much as possible
>> and still make it work for flexible sound cards. I will be happy to
>> discuss and improve the patch wherever necessary. Please help me
>> understand which part you think looks to be hacky.
>>> But, if it was difficult to keep compatibility on simple-card,
>>> we/you need to have new one.
>> Patch 17/23 and 18/23 introduce new compatible
>> 'simple-cc-audio-card'. Idea was to use component chaining which
>> allows connection of FE<->BE and multiple BE<->BE components along the
>> DAPM path (patch 16/23). Do you think it would be fine?
> This seems very complex system for current simple-card.
> "concept" of simple-card is simple (but "code" is not so simple...)
> Because of it, it doesn't assume flexible connection.
>
> Maybe your patch works for you, but might breaks other systems.
> Or, makes code or DT settings more complex/ununderstandable.
> Not sure, but my guess.
Yes there are complex use cases, but if we look at the amount of changes 
required in simple-card driver that is not too much. Existing binding 
for simple-card driver would still work fine for our cases. Yes there 
are some deviations and we don't want to break existing users, that is 
why a *new* compatible was introduced and specific items can be pushed 
under it. Majority of the simple-card driver is getting re-used here. We 
just need to make sure it does not affect anyone else.

>
> Using cpu@0 node for BE is the 1st confusable point for me.
Don't we use the same methodology for CODEC<->CODEC link and still 
describe the DAI link with 'cpu@0' and 'codec@0'?

> Using fe/be instead of cpu/codec is easy to understand.
I guess you are referring to DT binding part. The parsing code 
specifically looks for "codec" sub node and thus present conventions had 
to be used.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
