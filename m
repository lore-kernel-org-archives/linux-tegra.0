From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 07/22] clk: Add API to get index of the clock parent
Date: Thu, 7 Nov 2019 03:54:03 +0300
Message-ID: <fcc43ccb-8c6e-d518-4c70-503501706ffd@gmail.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
 <1565984527-5272-8-git-send-email-skomatineni@nvidia.com>
 <20191106231005.F2CD820869@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191106231005.F2CD820869@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.11.2019 02:10, Stephen Boyd пишет:
> Quoting Sowjanya Komatineni (2019-08-16 12:41:52)
>> This patch adds an API clk_hw_get_parent_index to get index of the
>> clock parent to use during the clock restore operations on system
>> resume.
>  
> Is there a reason we can't save the clk hw index at suspend time by
> reading the hardware to understand the current parent? The parent index
> typically doesn't matter unless we're trying to communicate something
> from the framework to the provider driver. Put another way, I would
> think the provider driver can figure out the index itself without having
> to go through the framework to do so.

Isn't it a bit wasteful to duplicate information about the parent within
a provider if framework already has that info? The whole point of this
new API is to allow providers to avoid that unnecessary duplication.

Please note that clk_hw_get_parent_index is getting used only at the
resume time and not at suspend.

[snip]
