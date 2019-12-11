From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4.19 000/243] 4.19.89-stable review
Date: Wed, 11 Dec 2019 15:48:43 -0800
Message-ID: <1c0a27c1-1c98-347f-fcd4-9ec057e1e362@roeck-us.net>
References: <20191211150339.185439726@linuxfoundation.org>
 <7b43a504-160f-e793-99b2-bcb79d331b6a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7b43a504-160f-e793-99b2-bcb79d331b6a@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 12/11/19 1:36 PM, Jon Hunter wrote:
> 
> On 11/12/2019 15:02, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.19.89 release.
>> There are 243 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Fri, 13 Dec 2019 14:56:06 +0000.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.89-rc1.gz
>> or in the git tree and branch at:
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
>> and the diffstat can be found below.
>>
>> thanks,
>>
>> greg k-h
>>
>> -------------
>> Pseudo-Shortlog of commits:
> 
> ...
> 
>> Linus Walleij <linus.walleij@linaro.org>
>>      gpio: OF: Parse MMC-specific CD and WP properties
> 
> The above change is causing intermittent failures on Tegra30 eMMC.
> Reverting this change on top of the 4.19.89-rc1 fixes the problem.
> 

Thanks for tracking that down. I see boot failures for arm:vexpress-a9
when trying to boot from mmc.

I dimly recall that I have seen this before. Ah yes ... commit 89a5e15bcba8
("gpio/mmc/of: Respect polarity in the device tree") fixes the above commit.
Can you give it a try ?

One may wonder though why the parsing code was backported in the first place.
It doesn't look like a bug fix to me.

Thanks,
Guenter
