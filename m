From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 000/267] 4.14.159-stable review
Date: Tue, 17 Dec 2019 11:27:22 +0000
Message-ID: <c067e2f2-e9ec-6006-21b9-a1fd4d508d21@nvidia.com>
References: <20191216174848.701533383@linuxfoundation.org>
 <20191217090548.GA2801817@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191217090548.GA2801817@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 17/12/2019 09:05, Greg Kroah-Hartman wrote:
> On Mon, Dec 16, 2019 at 06:45:26PM +0100, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.14.159 release.
>> There are 267 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Wed, 18 Dec 2019 17:41:25 +0000.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.159-rc1.gz
>> or in the git tree and branch at:
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
>> and the diffstat can be found below.
> 
> There is a -rc2 out now to resolve some reported issues:
>  	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.159-rc2.gz


All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    24 tests:	24 pass, 0 fail

Linux version:	4.14.159-rc2-g66745e000c83
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
