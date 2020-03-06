From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
Date: Sat, 7 Mar 2020 02:11:46 +0300
Message-ID: <6047f07b-c0af-08c8-90d1-79a0d880e0a2@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org>
 <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
 <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
 <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Jens Axboe <axboe@kernel.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.03.2020 16:37, Ulf Hansson пишет:
...
>>
>> Technically, it should be possible to chain-load some custom secondary
>> bootloader instead of a kernel image, but this is not very practical
>> because now:
>>
>> 1. There is a need to make a custom bootloader and it is quite a lot of
>> work.
>>
>> 2. You'll have to tell everybody that a custom booloader may need to be
>> used in order to get a working eMMC.
> 
> Yeah, I get the point. It's not an optimal situation, but I assume
> it's about informing developers. They can cope with this, no?

Perhaps no, it's not only about the informing. The need for a custom
bootloader creates other inconveniences because:

1. It won't be possible to boot a vanilla upstream kernel using
Android's "fastboot boot ..." without applying extra patches to kernel
for the partition table support. Advanced users usually tend to use
fastboot and it's also very useful for a regular development purposes as
well.

2. Somebody (a developer / advanced user) will have to create a custom
bootloader for each device in the first place. This is not what an
average person will be able to do and there are not that many developers
who would want to dedicate theirs time to this.

3. The entry barrier for upstreaming Android devices support to the
kernel is already quite enormous. Adding extra hurdles isn't a step into
the right direction, IMO.

>> 3. NVIDIA's bootloader already passes a command line parameter to kernel
>> for locating GPT entry, but this hack is not acceptable for the upstream
>> kernel.
> 
> Well, I am just worried that we will end up with one partition format
> per vendor/product, that wouldn't scale very well.
> 
> In any case, from mmc point of view I am less concerned, we can find a
> way to support the needed bits. I just need to review the series more
> carefully and provide some comments. :-)
> 
> However, before I do that, I would like to hear Jens opinion about
> adding a new partition format, so I don't waste my time here.

Sure, no problems :) Let's wait for the comments from Jens.
