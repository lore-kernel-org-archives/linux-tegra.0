From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Tue, 21 Apr 2020 18:08:57 +0300
Message-ID: <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

21.04.2020 17:40, Jon Hunter пишет:
> 
> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>> 21.04.2020 12:49, Jon Hunter пишет:
>> ...
>>> I can try the above, but I agree it would be best to avoid messing with
>>> the suspend levels if possible.
>>
>> Will be awesome if you could try it and report back the result.
>>
> 
> I gave it a try but suspend still fails.

Perhaps the RPM's -EACCES is returned from here:

https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/power/runtime.c#L723

Which suggests that I2C is accessed after being suspended. I guess the
PCIe driver suspends after the I2C and somehow my change affected the
suspension order, although not sure how.

Jon, could you please try to enable PM logging and post the log? Please
also post log of the working kernel version, so that we could compare
the PM sequence.

Something like this should enable the logging: "echo 1 >
/sys/power/pm_trace" + there is RPM tracing.
