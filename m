From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 15/21] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Fri, 10 Jan 2020 15:14:47 -0800
Message-ID: <dcfd35f3-7fdd-fdc9-1c77-bcb63bcabd5b@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-16-git-send-email-skomatineni@nvidia.com>
 <f3f550a2-c6e0-7a78-5c83-da3e54dab309@nvidia.com>
 <d7ac6135-73b0-1087-dafa-4df558a06ef4@nvidia.com>
 <a3c5293b-9ed4-3266-f792-38b980e54b1e@nvidia.com>
 <745b8c7b-4fe3-c9ea-284e-b89546e8ad87@nvidia.com>
 <705edf9b-d1bc-8090-017e-fa4ad445f9fb@nvidia.com>
 <135f0c0b-86d1-9b1a-af02-c14c4b5308c4@gmail.com>
 <575aa30e-1b5a-2a2d-5893-3f6832f416f1@nvidia.com>
 <9bca6c3e-bfe0-7130-b233-3f25c436f76e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9bca6c3e-bfe0-7130-b233-3f25c436f76e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 1/10/20 3:02 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 11.01.2020 01:13, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 1/10/20 2:05 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 10.01.2020 20:04, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 1/9/20 10:52 AM, Sowjanya Komatineni wrote:
>>>>> On 1/7/20 10:28 PM, Sameer Pujar wrote:
>>>>>> On 1/8/2020 11:18 AM, Sowjanya Komatineni wrote:
>>>>>>> On 1/7/20 9:34 PM, Sameer Pujar wrote:
>>>>>>>> On 1/8/2020 9:55 AM, Sowjanya Komatineni wrote:
>>>>>>>>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc
>>>>>>>>> clocks
>>>>>>>>> are moved to Tegra PMC driver with pmc as clock provider and usin=
g
>>>>>>>>> pmc
>>>>>>>>> clock ids.
>>>>>>>>>
>>>>>>>>> New device tree uses clk_out_1 from pmc clock provider.
>>>>>>>>>
>>>>>>>>> So, this patch adds implementation for mclk fallback to extern1
>>>>>>>>> when
>>>>>>>>> retrieving mclk returns -ENOENT to be backward compatible of new
>>>>>>>>> device
>>>>>>>>> tree with older kernels.
>>>>>>>>>
>>>>>>>>> Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>>>> Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>>>>> ---
>>>>>>>>>     sound/soc/tegra/tegra_asoc_utils.c | 11 ++++++++++-
>>>>>>>>>     1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>>>> index 9cfebef74870..9a5f81039491 100644
>>>>>>>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>>>> @@ -183,7 +183,16 @@ int tegra_asoc_utils_init(struct
>>>>>>>>> tegra_asoc_utils_data *data,
>>>>>>>>>         data->clk_cdev1 =3D devm_clk_get(dev, "mclk");
>>>>>>>>>         if (IS_ERR(data->clk_cdev1)) {
>>>>>>>>>             dev_err(data->dev, "Can't retrieve clk cdev1\n");
>>>>>>>> This error print can be moved inside below if, when this actually
>>>>>>>> meant to be an error condition.
>>>>>>>>
>>>>>>> Want to show error even if mclk retrieval returns ENOENT to clearly
>>>>>>> indicate mclk does not exist along with message of falling back to
>>>>>>> extern1.
>>>>>> Yes, but falling back essentially means 'mclk' is not available and
>>>>>> fallback print is not an error.
>>>>>> Not a major issue though, you can consider updating. Otherwise LGTM.
>>>>>>
>>>>> Will update
>>>>>>>>> -        return PTR_ERR(data->clk_cdev1);
>>>>>>>>> +        if (PTR_ERR(data->clk_cdev1) !=3D -ENOENT)
>>>>>>>>> +            return PTR_ERR(data->clk_cdev1);
>>>>>>>>> +        /* Fall back to extern1 */
>>>>>>>>> +        data->clk_cdev1 =3D devm_clk_get(dev, "extern1");
>>>>>>>>> +        if (IS_ERR(data->clk_cdev1)) {
>>>>>>>>> +            dev_err(data->dev, "Can't retrieve clk extern1\n");
>>>>>>>>> +            return PTR_ERR(data->clk_cdev1);
>>>>>>>>> +        }
>>>>>>>>> +
>>>>>>>>> +        dev_err(data->dev, "Falling back to extern1\n");
>>>>>>>> This can be a info print?
>>>>> Will use dev_info
>>>>>>>>>         }
>>>>>>>>>           /*
>>>>> Dmitry/Rob, there was discussion in v3 regarding backporting mclk
>>>>> fallback.
>>>>>
>>>>> Dmitry wanted Rob to confirm on this
>>>>>
>>>>> I think openSUSE Leap could be one of those distros that use LTS kern=
el
>>>>> with newer device-trees, but that's not 100%. Maybe Rob could help
>>>>> clarifying that.
>>>>>
>>>>> Dmitry/Rob, Can you please confirm if mclk fallback patch need
>>>>> backport to have new device tree work with old kernels?
>>>>>
>>>> Dmitry,
>>>>
>>>> Can you please confirm if we need to backport this mclk fallback patch=
?
>>>>
>>> Seems only T210 was making use of the CaR's TEGRA*_CLK_CLK_OUT_*, thus
>>> the backporting isn't needed.
>> Thanks Dmitry
>>> Also, please use 'git rebase --exec make ...' to make sure that all
>>> patches are compiling without problems. The removal of the legacy clock
>>> IDs should be done after the device-trees changes, otherwise it looks
>>> like DTBs compilation will fail. It's possible that the order of the
>>> patches could be changed if Thierry will chose to split this series int=
o
>>> several pull requests, nevertheless all patches should compile and work
>>> in the original order.
>> OK, Will move patches of device tree updates to use new DT ID prior to
>> removal of old ID.
> Oh, wait. But then the newer device-trees won't work with the stable
> kernels, so it actually won't hurt to backport this change.
ok will add Fixes tag to have this mclk fallback patch backported.
>
> Secondly, please move the "Use device managed resource APIs to get the
> clock" after the ASoC patches with the stable tags, such that the stable
> patches could be applied cleanly.
OK
>
> Lastly, please separate the assigned-clocks change from the the audio
> mclk enable/disable into a standalone patch. These changes are not
> interdependent, unless I'm missing something.

But parent configuration when assigned-clock-parents are not in DT are=20
needed along with mclk enable

as we are removing audio clocks parent configuration and enabling them=20
together from clock driver.

So doesn't both parent configuration and enabling mclk together need to=20
be in same patch to match what we are removing from clock driver?
