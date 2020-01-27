From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 2/9] ASoC: tegra: add support for CIF
 programming
Date: Mon, 27 Jan 2020 10:41:10 +0530
Message-ID: <34917b2d-064f-44a9-4548-ae857e8ea29b@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-3-git-send-email-spujar@nvidia.com>
 <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
 <a8409b81-7c6b-37a9-81fd-772eb2eca185@nvidia.com>
 <229def08-6bd4-30d7-056b-92329e48c699@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <229def08-6bd4-30d7-056b-92329e48c699-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 1/21/2020 9:34 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 21.01.2020 07:41, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 1/20/2020 9:28 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> Hello Sameer,
>>>
>>> 20.01.2020 17:23, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>> [snip]
>>>
>>>> Tegra30 and Tegra124 have an identical CIF programming helper function=
.
>>> [snip]
>>>
>>>> -#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT  24
>>>> -#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US        0x3f
>>>> -#define TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK
>>>> (TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_MASK_US <<
>>>> TEGRA124_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT)
>>>> -
>>>> -/* Channel count minus 1 */
>>>> -#define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT   24
>>>> -#define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US 7
>>>> -#define TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK
>>>> (TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_MASK_US <<
>>>> TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT)
>>> The AUDIOCIF_CTRL bitfields are not the same on T30 and T124, why are
>>> you claiming that programming is identical? Have you actually tried to
>>> test these patches on T30?
>> Oh yes! seems like I overlooked the macro values. Thanks for pointing
>> this. I will retain separate CIF function for Tegra30.
>> I do not have a Tegra30 board with me and hence could not test anything
>> specific to it apart from build sanity.
>> If someone can help me test I would really appreciate.
>>
> I'll help with the testing once all obvious problems will be fixed.

Thanks Dmitry. However I plan to send Tegra30 related patch separately.
In this series I will focus on Tegra210 and later.
