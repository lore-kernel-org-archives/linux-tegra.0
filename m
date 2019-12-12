From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.19 000/243] 4.19.89-stable review
Date: Thu, 12 Dec 2019 13:15:25 +0000
Message-ID: <6cf4afbe-4fa3-6bbd-4090-ff9764c4fce1@nvidia.com>
References: <20191211150339.185439726@linuxfoundation.org>
 <20191212100524.GC1470066@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191212100524.GC1470066@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 12/12/2019 10:05, Greg Kroah-Hartman wrote:
> On Wed, Dec 11, 2019 at 04:02:42PM +0100, Greg Kroah-Hartman wrote:
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
> 
> I have pushed out -rc2 with a bunch of fixes for existing issues, and
> some new fixes:
>  	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.89-rc2.gz
> 


All tests are passing for Tegra ...

Test results for stable-v4.19:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	4.19.89-rc2-gb71ac9dfc6f0
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
