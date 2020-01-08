From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 15/21] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Tue, 7 Jan 2020 21:48:00 -0800
Message-ID: <d7ac6135-73b0-1087-dafa-4df558a06ef4@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-16-git-send-email-skomatineni@nvidia.com>
 <f3f550a2-c6e0-7a78-5c83-da3e54dab309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f3f550a2-c6e0-7a78-5c83-da3e54dab309@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/7/20 9:34 PM, Sameer Pujar wrote:
>
> On 1/8/2020 9:55 AM, Sowjanya Komatineni wrote:
>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
>> are moved to Tegra PMC driver with pmc as clock provider and using pmc
>> clock ids.
>>
>> New device tree uses clk_out_1 from pmc clock provider.
>>
>> So, this patch adds implementation for mclk fallback to extern1 when
>> retrieving mclk returns -ENOENT to be backward compatible of new device
>> tree with older kernels.
>>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>> =C2=A0 sound/soc/tegra/tegra_asoc_utils.c | 11 ++++++++++-
>> =C2=A0 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c=20
>> b/sound/soc/tegra/tegra_asoc_utils.c
>> index 9cfebef74870..9a5f81039491 100644
>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>> @@ -183,7 +183,16 @@ int tegra_asoc_utils_init(struct=20
>> tegra_asoc_utils_data *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->clk_cdev1 =3D devm_clk_get(dev, "mc=
lk");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(data->clk_cdev1)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(data->dev=
, "Can't retrieve clk cdev1\n");
>
> This error print can be moved inside below if, when this actually=20
> meant to be an error condition.
>
Want to show error even if mclk retrieval returns ENOENT to clearly=20
indicate mclk does not exist along with message of falling back to extern1.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(data->clk_cde=
v1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (PTR_ERR(data->clk_cdev1)=
 !=3D -ENOENT)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn PTR_ERR(data->clk_cdev1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Fall back to extern1 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->clk_cdev1 =3D devm_clk=
_get(dev, "extern1");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(data->clk_cdev1))=
 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_=
err(data->dev, "Can't retrieve clk extern1\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn PTR_ERR(data->clk_cdev1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(data->dev, "Falling =
back to extern1\n");
>
> This can be a info print?

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
