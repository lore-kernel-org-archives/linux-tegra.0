From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 00/27] 4.14.94-stable review
Date: Wed, 16 Jan 2019 16:56:08 +0000
Message-ID: <26826b67-6a6b-dc79-84de-4ce48212203e@nvidia.com>
References: <20190115154901.189747728@linuxfoundation.org>
 <794339d5-a1f8-7ae1-8c8c-fbef141cc81d@nvidia.com>
 <20190116160252.GB4594@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116160252.GB4594@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 16/01/2019 16:02, Greg Kroah-Hartman wrote:
> On Wed, Jan 16, 2019 at 09:25:12AM +0000, Jon Hunter wrote:
>>
>> On 15/01/2019 16:35, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 4.14.94 release.
>>> There are 27 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Thu Jan 17 15:48:28 UTC 2019.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.94-rc1.gz
>>> or in the git tree and branch at:
>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
>>> and the diffstat can be found below.
>>>
>>> thanks,
>>>
>>> greg k-h
>> All tests are passing for Tegra ...
>>
>> Test results for stable-v4.14:
>>     8 builds:	8 pass, 0 fail
>>     16 boots:	16 pass, 0 fail
>>     14 tests:	14 pass, 0 fail
>>
>> Linux version:	4.14.94-rc1-gec31b1a
>> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 
> Thanks for testing two of these.
> 
> How about 4.19 and 4.20?  Does modern kernels work on this hardware as
> well?  :)

We are not that advanced yet ;-)

Only joking, absolutely and in fact we have more devices/boards
supported in newer kernels so it would make sense. We are also testing
mainline and -next.

Unfortunately, it is a bit of a process to add new branches at the
moment simply because we are piggy backing on existing infrastructure
for testing that I personally do not own and so it needs to be approved.
However, nonetheless it is doable.

We were talking about adding v4.19 and then v4.20 popped up. I am not
sure if you have any ideas yet about the EOL for v4.20? I was just
wondering if we should prioritise v4.20 now over v4.19?

Cheers
Jon

-- 
nvpublic
