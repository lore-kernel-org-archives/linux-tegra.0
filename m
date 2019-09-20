From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5.3 00/21] 5.3.1-stable review
Date: Fri, 20 Sep 2019 17:01:35 +0100
Message-ID: <773b556a-acc2-c3e0-14e6-956a6d0b3bed@nvidia.com>
References: <20190919214657.842130855@linuxfoundation.org>
 <572eca6e-47a9-c554-c6b2-bafd4c5df18b@nvidia.com>
 <20190920142432.GA601228@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920142432.GA601228@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 20/09/2019 15:24, Greg Kroah-Hartman wrote:
> On Fri, Sep 20, 2019 at 02:54:26PM +0100, Jon Hunter wrote:
>>
>> On 19/09/2019 23:03, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 5.3.1 release.
>>> There are 21 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Sat 21 Sep 2019 09:44:25 PM UTC.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.3.1-rc1.gz
>>> or in the git tree and branch at:
>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.3.y
>>> and the diffstat can be found below.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> No new regressions* for Tegra ...
>>
>> Test results for stable-v5.3:
>>     12 builds:	12 pass, 0 fail
>>     22 boots:	22 pass, 0 fail
>>     38 tests:	37 pass, 1 fail
>>
>> Linux version:	5.3.1-rc1-g0aa7f3d6baae
>> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>>                 tegra194-p2972-0000, tegra20-ventana,
>>                 tegra210-p2371-2180, tegra30-cardhu-a04
>>
>> * Note we had one regression in v5.3 for a warnings test for Tegra194
>>   causing the above test failure. This has since been fixed by the
>>   following commits [0] but given it is just a warning, I have not
>>   bothered CC'ing for stable.
>>
>> Cheers
>> Jon
>>
>> [0] https://lkml.org/lkml/2019/8/21/602
> 
> I'll be glad to take this in stable for 5.3.y, what is the git commit
> id?

OK, that would be great. The IDs are ...

commit 763719771e84b8c8c2f53af668cdc905faa608de
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Wed Aug 21 16:02:40 2019 +0100

    clocksource/drivers/timer-of: Do not warn on deferred probe


commit 14e019df1e64c8b19ce8e0b3da25b6f40c8716be
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Wed Aug 21 16:02:41 2019 +0100

    clocksource/drivers: Do not warn on probe defer


> Also, thanks for testing all of these and letting me know.

No problem!

Cheers
Jon

-- 
nvpublic
