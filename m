From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 00/21] Move PMC clocks into Tegra PMC driver
Date: Fri, 10 Jan 2020 10:13:25 +0530
Message-ID: <738f42e2-7135-b111-5863-1cb15aa96c18@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <4e9fab30-14b5-bf1f-dc91-fd57ef614503@gmail.com>
 <61a78ba8-4cc3-f6a6-513b-36daa9be32f0@nvidia.com>
 <37a9676b-e0e5-7e80-5ee4-abfca361dcf7@nvidia.com>
 <62751d2d-2b7d-509b-e236-363d2bb29b02@nvidia.com>
 <880b2e8a-aa55-40f3-7502-24392b88e53f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <880b2e8a-aa55-40f3-7502-24392b88e53f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 1/10/2020 10:06 AM, Sowjanya Komatineni wrote:
>
> On 1/9/20 7:32 PM, Sowjanya Komatineni wrote:
>>
>> On 1/9/20 7:24 PM, Sowjanya Komatineni wrote:
>>>
>>> On 1/9/20 5:39 PM, Sowjanya Komatineni wrote:
>>>>
>>>> On 1/9/20 11:44 AM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 08.01.2020 07:24, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> This patch series moves Tegra PMC clocks from clock driver to pmc=20
>>>>>> driver
>>>>>> along with the device trees changes and audio driver which uses=20
>>>>>> one of
>>>>>> the pmc clock for audio mclk.
>>>>>>
>>>>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls=20
>>>>>> which
>>>>>> are currently registered by Tegra clock driver using=20
>>>>>> clk_regiser_mux and
>>>>>> clk_register_gate which performs direct Tegra PMC register access.
>>>>>>
>>>>>> When Tegra PMC is in secure mode, any access from non-secure=20
>>>>>> world will
>>>>>> not go through.
>>>>>>
>>>>>> This patch series adds these Tegra PMC clocks and blink controls=20
>>>>>> to Tegra
>>>>>> PMC driver with PMC as clock provider and removes them from Tegra=20
>>>>>> clock
>>>>>> driver.
>>>>>>
>>>>>> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru=20
>>>>>> Tegra210
>>>>>> and clock driver does inital parent configuration for it and=20
>>>>>> enables them.
>>>>>> But this clock should be taken care by audio driver as there is=20
>>>>>> no need
>>>>>> to have this clock pre enabled.
>>>>>>
>>>>>> So, this series also includes patch that updates ASoC driver to take
>>>>>> care of parent configuration for mclk if device tree don't specify
>>>>>> initial parent configuration using assigned-clock-parents and=20
>>>>>> controls
>>>>>> audio mclk enable/disable during ASoC machine startup and shutdown.
>>>>>>
>>>>>> DTs are also updated to use clk_out_1 as audio mclk rather than=20
>>>>>> extern1.
>>>>>>
>>>>>> This series also includes a patch for mclk fallback to extern1 when
>>>>>> retrieving mclk fails to have this backward compatible of new DT=20
>>>>>> with
>>>>>> old kernels.
>>>>> Suspend-resume doesn't work anymore, reverting this series helps. I
>>>>> don't have any other information yet, please take a look.
>>>> Thanks Dmitry. Will test suspend resume and check..
>>>
>>> I see if we leave audio mclk (cdev1) enabled during=20
>>> tegra_asoc_utils_init, suspend resume works.
>>>
>>> Without audio mclk enabled during tegra_asoc_utils_init, somehow it=20
>>> prevents entry to suspend on Tegra30 platform.
>>>
>>> Will look in detail..
>>>
>> audio mclk is only needed for audio and werid that having it not=20
>> enabled all the time like in current clock driver prevents suspend=20
>> entry on Tegra30
>>
>> Looks like this issue is masked earlier with having mclk enabled all=20
>> the time by clock driver.
>>
> On linux-next without this patch series, I just disabled mclk to be=20
> enabled all the time (removed set_rate from utils_init) and also=20
> disabled default enable from clock driver.
>
> So somehow disabling mclk is preventing suspend entry.

This is strange.

>
> Probably debugging suspend issue on Tegra30 when audio mclk is=20
> disabled can be done separately and will keep audio mclk enabled in=20
> asoc_utils_init with comment mentioning this issue and fix as TBD to=20
> move on with PMC clock fixes.

Sounds fine with me as the suspend/resume issue is not introduced in the=20
current series. It can be addressed separately.

>
>
>
