From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 19/22] ASoC: tegra: Enable audio mclk during
 tegra_asoc_utils_init
Date: Mon, 20 Jan 2020 18:32:45 +0300
Message-ID: <0b13d21c-1daf-4e9d-f2c2-e78a3b8935f2@gmail.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-20-git-send-email-skomatineni@nvidia.com>
 <3a8e609a-58aa-d2c1-c140-e1f0127dd53b@gmail.com>
 <64027c16-763b-350f-9975-4f9727450ae9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64027c16-763b-350f-9975-4f9727450ae9-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.01.2020 07:10, Sameer Pujar пишет:
> 
> On 1/19/2020 8:44 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 14.01.2020 10:24, Sowjanya Komatineni пишет:
>>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
>>> through Tegra210 and currently Tegra clock driver keeps the audio
>>> mclk enabled.
>>>
>>> With the move of PMC clocks from clock driver into pmc driver,
>>> audio mclk enable from clock driver is removed and this should be
>>> taken care by the audio driver.
>>>
>>> tegra_asoc_utils_init calls tegra_asoc_utils_set_rate and audio mclk
>>> rate configuration is not needed during init and set_rate is actually
>>> done during hw_params callback.
>>>
>>> So, this patch removes tegra_asoc_utils_set_rate call and just leaves
>>> the audio mclk enabled.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   sound/soc/tegra/tegra_asoc_utils.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>> index 1dce5ad6e665..99584970f5f4 100644
>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>> @@ -216,9 +216,16 @@ int tegra_asoc_utils_init(struct
>>> tegra_asoc_utils_data *data,
>>>                data->clk_cdev1 = clk_out_1;
>>>        }
>>>
>>> -     ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
>>> -     if (ret)
>>> +     /*
>>> +      * FIXME: There is some unknown dependency between audio mclk
>>> disable
>>> +      * and suspend-resume functionality on Tegra30, although audio
>>> mclk is
>>> +      * only needed for audio.
>>> +      */
>>> +     ret = clk_prepare_enable(data->clk_cdev1);
>>> +     if (ret) {
>>> +             dev_err(data->dev, "Can't enable cdev1: %d\n", ret);
>>>                return ret;
>>> +     }
>>>
>>>        return 0;
>>>   }
>>>
>> Shouldn't the clock be disabled on driver's removal?
> 
> I am not sure if we really need to do in this series as it does not
> change the behavior from what was there earlier. Also there is already a
> FIXME item here and we end up adding clock disable in remove() path of
> multiple drivers, which is going to be removed once we address FIXME.
> 

Well, perhaps this is indeed good enough for the time being.

BTW, I didn't spot any suspend-resume problems using v8.

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
