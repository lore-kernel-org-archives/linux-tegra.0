From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/4] EMC fixes for Tegra30+
Date: Mon, 19 Nov 2018 20:05:09 +0300
Message-ID: <6f4eb4a5-e257-4faa-c5fb-12ffe1f5b3aa@gmail.com>
References: <20180830185404.7224-1-digetx@gmail.com>
 <d1f577d8-a944-35b6-89b3-ce4eafdd4808@gmail.com>
 <f0045dbb-c19a-cd5e-2e78-4b68ccc2342d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f0045dbb-c19a-cd5e-2e78-4b68ccc2342d@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19.11.2018 18:42, Jon Hunter wrote:
> 
> On 18/11/2018 22:06, Dmitry Osipenko wrote:
>> On 30.08.2018 21:54, Dmitry Osipenko wrote:
>>> Hello,
>>>
>>> This patch series fixes couple bugs in the memory self-refresh code.
>>> The EMC / MC state is properly restored after patches being applied,
>>> please review.
>>>
>>> Dmitry Osipenko (4):
>>>   ARM: tegra: Fix missed EMC registers latching on resume from LP1 on
>>>     Tegra30+
>>>   ARM: tegra: Fix DRAM refresh-interval clobbering on resume from LP1 on
>>>     Tegra30
>>>   ARM: tegra: Restore memory arbitration on resume from LP1 on Tegra30+
>>>   ARM: tegra: Clear EMC interrupts on resume from LP1 on Tegra30+
>>>
>>>  arch/arm/mach-tegra/iomap.h         |  9 ++++++++
>>>  arch/arm/mach-tegra/sleep-tegra30.S | 32 +++++++++++++++++++++++++++--
>>>  2 files changed, 39 insertions(+), 2 deletions(-)
>>>
>>
>> Hello Jon,
>>
>> Could you please test these patches using your testing setup? Will be awesome if you could give t-b/r-b to the series, then there should be a better chance that Thierry could apply it eventually ;)
> 
> Yes I will give them a test and let you know.

Thank you!
