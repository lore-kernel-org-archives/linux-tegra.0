From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 00/27] 4.14.94-stable review
Date: Wed, 16 Jan 2019 17:38:34 +0000
Message-ID: <f2e8bd8a-90f1-c7a8-1157-36e9c19eb384@nvidia.com>
References: <20190115154901.189747728@linuxfoundation.org>
 <794339d5-a1f8-7ae1-8c8c-fbef141cc81d@nvidia.com>
 <20190116160252.GB4594@kroah.com>
 <26826b67-6a6b-dc79-84de-4ce48212203e@nvidia.com>
 <20190116171153.GA10164@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190116171153.GA10164@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 16/01/2019 17:11, Greg Kroah-Hartman wrote:
> On Wed, Jan 16, 2019 at 04:56:08PM +0000, Jon Hunter wrote:
>>
>> On 16/01/2019 16:02, Greg Kroah-Hartman wrote:
>>> On Wed, Jan 16, 2019 at 09:25:12AM +0000, Jon Hunter wrote:
>>>>
>>>> On 15/01/2019 16:35, Greg Kroah-Hartman wrote:
>>>>> This is the start of the stable review cycle for the 4.14.94 release.
>>>>> There are 27 patches in this series, all will be posted as a response
>>>>> to this one.  If anyone has any issues with these being applied, please
>>>>> let me know.
>>>>>
>>>>> Responses should be made by Thu Jan 17 15:48:28 UTC 2019.
>>>>> Anything received after that time might be too late.
>>>>>
>>>>> The whole patch series can be found in one patch at:
>>>>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.94-rc1.gz
>>>>> or in the git tree and branch at:
>>>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
>>>>> and the diffstat can be found below.
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>> All tests are passing for Tegra ...
>>>>
>>>> Test results for stable-v4.14:
>>>>     8 builds:	8 pass, 0 fail
>>>>     16 boots:	16 pass, 0 fail
>>>>     14 tests:	14 pass, 0 fail
>>>>
>>>> Linux version:	4.14.94-rc1-gec31b1a
>>>> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>>>>                 tegra210-p2371-2180, tegra30-cardhu-a04
>>>
>>> Thanks for testing two of these.
>>>
>>> How about 4.19 and 4.20?  Does modern kernels work on this hardware as
>>> well?  :)
>>
>> We are not that advanced yet ;-)
> 
> So not everything for those platforms is upstream?  :(

No sorry! I really was joking. We have enough upstream to test all these
platforms (plus a couple more) today :-)

>> Only joking, absolutely and in fact we have more devices/boards
>> supported in newer kernels so it would make sense. We are also testing
>> mainline and -next.
>>
>> Unfortunately, it is a bit of a process to add new branches at the
>> moment simply because we are piggy backing on existing infrastructure
>> for testing that I personally do not own and so it needs to be approved.
>> However, nonetheless it is doable.
>>
>> We were talking about adding v4.19 and then v4.20 popped up. I am not
>> sure if you have any ideas yet about the EOL for v4.20? I was just
>> wondering if we should prioritise v4.20 now over v4.19?
> 
> I was just curious, if everything was upstream (like the boards that
> linaro tests for), then running 4.19 should be just the same as 4.20.
> But if you have big out-of-tree patchsets, that's a totally different
> story.

Yes testing stable-v4.19/v4.20 is straight forward and will work today.
I just need to go through the process of setting it up and requesting
this. However, while you were asking, I was curious if you had any idea
of the projected EOL for stable-v4.20 yet?

Cheers!
Jon

-- 
nvpublic
