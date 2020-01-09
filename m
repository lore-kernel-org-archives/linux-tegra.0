From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 05/21] clk: tegra: Fix Tegra PMC clock out parents
Date: Thu, 9 Jan 2020 22:45:12 +0300
Message-ID: <94661229-58e6-a43f-50fd-0d0f65c0339c@gmail.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-6-git-send-email-skomatineni@nvidia.com>
 <CABr+WT=qP1BJUfzgmr4AzN18Zp-trMEStF6SQ+AH7+aYBUuUww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABr+WT=qP1BJUfzgmr4AzN18Zp-trMEStF6SQ+AH7+aYBUuUww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

08.01.2020 11:34, Nicolas Chauvet пишет:
> Le mer. 8 janv. 2020 à 05:27, Sowjanya Komatineni
> <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> a écrit :
>>
>> Tegra PMC clock out parents are osc, osc_div2, osc_div4 and extern
>> clock.
>>
>> Clock driver is using incorrect parents clk_m, clk_m_div2, clk_m_div4
>> for PMC clocks.
>>
>> This patch fixes this.
>>
>> Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/tegra/clk-tegra-pmc.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
>> index bec3e008335f..5e044ba1ae36 100644
>> --- a/drivers/clk/tegra/clk-tegra-pmc.c
>> +++ b/drivers/clk/tegra/clk-tegra-pmc.c
>> @@ -49,16 +49,16 @@ struct pmc_clk_init_data {
>>
>>  static DEFINE_SPINLOCK(clk_out_lock);
>>
>> -static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
>> -       "clk_m_div4", "extern1",
>> +static const char *clk_out1_parents[] = { "osc", "osc_div2",
>> +       "osc_div4", "extern1",
>>  };
>>
>> -static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
>> -       "clk_m_div4", "extern2",
>> +static const char *clk_out2_parents[] = { "osc", "osc_div2",
>> +       "osc_div4", "extern2",
>>  };
>>
>> -static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
>> -       "clk_m_div4", "extern3",
>> +static const char *clk_out3_parents[] = { "osc", "osc_div2",
>> +       "osc_div4", "extern3",
>>  };
>>
>>  static struct pmc_clk_init_data pmc_clks[] = {
>> --
>> 2.7.4
> 
> Out of curiosity, this patch touch the clk-tegra-pmc.c file which is
> later removed (by patch 11).
> Is this change made for bugfix ? Is there a stable tag missing ?
> 

This is not a bugfix, but a minor correction which doesn't need a stable
tag.
