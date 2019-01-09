From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.9 00/71] 4.9.149-stable review
Date: Wed, 9 Jan 2019 10:46:43 +0000
Message-ID: <5fafb2d8-04db-4a9f-0af6-1b1aa014da80@nvidia.com>
References: <20190107105330.280153213@linuxfoundation.org>
 <20190108121822.GB3884@kroah.com> <20190108121925.GD3884@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190108121925.GD3884@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 08/01/2019 12:19, Greg Kroah-Hartman wrote:
> On Tue, Jan 08, 2019 at 01:18:22PM +0100, Greg Kroah-Hartman wrote:
>> On Mon, Jan 07, 2019 at 01:32:29PM +0100, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 4.9.149 release.
>>> There are 71 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Wed Jan  9 10:53:04 UTC 2019.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.149-rc1.gz
>>
>> -rc4 is now out, hopefully this is the last one...
>>  	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.149-rc1.gz
> 
> And here's the real url:
> 
>  	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.149-rc4.gz

All tests are passing for Tegra ...

Test results for stable-v4.9:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version:	4.9.149-rc4-g8af94cd
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
