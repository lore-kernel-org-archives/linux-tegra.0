From: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 5.4 000/344] 5.4.22-stable review
Date: Fri, 21 Feb 2020 13:57:20 +0200
Message-ID: <f671fbf6-1cd5-ae8a-82e7-d3aba63e9840@ti.com>
References: <20200221072349.335551332@linuxfoundation.org>
 <529a5a4a-974e-995a-9556-c2a14d09bb5d@nvidia.com>
 <CA+G9fYv-KC0v++YsyXR-rhC2JBGUfhNGD+XYaZjN3fJSX1x_mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+G9fYv-KC0v++YsyXR-rhC2JBGUfhNGD+XYaZjN3fJSX1x_mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, Ben Hutchings <ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux- stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21/02/2020 13:17, Naresh Kamboju wrote:
> On Fri, 21 Feb 2020 at 15:34, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>
>> On 21/02/2020 07:36, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 5.4.22 release.
>>> There are 344 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Sun, 23 Feb 2020 07:19:49 +0000.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>>        https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.22-rc1.gz
>>> or in the git tree and branch at:
>>>        git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
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
>>> Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
>>>      ARM: OMAP2+: pdata-quirks: add PRM data for reset support
>>
>>
>> The above commit is generating the following build error on ARM systems ...
>>
>> dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm/mach-omap2/pdata-quirks.c:27:10: fatal error: linux/platform_data/ti-prm.h: No such file or directory
>>   #include <linux/platform_data/ti-prm.h>
>>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> build error:
> 
> ../arch/arm/mach-omap2/pdata-quirks.c:27:10: fatal error:
> linux/platform_data/ti-prm.h: No such file or directory
>     27 | #include <linux/platform_data/ti-prm.h>
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [../scripts/Makefile.build:265:
> arch/arm/mach-omap2/pdata-quirks.o] Error 1
> 
> With these below three patches, it applies cleanly and builds.
> But I'm not sure these are not expected to get into stable rc 5.4 branch.

Yeah, without PRM driver the pdata-quirk patch should not have been 
picked up. I wonder why it ended up in stable. Tony, any ideas?

-Tero

> 
> 3e99cb214f03 ("soc: ti: add initial PRM driver with reset control support")
> c5117a78dd88 ("soc: ti: omap-prm: poll for reset complete during de-assert")
> d30cd83f6853 ("soc: ti: omap-prm: add support for denying idle for
> reset clockdomain")
> 
> However, it's only patch
> d30cd83f6853 ("soc: ti: omap-prm: add support for denying idle for
> reset clockdomain")
> that introduces file linux/platform_data/ti-prm.h
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
