From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4.19 000/639] 4.19.99-stable review
Date: Sat, 25 Jan 2020 11:32:59 +0000
Message-ID: <87fcb1f0-b1b8-a6e2-b8f6-b95a07f67919@nvidia.com>
References: <20200124093047.008739095@linuxfoundation.org>
 <23f2a904-3351-4a75-aaaf-2623dc55d114@nvidia.com>
 <20200124173659.GD3166016@kroah.com>
 <8a782263-aca3-3846-12a0-4eb21f015894@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8a782263-aca3-3846-12a0-4eb21f015894-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 24/01/2020 18:07, Jon Hunter wrote:
> 
> On 24/01/2020 17:36, Greg Kroah-Hartman wrote:
>> On Fri, Jan 24, 2020 at 02:50:05PM +0000, Jon Hunter wrote:
>>> Hi Greg,
>>>
>>> On 24/01/2020 09:22, Greg Kroah-Hartman wrote:
>>>> This is the start of the stable review cycle for the 4.19.99 release.
>>>> There are 639 patches in this series, all will be posted as a response
>>>> to this one.  If anyone has any issues with these being applied, please
>>>> let me know.
>>>>
>>>> Responses should be made by Sun, 26 Jan 2020 09:26:29 +0000.
>>>> Anything received after that time might be too late.
>>>>
>>>> The whole patch series can be found in one patch at:
>>>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.99-rc1.gz
>>>> or in the git tree and branch at:
>>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
>>>> and the diffstat can be found below.
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>>
>>>> -------------
>>>> Pseudo-Shortlog of commits:
>>>
>>> ...
>>>
>>>> Rafael J. Wysocki <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>>>     PCI: PM: Skip devices in D0 for suspend-to-idle
>>>
>>> The above commit is causing a suspend regression on Tegra124 Jetson-TK1.
>>> Reverting this on top of v4.19.99-rc1 fixes the issue.
>>
>> This is also in the 4.14 queue, so should I drop it there too?
> 
> I did not see any failures with the same board on that branch, so I
> would say no, but odd that it only fails here. It was failing for me
> 100% so I would have expected to see if there too if it was a problem.

Hmmm, rc2 still not working for me ...

Test results for stable-v4.19:
    11 builds:	11 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	30 pass, 2 fail

Linux version:	4.19.99-rc2-g24832ad2c623
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

I still see the following commit in rc2 ...

commit bb52152abe85f971278a7a4f033b29483f64bfdb
Author: Rafael J. Wysocki <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date:   Thu Jun 13 23:59:45 2019 +0200

    PCI: PM: Skip devices in D0 for suspend-to-idle

BTW, I checked the 4.14. queue and I do not see the above change in
there, however, there is similar change ...

Rafael J. Wysocki <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
    PCI: PM: Avoid possible suspend-to-idle issue

Cheers
Jon

-- 
nvpublic
