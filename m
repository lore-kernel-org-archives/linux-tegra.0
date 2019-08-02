From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Fri, 2 Aug 2019 17:26:45 +0300
Message-ID: <218c3d60-1a56-7ee8-840b-7d0559cd8c8e@gmail.com>
References: <20190730174020.15878-1-digetx@gmail.com>
 <20190802133846.GC3883@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802133846.GC3883@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.08.2019 16:38, Peter De Schrijver пишет:
> On Tue, Jul 30, 2019 at 08:40:19PM +0300, Dmitry Osipenko wrote:
>> The PCLK clock is running off SCLK, which is a critical clock that is
>> very unlikely to randomly change its rate. It is possible to get a
>> lockup if kernel decides to enter LP2 cpuidle from a clk-notifier, which
>> happens occasionally in a case of Tegra30 EMC driver that waits for the
>> clk-change event in the clk-notify handler, because CCF's 'prepare' mutex
>> in kept locked and thus clk_get_rate() wants to sleep with interrupts
>> being disabled.
>>
> 
> I don't think this is the right solution. Eventually we will want to
> scale sclk and pclk because the clock tree power of those is not
> insignificant. Maybe register a notifier which updates the PMC timer
> values when pclk changes?

I also had a thought about the notifier for pclk, but wasn't sure if
it's really worthwhile right now since there is no real use-case and
it's not obvious when such case will materialize. So, I'd say that
solution is correct but incomplete.

I'll make a v4 with the notifier, since you're asking about it. Thanks
for the review!
