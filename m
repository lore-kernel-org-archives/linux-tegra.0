From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 0/8] Support Trusted Foundations firmware on Tegra30
Date: Wed, 20 Feb 2019 20:01:55 +0300
Message-ID: <ba276a8f-57fb-4565-817a-6f7ee4175d41@gmail.com>
References: <20190218001726.16785-1-digetx@gmail.com>
 <c6d761cf-370c-c4f7-931b-d2333e02f2dc@gmail.com>
 <20190220163614.GA11116@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220163614.GA11116@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

20.02.2019 19:36, Michał Mirosław пишет:
> On Wed, Feb 20, 2019 at 04:30:20PM +0300, Dmitry Osipenko wrote:
>> 18.02.2019 3:17, Dmitry Osipenko пишет:
>>> Hello,
>>>
>>> This patchset adds support for the Trusted Foundations firmware on
>>> NVIDIA Tegra30. Pretty much all of Tegra30 consumer devices have that
>>> firmware and upstream kernel can't boot on those devices without the
>>> firmware support.
>>
>> Hello Michał,
>>
>> Will be awesome if you could test the series on yours TF300T and report back, thanks in advance!
> 
> I think I will be able to look into this during the weekend. Which
> kernel tree do you suggest as base?

Either linux-next (preferably) or the mainline v5.0 will be fine, there were no much changes for the last year in the code that this patchset touches. You could also try the grate-kernel [0] which has some extra patches that were not submitted to upstream yet, please try it if you'll experience some problems.

[0] https://github.com/grate-driver/linux/commits/master

Please test the following:

1) Kernel boots fine with all 4 CPU cores up and running.

2) LP2 CPU idling works. Test it by disabling the secondary cores:

# echo 0 | tee /sys/devices/system/cpu/cpu[1-3]/online

3) LP1 suspend-resume works. Make sure that "nvidia,suspend-mode" is set to "1" in the PMC device-tree node and that the other relevant properties are set up correctly (copy the values from TF300T downstream kernel). Test it by running this command (multiple times):

# rtcwake -m mem -s 1
