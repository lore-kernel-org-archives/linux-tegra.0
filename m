From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v8 19/22] ASoC: tegra: Enable audio mclk during
 tegra_asoc_utils_init
Date: Mon, 20 Jan 2020 09:40:24 +0530
Message-ID: <64027c16-763b-350f-9975-4f9727450ae9@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-20-git-send-email-skomatineni@nvidia.com>
 <3a8e609a-58aa-d2c1-c140-e1f0127dd53b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <3a8e609a-58aa-d2c1-c140-e1f0127dd53b@gmail.com>
Content-Language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/19/2020 8:44 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 14.01.2020 10:24, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
>> through Tegra210 and currently Tegra clock driver keeps the audio
>> mclk enabled.
>>
>> With the move of PMC clocks from clock driver into pmc driver,
>> audio mclk enable from clock driver is removed and this should be
>> taken care by the audio driver.
>>
>> tegra_asoc_utils_init calls tegra_asoc_utils_set_rate and audio mclk
>> rate configuration is not needed during init and set_rate is actually
>> done during hw_params callback.
>>
>> So, this patch removes tegra_asoc_utils_set_rate call and just leaves
>> the audio mclk enabled.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   sound/soc/tegra/tegra_asoc_utils.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_=
asoc_utils.c
>> index 1dce5ad6e665..99584970f5f4 100644
>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>> @@ -216,9 +216,16 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_d=
ata *data,
>>                data->clk_cdev1 =3D clk_out_1;
>>        }
>>
>> -     ret =3D tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
>> -     if (ret)
>> +     /*
>> +      * FIXME: There is some unknown dependency between audio mclk disa=
ble
>> +      * and suspend-resume functionality on Tegra30, although audio mcl=
k is
>> +      * only needed for audio.
>> +      */
>> +     ret =3D clk_prepare_enable(data->clk_cdev1);
>> +     if (ret) {
>> +             dev_err(data->dev, "Can't enable cdev1: %d\n", ret);
>>                return ret;
>> +     }
>>
>>        return 0;
>>   }
>>
> Shouldn't the clock be disabled on driver's removal?

I am not sure if we really need to do in this series as it does not=20
change the behavior from what was there earlier. Also there is already a=20
FIXME item here and we end up adding clock disable in remove() path of=20
multiple drivers, which is going to be removed once we address FIXME.
