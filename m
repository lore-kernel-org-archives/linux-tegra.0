From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.9 00/44] 4.9.154-stable review
Date: Thu, 31 Jan 2019 10:15:38 +0000
Message-ID: <28e5a819-1cce-c255-2db5-229a5bbd5f60@nvidia.com>
References: <20190129113139.826927690@linuxfoundation.org>
 <f2d2a32f-68c9-8bfe-54c7-93b617ee2eb3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f2d2a32f-68c9-8bfe-54c7-93b617ee2eb3@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 30/01/2019 12:50, Jon Hunter wrote:
> 
> On 29/01/2019 11:35, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.9.154 release.
>> There are 44 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Thu Jan 31 11:31:22 UTC 2019.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.154-rc1.gz
>> or in the git tree and branch at:
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
>> and the diffstat can be found below.
>>
>> thanks,
>>
>> greg k-h
> I see you have posted a rc2, but for rc1 all tests are passing for
> Tegra. Should have results for rc2 tonight.
> 
> Test results for stable-v4.9:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     14 tests:	14 pass, 0 fail
> 
> Linux version:	4.9.154-rc1-g5c2f707
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

To confirm, rc2 looks fine as well ...

Test results for stable-v4.9:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version:	4.9.154-rc2-g6674590
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
