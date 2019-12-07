From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 00/19] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Sun, 8 Dec 2019 01:56:04 +0300
Message-ID: <d13eaf7b-7a85-2b7d-ac41-ebc89f8e8b82@gmail.com>
References: <20191203004116.11771-1-digetx@gmail.com>
 <20191207193128.GB19924@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191207193128.GB19924@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.12.2019 22:31, Michał Mirosław пишет:
> On Tue, Dec 03, 2019 at 03:40:57AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series does the following:
>>
>>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>>      into common drivers/cpuidle/ directory.
>>
>>   2. Enables CPU cluster power-down idling state on Tegra30.
>>
>> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
>> and of the Tegra's arch code in general. Please review, thanks!
>>
>> Changelog:
>>
>> v8: - Rebased on recent linux-next, now making use of
>>       cpuidle_driver_state_disabled(). [...]
> 
> Dear Dmitry
> 
> This rebase was not complete, at least in patch 14 direct access to
> .disabled field (now removed in Linus' master) are left. The fixups
> needed are below (only compile-tested for now).

Hello Michał,

CPUIDLE core got changed after this series was sent out, I'll rebase it
one more time. Thank you for the attention.

[snip]
