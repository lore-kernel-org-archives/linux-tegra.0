From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Wed, 8 Mar 2017 09:23:07 +0100
Message-ID: <CAMuHMdVVegPk_psHeHeapkMO30i4w9Bh7zE48dahaxTrR20TaQ@mail.gmail.com>
References: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
 <4cf40c25-2ce9-737c-9ccb-06bc2cdb61d7@nvidia.com> <20170306083835.GF26640@tbergstrom-lnx.Nvidia.com>
 <6d4dd315-cab6-189d-f383-fb7523fc31bd@nvidia.com> <20170306142850.GJ26640@tbergstrom-lnx.Nvidia.com>
 <CAMuHMdWD5Pw4BfH7YMY5hnxGbib=8zqUrHrG+GHXquRjjSZ+gA@mail.gmail.com> <598a2a7d-6e01-8884-e839-c758b731605a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <598a2a7d-6e01-8884-e839-c758b731605a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On Tue, Mar 7, 2017 at 9:27 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 06/03/17 15:53, Geert Uytterhoeven wrote:
>> On Mon, Mar 6, 2017 at 3:28 PM, Peter De Schrijver
>> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On Mon, Mar 06, 2017 at 09:58:29AM +0000, Jon Hunter wrote:
>>>> On 06/03/17 08:38, Peter De Schrijver wrote:
>>>>> On Thu, Mar 02, 2017 at 05:56:49PM +0000, Jon Hunter wrote:
>>>>>> On 28/02/17 15:19, Peter De Schrijver wrote:
>>>>>>> This is needed to make the JTAG debugging interface work.
>>>>>>>
>>>>>>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>>> ---
>>>>>>>  drivers/clk/tegra/clk-tegra210.c | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>>>>>> index 9a2512a..708f5f1 100644
>>>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>>>> @@ -2680,6 +2680,7 @@ static void tegra210_cpu_clock_resume(void)
>>>>>>>   { TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
>>>>>>>   { TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
>>>>>>>   { TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
>>>>>>> + { TEGRA210_CLK_DBGAPB, TEGRA210_CLK_CLK_MAX, 0, 1 },
>>>>>>>   { TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0 },
>>>>>>>   { TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0 },
>>>>>>>   { TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0 },
>>>>>>
>>>>>> Should there be some dependency on say CONFIG_DEBUG_KERNEL? I am not
>>>>>> sure we always want this on for all cases.
>>>>>
>>>>> Why would you not want it to be always on?
>>>>
>>>> Purely for power reasons. I do not know how much power keeping this
>>>
>>> I don't expect it to be significant but I don't have any numbers.
>>>
>>>> clock running consumes, but I don't like the idea of clocks running all
>>>> the time when they are not needed.
>>>
>>> Problem is that in this case there is no easy way to determine if the clock
>>> needs to be on.
>>
>> I had a similar issue with SH-Mobile AG5, where the power domain containing
>> the JTAG interface is powered down.
>>
>> [DEBUG] ARM: dts: sh73a0: Add minimal device node for Coresight-ETM
>> https://patchwork.kernel.org/patch/8151511/
>>
>> Want to debug? Apply patch. I know it's not ideal...
>
> Why don't you apply the patch and just keep the node disabled by default?

Thanks, good idea!

Then I first have to make get_special_pds() skip disabled nodes...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
