From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 00/19] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Tue, 10 Dec 2019 00:22:18 +0300
Message-ID: <323f5f70-5249-e75a-98cc-7fdca2d375c2@gmail.com>
References: <20191203004116.11771-1-digetx@gmail.com>
 <20191207215216.GA9561@qmqm.qmqm.pl>
 <0b3a861d-e5e8-ddca-ac60-0a3c61a9d9dc@gmail.com>
 <20191209160420.GA24097@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209160420.GA24097@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.12.2019 19:04, Michał Mirosław пишет:
> On Sun, Dec 08, 2019 at 01:56:14AM +0300, Dmitry Osipenko wrote:
>> 08.12.2019 00:52, Michał Mirosław пишет:
>>> On Tue, Dec 03, 2019 at 03:40:57AM +0300, Dmitry Osipenko wrote:
>>>> Hello,
>>>>
>>>> This series does the following:
>>>>
>>>>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>>>>      into common drivers/cpuidle/ directory.
>>>>
>>>>   2. Enables CPU cluster power-down idling state on Tegra30.
>>>>
>>>> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
>>>> and of the Tegra's arch code in general. Please review, thanks!
>>>
>>> I did a quick smoke test for this series on top of Linus' master:
>>>  - rebuilding with the patches applied, CONFIG_ARM_TEGRA_CPUIDLE=n - works
>>>  - building with CONFIG_ARM_TEGRA_CPUIDLE=y - doesn't boot
>>>
>>> The hang is somewhere early in the boot process, before simplefb can
>>> take the console and show any logs. If I get BOOTFB to work again I might
>>> be able to get some more info.
>>
>> Thank you very much for trying these patches!
>>
>> Could you please try to make ARM_TEGRA_CPUIDLE "tristate" in the Kconfig
>> and compile it as a loadable module? That way you'll get framebuffer
>> shown before the hang happens.
>>
>> Does LP2 suspend/resume work for you? There should be
>> "nvidia,suspend-mode = <2>" in the PMC's node of device-tree.
> 
> Not at the moment. I also tried suspend-mode = <1> and <0>, but it
> made no difference.

If LP2 doesn't work, then it explains why you're getting the hang.

Are you using TF300T for the testing? I'm recalling that LP2 worked for
you sometime ago on TF300T, maybe some offending change was introduced
since then. Could you please try to do the git bisection or at least
find out what is the last good kernel version?

I rebased this series on a recent linux-next and you could find the
rebased patches here [1].

[1] https://github.com/grate-driver/linux/commits/master

With [1] you should be able to remove "nvidia,suspend-mode" property
from the device-tree to get cpuidle working with the disabled CC6 state
(LP2). Could you please check that at least disabled CC6 works for you?
