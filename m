From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
Date: Fri, 27 May 2016 13:46:37 +0100
Message-ID: <574841AD.8090601@nvidia.com>
References: <1460900051-3065-1-git-send-email-digetx@gmail.com>
 <572B47DE.1090804@nvidia.com>
 <c4a3fb3f-adb8-c167-d660-55d3f803c9c3@gmail.com> <5745C02A.20308@nvidia.com>
 <d3552444-75b6-a624-589d-5391d7c09526@gmail.com>
 <5746B6F7.9040101@nvidia.com>
 <e10126b7-de8d-3cee-a1be-d38eb1d7021f@gmail.com>
 <574708E8.3060308@nvidia.com>
 <d7a01310-869e-197e-9fbe-5b4783629e10@gmail.com>
 <574715D7.4060004@nvidia.com>
 <6bfd97bc-7e09-973d-e3c3-7e86b08a4550@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <6bfd97bc-7e09-973d-e3c3-7e86b08a4550@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 26/05/16 18:01, Dmitry Osipenko wrote:
> On 26.05.2016 18:27, Jon Hunter wrote:
>> On 26/05/16 15:57, Dmitry Osipenko wrote:

...

>>> That's how I see it:
>>>
>>> +----------------------------------------------+
>>> |                    CPU 0                     |
>>> +-------------------+--------------------------+
>>> |    Idle thread    | Interactive gov. thread  |
>>> +----------------------------------------------+
>>> |     inactive      |                          |
>>> |                   |                          |
>>> |                   |   CPU freq. change       |
>>> |                   |                          |
>>> |                   |   clk_set_rate()         |
>>> |                   |                          |
>>> |       ...         |   clk_prepare_lock()     |
>>> |                   |                          |
>>> |                   |   PRE rate notifier call |
>>> |                   |                          |
>>> |                   |   schedule               |
>>
>> What is this notifier doing? Is there some sort of hardware activity
>> that it is waiting for to complete?
>>
> 
> It changes regulator voltage if required. So at least I2C would cause
> scheduling on wait_for_completion_timeout().

Yes, of course that would make sense. What is interesting/odd in this
case is that the frequency is increasing (voltage scaled pre frequency
change) but yet you are entering LP2. May be that is possible? I guess
this problem may also occur on reducing frequency as well?

What are you using in the v3.18 kernel for exit_latency and
target_residency? The current mainline has 5000us and 10000us,
respectively.

It does seem that this could be triggered in the right circumstances and
I have to say I don't like the fact that this could be fragile as it is
today. Have you thought about adding a post clock notifier for pclk in
the PMC driver as an alternative to the change you are suggesting?

Cheers
Jon

-- 
nvpublic
