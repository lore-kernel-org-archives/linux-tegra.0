From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 15/21] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Fri, 10 Jan 2020 14:13:42 -0800
Message-ID: <575aa30e-1b5a-2a2d-5893-3f6832f416f1@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-16-git-send-email-skomatineni@nvidia.com>
 <f3f550a2-c6e0-7a78-5c83-da3e54dab309@nvidia.com>
 <d7ac6135-73b0-1087-dafa-4df558a06ef4@nvidia.com>
 <a3c5293b-9ed4-3266-f792-38b980e54b1e@nvidia.com>
 <745b8c7b-4fe3-c9ea-284e-b89546e8ad87@nvidia.com>
 <705edf9b-d1bc-8090-017e-fa4ad445f9fb@nvidia.com>
 <135f0c0b-86d1-9b1a-af02-c14c4b5308c4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <135f0c0b-86d1-9b1a-af02-c14c4b5308c4@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/10/20 2:05 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 10.01.2020 20:04, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 1/9/20 10:52 AM, Sowjanya Komatineni wrote:
>>>
>>> On 1/7/20 10:28 PM, Sameer Pujar wrote:
>>>> On 1/8/2020 11:18 AM, Sowjanya Komatineni wrote:
>>>>> On 1/7/20 9:34 PM, Sameer Pujar wrote:
>>>>>> On 1/8/2020 9:55 AM, Sowjanya Komatineni wrote:
>>>>>>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc
>>>>>>> clocks
>>>>>>> are moved to Tegra PMC driver with pmc as clock provider and using
>>>>>>> pmc
>>>>>>> clock ids.
>>>>>>>
>>>>>>> New device tree uses clk_out_1 from pmc clock provider.
>>>>>>>
>>>>>>> So, this patch adds implementation for mclk fallback to extern1 whe=
n
>>>>>>> retrieving mclk returns -ENOENT to be backward compatible of new
>>>>>>> device
>>>>>>> tree with older kernels.
>>>>>>>
>>>>>>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> ---
>>>>>>>    sound/soc/tegra/tegra_asoc_utils.c | 11 ++++++++++-
>>>>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>> index 9cfebef74870..9a5f81039491 100644
>>>>>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>>>>>> @@ -183,7 +183,16 @@ int tegra_asoc_utils_init(struct
>>>>>>> tegra_asoc_utils_data *data,
>>>>>>>        data->clk_cdev1 =3D devm_clk_get(dev, "mclk");
>>>>>>>        if (IS_ERR(data->clk_cdev1)) {
>>>>>>>            dev_err(data->dev, "Can't retrieve clk cdev1\n");
>>>>>> This error print can be moved inside below if, when this actually
>>>>>> meant to be an error condition.
>>>>>>
>>>>> Want to show error even if mclk retrieval returns ENOENT to clearly
>>>>> indicate mclk does not exist along with message of falling back to
>>>>> extern1.
>>>> Yes, but falling back essentially means 'mclk' is not available and
>>>> fallback print is not an error.
>>>> Not a major issue though, you can consider updating. Otherwise LGTM.
>>>>
>>> Will update
>>>>>>> -        return PTR_ERR(data->clk_cdev1);
>>>>>>> +        if (PTR_ERR(data->clk_cdev1) !=3D -ENOENT)
>>>>>>> +            return PTR_ERR(data->clk_cdev1);
>>>>>>> +        /* Fall back to extern1 */
>>>>>>> +        data->clk_cdev1 =3D devm_clk_get(dev, "extern1");
>>>>>>> +        if (IS_ERR(data->clk_cdev1)) {
>>>>>>> +            dev_err(data->dev, "Can't retrieve clk extern1\n");
>>>>>>> +            return PTR_ERR(data->clk_cdev1);
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        dev_err(data->dev, "Falling back to extern1\n");
>>>>>> This can be a info print?
>>> Will use dev_info
>>>>>>>        }
>>>>>>>          /*
>>> Dmitry/Rob, there was discussion in v3 regarding backporting mclk
>>> fallback.
>>>
>>> Dmitry wanted Rob to confirm on this
>>>
>>> I think openSUSE Leap could be one of those distros that use LTS kernel
>>> with newer device-trees, but that's not 100%. Maybe Rob could help
>>> clarifying that.
>>>
>>> Dmitry/Rob, Can you please confirm if mclk fallback patch need
>>> backport to have new device tree work with old kernels?
>>>
>> Dmitry,
>>
>> Can you please confirm if we need to backport this mclk fallback patch?
>>
> Seems only T210 was making use of the CaR's TEGRA*_CLK_CLK_OUT_*, thus
> the backporting isn't needed.
Thanks Dmitry
>
> Also, please use 'git rebase --exec make ...' to make sure that all
> patches are compiling without problems. The removal of the legacy clock
> IDs should be done after the device-trees changes, otherwise it looks
> like DTBs compilation will fail. It's possible that the order of the
> patches could be changed if Thierry will chose to split this series into
> several pull requests, nevertheless all patches should compile and work
> in the original order.
OK, Will move patches of device tree updates to use new DT ID prior to=20
removal of old ID.
