From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date: Sat, 29 Jun 2019 15:38:20 +0300
Message-ID: <fbfb2167-d0b3-b66a-d1ba-378c877817ed@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
 <ca8199af-43db-c878-a93f-66c275acf864@gmail.com>
 <99403cb1-aaef-4dd4-68a0-67864ca7ce6c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <99403cb1-aaef-4dd4-68a0-67864ca7ce6c@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

29.06.2019 2:00, Sowjanya Komatineni пишет:
> 
> On 6/28/19 5:05 AM, Dmitry Osipenko wrote:
>> 28.06.2019 14:56, Dmitry Osipenko пишет:
>>> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>>
>>>> During suspend, context of all pinctrl registers are stored and
>>>> on resume they are all restored to have all the pinmux and pad
>>>> configuration for normal operation.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   int tegra_pinctrl_probe(struct platform_device *pdev,
>>>>               const struct tegra_pinctrl_soc_data *soc_data);
>>>>   #endif
>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>> b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>> index 0b56ad5c9c1c..edd3f4606cdb 100644
>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
>>>>       .driver = {
>>>>           .name = "tegra210-pinctrl",
>>>>           .of_match_table = tegra210_pinctrl_of_match,
>>>> +        .pm = &tegra_pinctrl_pm,
>>>>       },
>>>>       .probe = tegra210_pinctrl_probe,
>>>>   };
>>>>
>>> Could you please address my comments in the next revision if there will be one?
>>>
>> Also, what about adding ".pm' for other Tegras? I'm sure Jon could test them for you.
> 
> This series is for Tegra210 SC7 entry/exit along with clocks and pinctrl suspend
> resume needed for Tegra210 basic sc7 entry and exit.
> 
> This includes pinctrl, pmc changes, clock-tegra210 driver changes all w.r.t Tegra210
> platforms specific.
> 
> Suspend/resume support for other Tegras will be in separate patch series.

Okay, fair enough.
