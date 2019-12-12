From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5.3 000/105] 5.3.16-stable review
Date: Thu, 12 Dec 2019 13:16:50 +0000
Message-ID: <e7fe3384-3482-3a8b-4908-328660d47c3e@nvidia.com>
References: <20191211150221.153659747@linuxfoundation.org>
 <20191212100456.GB1470066@kroah.com> <20191212121805.GB1540720@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191212121805.GB1540720@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 12/12/2019 12:18, Greg Kroah-Hartman wrote:
> On Thu, Dec 12, 2019 at 11:04:56AM +0100, Greg Kroah-Hartman wrote:
>> On Wed, Dec 11, 2019 at 04:04:49PM +0100, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 5.3.16 release.
>>> There are 105 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Fri, 13 Dec 2019 14:56:06 +0000.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.3.16-rc1.gz
>>> or in the git tree and branch at:
>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.3.y
>>> and the diffstat can be found below.
>>
>> I have pushed out -rc2 with a number of additional fixes:
>> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.3-rc2.gz
> 
> That was the 5.4 patch, here is the correct 5.3 patch:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.3.16-rc2.gz
> 


All tests are passing for Tegra ...

Test results for stable-v5.3:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	5.3.16-rc2-g9f27b7f4a193
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
