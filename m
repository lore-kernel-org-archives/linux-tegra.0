From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.4 00/43] 4.4.201-stable review
Date: Tue, 12 Nov 2019 12:00:09 +0000
Message-ID: <4171f826-d86d-6874-928d-c9367453a1fc@nvidia.com>
References: <20191111181246.772983347@linuxfoundation.org>
 <20191112052741.GA1208865@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191112052741.GA1208865@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 12/11/2019 05:27, Greg Kroah-Hartman wrote:
> On Mon, Nov 11, 2019 at 07:28:14PM +0100, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.4.201 release.
>> There are 43 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Wed, 13 Nov 2019 18:08:44 +0000.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.201-rc1.gz
> 
> -rc2 is out:
>  	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.201-rc2.gz
> 


All tests for Tegra are passing ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail
    19 tests:	19 pass, 0 fail

Linux version:	4.4.201-rc2-gca1d1b5f0f2a
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
