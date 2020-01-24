From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.19 000/639] 4.19.99-stable review
Date: Fri, 24 Jan 2020 18:07:51 +0000
Message-ID: <8a782263-aca3-3846-12a0-4eb21f015894@nvidia.com>
References: <20200124093047.008739095@linuxfoundation.org>
 <23f2a904-3351-4a75-aaaf-2623dc55d114@nvidia.com>
 <20200124173659.GD3166016@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200124173659.GD3166016@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 24/01/2020 17:36, Greg Kroah-Hartman wrote:
> On Fri, Jan 24, 2020 at 02:50:05PM +0000, Jon Hunter wrote:
>> Hi Greg,
>>
>> On 24/01/2020 09:22, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 4.19.99 release.
>>> There are 639 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Sun, 26 Jan 2020 09:26:29 +0000.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.99-rc1.gz
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
>>> Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>     PCI: PM: Skip devices in D0 for suspend-to-idle
>>
>> The above commit is causing a suspend regression on Tegra124 Jetson-TK1.
>> Reverting this on top of v4.19.99-rc1 fixes the issue.
> 
> This is also in the 4.14 queue, so should I drop it there too?

I did not see any failures with the same board on that branch, so I
would say no, but odd that it only fails here. It was failing for me
100% so I would have expected to see if there too if it was a problem.

Jon

-- 
nvpublic
