From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.19 000/321] 4.19.88-stable review
Date: Wed, 4 Dec 2019 14:53:24 +0000
Message-ID: <4f1552b1-ff6b-7342-b66e-04685aacf6ea@nvidia.com>
References: <20191203223427.103571230@linuxfoundation.org>
 <79c636e7-145b-3062-04a3-f03c78d51318@nvidia.com>
 <20191204112936.GA3565947@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191204112936.GA3565947@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 04/12/2019 11:29, Greg Kroah-Hartman wrote:
> On Wed, Dec 04, 2019 at 09:45:31AM +0000, Jon Hunter wrote:
>>
>> On 03/12/2019 22:31, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 4.19.88 release.
>>> There are 321 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Thu, 05 Dec 2019 22:30:32 +0000.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.88-rc1.gz
>>> or in the git tree and branch at:
>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
>>> and the diffstat can be found below.
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>> -------------
>>> Pseudo-Shortlog of commits:
>>
>> ...
>>
>>> Ding Tao <miyatsu@qq.com>
>>>     arm64: dts: marvell: armada-37xx: Enable emmc on espressobin
>>
>> The above commit is causing the following build failure for ARM64 ...
>>
>>   DTC     arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: ERROR
>> (phandle_references): /soc/internal-regs@d0000000/sdhci@d0000: Reference
>> to non-existent node or label "sdio_pins"
>>
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: ERROR
>> (phandle_references): /soc/internal-regs@d0000000/sdhci@d8000: Reference
>> to non-existent node or label "mmc_pins"
> 
> Thanks for letting me know, I'll go drop this one and push out a -rc2
> with that removed.


Great! All tests now passing for Tegra ...

Test results for stable-v4.19:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	4.19.88-rc2-gba731ec12c66
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
