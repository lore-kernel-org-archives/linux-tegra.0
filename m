From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 16:15:21 +0300
Message-ID: <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
References: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200427103851.GB24446@kunai>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

27.04.2020 13:38, Wolfram Sang пишет:
> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>> 27.04.2020 10:48, Thierry Reding пишет:
>> ...
>>>> Maybe but all these other problems appear to have existed for sometime
>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>> best for v5.7.
>>>
>>> To me it doesn't sound like we have a good handle on what exactly is
>>> going on here and we're mostly just poking around.
>>>
>>> And even if things weren't working quite properly before, it sounds to
>>> me like this patch actually made things worse.
>>
>> There is a plenty of time to work on the proper fix now. To me it sounds
>> like you're giving up on fixing the root of the problem, sorry.
> 
> From what I understood, there were (at least) two regressions reported.
> So, to me, it makes sense to revert the change, so for upstream users
> everything stays "the same". Of course, this does not mean it should
> stay like this forever and you guys can work on fixing the root causes.
> I'll happily apply them for this release when you are confident with the
> results.
> 

For now it's a single regression in the PCIe driver and it's actually
not a regression, but a PCIe driver bug that needs to be fixed. The I2C
part should be okay.

By reverting the I2C patch, we're back to the PCIe bug being papered
over and I don't like this. Let's just fix the PCIe driver and the
problem is gone.. it needs to be fixed anyways.
