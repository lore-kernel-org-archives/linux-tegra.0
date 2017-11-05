From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: T20 Cpuidle Freeze
Date: Sun, 5 Nov 2017 16:16:36 +0300
Message-ID: <b18cd8ea-5a2a-0d00-cc65-fa005e843049@gmail.com>
References: <1509714423.21320.11.camel@toradex.com>
 <ddd84466-c4db-c2a0-c646-2ce6c2936806@gmail.com>
 <1509828560.21320.19.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509828560.21320.19.camel@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

On 04.11.2017 23:49, Marcel Ziswiler wrote:
> On Fri, 2017-11-03 at 21:52 +0300, Dmitry Osipenko wrote:
>> I haven't seen any problems with the cpuidle on next and 4.14-rc7
>> works fine.
>>
>> # cat /sys/devices/system/cpu/cpu[0-1]/cpuidle/state[0-1]/usage
>> 162283
>> 32905
>> 254669
>> 32905
>>
>> # cat /sys/devices/system/cpu/cpu[0-1]/cpuidle/state[0-1]/time
>> 436981763
>> 2110484666
>> 458260707
>> 2121781516
>>
>> # uptime
>>  18:50:24 up 44 min,  1 user,  load average: 0.15, 0.08, 0.07
> 
> OK, thanks. Good to know.
> 
>> It could be that cpuidle unmasks some other issue on the Colibri.
> 
> Yes, that's also my thinking.
> 
> What hardware did you run this on?
> 

I ran it on Acer A500 tablet, which is tegra20.

> Does your kernel configuration differ from the stock tegra_defconfig I used?
> 

Doesn't differ, used stock tegra_defconfig as well.

> What exact device tree source are you using (or just stock)?
> 

https://gist.github.com/digetx/2f624a0df4caff657ef28863b5354d5b

> Maybe the compiler version you are using could also have some influence?
> 

Compiler bugs aren't rareness, I'm using armv7a-hardfloat-linux-gnueabi-gcc
(Gentoo 6.4.0 p1.0) 6.4.0

> If you have any additional suggestions on what else could be relevant please let me know.
> 

1) I suppose you could attach JTAG and see where hang happens.

2) Enable all kernel debug Kconfig options.

3) Disable all non-critical device drivers in Kconfig, so that you could boot.
See if it makes difference.

4) Probably just adding some debug printk's would be good enough to localize the
offending place in the code.
