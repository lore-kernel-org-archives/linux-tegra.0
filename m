From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 000/101] 4.14.92-stable review
Date: Wed, 9 Jan 2019 10:47:44 +0000
Message-ID: <c146718b-5fbc-aff5-9236-54037234bf88@nvidia.com>
References: <20190107105330.372621917@linuxfoundation.org>
 <20190108121905.GC3884@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190108121905.GC3884@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 08/01/2019 12:19, Greg Kroah-Hartman wrote:
> On Mon, Jan 07, 2019 at 01:31:48PM +0100, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.14.92 release.
>> There are 101 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Wed Jan  9 10:53:00 UTC 2019.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.92-rc1.gz
> 
> -rc3 is out to hopefully fix the last reported build issue:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.92-rc3.gz

All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version:	4.14.92-rc3-gd679908
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
