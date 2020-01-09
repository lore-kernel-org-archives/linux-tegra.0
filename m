From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 05/21] clk: tegra: Fix Tegra PMC clock out parents
Date: Thu, 9 Jan 2020 09:18:16 -0800
Message-ID: <1af4584b-70ae-c439-8f8f-bbeceb3cb036@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-6-git-send-email-skomatineni@nvidia.com>
 <CABr+WT=qP1BJUfzgmr4AzN18Zp-trMEStF6SQ+AH7+aYBUuUww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABr+WT=qP1BJUfzgmr4AzN18Zp-trMEStF6SQ+AH7+aYBUuUww@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/8/20 12:34 AM, Nicolas Chauvet wrote:
> Le mer. 8 janv. 2020 =C3=A0 05:27, Sowjanya Komatineni
> <skomatineni@nvidia.com> a =C3=A9crit :
>> Tegra PMC clock out parents are osc, osc_div2, osc_div4 and extern
>> clock.
>>
>> Clock driver is using incorrect parents clk_m, clk_m_div2, clk_m_div4
>> for PMC clocks.
>>
>> This patch fixes this.
>>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra-pmc.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-t=
egra-pmc.c
>> index bec3e008335f..5e044ba1ae36 100644
>> --- a/drivers/clk/tegra/clk-tegra-pmc.c
>> +++ b/drivers/clk/tegra/clk-tegra-pmc.c
>> @@ -49,16 +49,16 @@ struct pmc_clk_init_data {
>>
>>   static DEFINE_SPINLOCK(clk_out_lock);
>>
>> -static const char *clk_out1_parents[] =3D { "clk_m", "clk_m_div2",
>> -       "clk_m_div4", "extern1",
>> +static const char *clk_out1_parents[] =3D { "osc", "osc_div2",
>> +       "osc_div4", "extern1",
>>   };
>>
>> -static const char *clk_out2_parents[] =3D { "clk_m", "clk_m_div2",
>> -       "clk_m_div4", "extern2",
>> +static const char *clk_out2_parents[] =3D { "osc", "osc_div2",
>> +       "osc_div4", "extern2",
>>   };
>>
>> -static const char *clk_out3_parents[] =3D { "clk_m", "clk_m_div2",
>> -       "clk_m_div4", "extern3",
>> +static const char *clk_out3_parents[] =3D { "osc", "osc_div2",
>> +       "osc_div4", "extern3",
>>   };
>>
>>   static struct pmc_clk_init_data pmc_clks[] =3D {
>> --
>> 2.7.4
> Out of curiosity, this patch touch the clk-tegra-pmc.c file which is
> later removed (by patch 11).
> Is this change made for bugfix ? Is there a stable tag missing ?
Will resend final version with stable tags for patches that should be=20
backported.
