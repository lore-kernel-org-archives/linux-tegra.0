From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
Date: Tue, 30 Jun 2020 09:38:22 +0530
Message-ID: <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87mu4lz6pt.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 6:54 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>> Maybe base issue for multiple codec support
>>> is that simple_for_each_link() is caring first codec only ?
> (snip)
>> Ideally I wanted to remove above two lines and allow empty codec
>> list. But some users may expect the parsing to fail if no 'Codec' is
>> found in the DAI link, hence did not remove above. If it is fine to
>> remove above two lines it would be simpler. The loop inside
>> simple_for_each_link() would anyway loop for each child node of DAI
>> link and simple_dai_link_of_dpcm() can parse each 'np'.

> Current simple-card is not assuming multi Codec,
> thus, we need to update it correctly, not quick-hack.
>
> I'm not sure how to do it, but it seems we need to update
> many functions to support it, not only simple-card driver.
> For example, simple-card-utils, soc-core, etc, etc...
>
> I'm not sure, this is just my guess.
> I'm happy if we can support it more easily :)
Right now I am trying re-use simple-card driver as much as possible and 
still make it work for flexible sound cards. I will be happy to discuss 
and improve the patch wherever necessary. Please help me understand 
which part you think looks to be hacky.

> But, if it was difficult to keep compatibility on simple-card,
> we/you need to have new one.
Patch 17/23 and 18/23 introduce new compatible 'simple-cc-audio-card'. 
Idea was to use component chaining which allows connection of FE<->BE 
and multiple BE<->BE components along the DAPM path (patch 16/23). Do 
you think it would be fine?

> Actually, I had a plan to create more flexible sound card
> driver, but it is not hi priority for me in these days.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
