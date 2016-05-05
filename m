From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/4] soc/tegra: pmc: Correct type of variable for
 tegra_pmc_readl()
Date: Thu, 5 May 2016 13:48:38 +0100
Message-ID: <572B4126.30008@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com>
 <1462361973-27990-3-git-send-email-ldewangan@nvidia.com>
 <572B173D.6030108@nvidia.com> <572B17DA.901@nvidia.com>
 <572B3FF9.8080202@nvidia.com> <572B3DFB.3070604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572B3DFB.3070604-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 05/05/16 13:35, Laxman Dewangan wrote:
> 
> On Thursday 05 May 2016 06:13 PM, Jon Hunter wrote:
>> On 05/05/16 10:52, Laxman Dewangan wrote:
>>> On Thursday 05 May 2016 03:19 PM, Jon Hunter wrote:
>>>> On 04/05/16 12:39, Laxman Dewangan wrote:
>>>>> The function tegra_pmc_readl() returns the u32 type data and hence
>>>>> change the data type of variable where this data is stored to u32
>>>>> type.
>>>>>
>>>>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> ---
>>>>> Changes from V1:
>>>>> -This is new in series as per discussion on V1 series to use u32 for
>>>>> tegra_pmc_readl.
>>>>>
>>>>> Changes from V2:
>>>>> - Make unsigned long to u32 for some missed variable from V1.
>>>>> ---
>>>>>    drivers/soc/tegra/pmc.c | 24 ++++++++++++++----------
>>>>>    1 file changed, 14 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>> index 2c3f1f9..eff9425 100644
>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>> @@ -844,7 +844,8 @@ static void tegra_powergate_init(struct tegra_pmc
>>>>> *pmc)
>>>>>    static int tegra_io_rail_prepare(unsigned int id, unsigned long
>>>>> *request,
>>>>>                     unsigned long *status, unsigned int *bit)
>>>>>    {
>>>>> -    unsigned long rate, value;
>>>>> +    unsigned long rate;
>>>>> +    u32 value;
>>>>>          *bit = id % 32;
>>>>>    @@ -868,17 +869,18 @@ static int tegra_io_rail_prepare(unsigned int
>>>>> id, unsigned long *request,
>>>>>        tegra_pmc_writel(DPD_SAMPLE_ENABLE, DPD_SAMPLE);
>>>>>          /* must be at least 200 ns, in APB (PCLK) clock cycles */
>>>>> -    value = DIV_ROUND_UP(1000000000, rate);
>>>>> -    value = DIV_ROUND_UP(200, value);
>>>>> +    rate = DIV_ROUND_UP(1000000000, rate);
>>>>> +    rate = DIV_ROUND_UP(200, rate);
>>>>> +    value = (u32)rate;
>>>> Although it is unlikely, I think that we should check it is less
>>>> than U32_MAX, return an error if it is not.
>>> rate = DIV_ROUNC_UP(200, rate) means
>>>
>>> rate = (200 + rate -1)/rate
>>>
>>> and can not be more than 200 in any case (if rate =1).
>>> So no need of the error check.
>> OK, yes you are right. In that case there is no need to cast and so I
>> would leave this code as-is and not change the type.
>>
> 
> You mean keep value as unsigned long for value?

Yes.

> I think we can still say value as u32 and simply write
> value = rate
> 
> Just remove the casting.

I would not change this at all. I don't see any benefit.

Jon
