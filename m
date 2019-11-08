From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 11/22] clk: tegra: clk-dfll: Add suspend and resume
 support
Date: Sat, 9 Nov 2019 02:38:17 +0300
Message-ID: <f644adda-dc6b-9b7e-3fc2-94091a38c99a@gmail.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
 <1565984527-5272-12-git-send-email-skomatineni@nvidia.com>
 <20191108212015.07BC720869@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108212015.07BC720869@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.11.2019 00:20, Stephen Boyd пишет:
> Quoting Sowjanya Komatineni (2019-08-16 12:41:56)
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index f8688c2ddf1a..c051d92c2bbf 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -1487,6 +1487,7 @@ static int dfll_init(struct tegra_dfll *td)
>>         td->last_unrounded_rate = 0;
>>  
>>         pm_runtime_enable(td->dev);
>> +       pm_runtime_irq_safe(td->dev);
> 
> Why irq_safe? It would be good to mention it in the commit text or
> something.

That's a good catch. It was somewhat relevant for some older version of
this patch, but should be irrelevant now.

[snip]
