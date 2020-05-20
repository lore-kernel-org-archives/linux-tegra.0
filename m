From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Date: Wed, 20 May 2020 05:19:27 +0300
Message-ID: <6b081a10-b150-b07f-2852-743e41ed053c@gmail.com>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
 <20200519160835.GC2113674@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200519160835.GC2113674@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

19.05.2020 19:08, Thierry Reding пишет:
> On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
>> 15.05.2020 17:39, Thierry Reding пишет:
>>> Hi,
>>>
>>> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
>>>
>>>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c
>>>
>>> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
>>>
>>>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)
>>>
>>> Thanks,
>>> Thierry
>>>
>>> ----------------------------------------------------------------
>>> i2c: tegra: Changes for v5.8-rc1
>>>
>>> This includes a few improvements to make the Tegra I2C controller behave
>>> properly on suspend/resume, does a bit of cleanup and adds support for
>>> the VI-variant of the I2C controller that is used primarily for video
>>> capture purposes.
>>>
>>> ----------------------------------------------------------------
>>> Dmitry Osipenko (2):
>>>       i2c: tegra: Better handle case where CPU0 is busy for a long time
>>>       i2c: tegra: Synchronize DMA before termination
>>>
>>> Thierry Reding (5):
>>>       Revert "i2c: tegra: Fix suspending in active runtime PM state"
>>
>>>       i2c: tegra: Restore pinmux on system resume
>>
>> In general this series is good to me, although I have some concerns
>> about this patch. Could you please answer the review comments?
> 
> Sorry, those had been burried under too much email. I've answered your
> questions now.

Hello Thierry,

Thank you for the answers, I'd also want to see the answer to the
question about how RPM works, i.e. why I2C is RPM-resumed during
system's suspend in some cases and not the others.
