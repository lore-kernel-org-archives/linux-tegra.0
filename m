From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Mon, 23 Mar 2020 16:45:57 +0300
Message-ID: <b3859b98-02a3-d197-735c-2c9a9fbe597c@gmail.com>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <48b2099c-dd83-d4dc-aab4-8c6f68a215cf@gmail.com>
 <da2a0501-664a-c5d0-7b13-174e5347eaf7@gmail.com>
 <20200323134221.GI3883508@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200323134221.GI3883508@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.03.2020 16:42, Thierry Reding пишет:
> On Fri, Mar 20, 2020 at 06:38:32PM +0300, Dmitry Osipenko wrote:
>> 20.03.2020 18:11, Dmitry Osipenko пишет:
>>> 20.03.2020 16:34, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Currently this only supports a single watchdog, which uses a timer in
>>>> the background for countdown. Eventually the timers could be used for
>>>> various time-keeping tasks, but by default the architected timer will
>>>> already provide that functionality.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> ---
>>>
>>> ...
>>>> +config TEGRA186_TIMER
>>>> +	bool "NVIDIA Tegra186 timer driver"
>>>
>>> tristate?
>>>
>>>> +	depends on ARCH_TEGRA || COMPILE_TEST
>>>
>>> depends on WATCHDOG && WATCHDOG_CORE?
>>
>> Actually `select WATCHDOG_CORE` for the WATCHDOG_CORE.
> 
> WATCHDOG_CORE is user-visible, so it's not safe to select it. Any reason
> depends on WATCHDOG && WATCHDOG_CORE wouldn't work? I guess a dependency
> on WATCHDOG_CORE would be enough because that itself already depends on
> WATCHDOG.

It looks to that should be much better if you could factor out all the
watchdog functionality into the drivers/watchdog, like it's done in a
case of MC / SMMU drivers for example.
