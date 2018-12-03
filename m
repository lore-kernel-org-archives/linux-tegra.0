From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 000/100] 4.14.85-stable review
Date: Mon, 3 Dec 2018 11:38:11 +0000
Message-ID: <b5b29547-b091-b29f-55c2-7729d7ada10f@nvidia.com>
References: <20181129140058.768942700@linuxfoundation.org>
 <20181130152948.GB31416@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181130152948.GB31416@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 30/11/2018 15:29, Greg Kroah-Hartman wrote:
> On Thu, Nov 29, 2018 at 03:11:30PM +0100, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.14.85 release.
>> There are 100 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Sat Dec  1 14:00:29 UTC 2018.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.85-rc1.gz
> 
> I have released a -rc2:
> 	ttps://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.85-rc2.gz
> to resolve some reported issues.

Sorry this is late, but all tests passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version:	4.14.85-rc2-gce3bc71
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
