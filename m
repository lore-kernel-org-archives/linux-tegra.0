From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 11/20] cpufreq: tegra124: Add suspend and resume
 support
Date: Thu, 1 Aug 2019 10:51:40 -0700
Message-ID: <69aba3b2-d021-4851-d058-fcaa70446f58@nvidia.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-12-git-send-email-skomatineni@nvidia.com>
 <20190801054055.trmabmcaj3cpe4pc@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801054055.trmabmcaj3cpe4pc@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/31/19 10:40 PM, Viresh Kumar wrote:
> On 31-07-19, 14:10, Sowjanya Komatineni wrote:
>> This patch adds suspend and resume pm ops for cpufreq driver.
>>
>> PLLP is the safe clock source for CPU during system suspend and
>> resume as PLLP rate is below the CPU Fmax at Vmin.
>>
>> CPUFreq driver suspend switches the CPU clock source to PLLP and
>> disables the DFLL clock.
>>
>> During system resume, warmboot code powers up the CPU with PLLP
>> clock source. So CPUFreq driver resume enabled DFLL clock and
>> switches CPU back to DFLL clock source.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/cpufreq/tegra124-cpufreq.c | 60 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
> Is there any hard dependency of this patch on the rest of the patches?
> Can I apply it alone to cpufreq tree ?
>
This patch cannot be applied alone as it has dependency on dfll clock 
suspend and resume sequence.
