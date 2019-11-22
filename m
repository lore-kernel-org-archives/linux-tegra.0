From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.4 000/159] 4.4.203-stable review
Date: Fri, 22 Nov 2019 13:35:56 +0000
Message-ID: <9e2a0022-f01d-2db4-8ea2-cffb0b038df1@nvidia.com>
References: <20191122100704.194776704@linuxfoundation.org>
 <f0f505ae-5113-1abd-d4f7-0c3535c83de4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <f0f505ae-5113-1abd-d4f7-0c3535c83de4@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 22/11/2019 13:14, Jon Hunter wrote:
> 
> On 22/11/2019 10:26, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 4.4.203 release.
>> There are 159 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Sun, 24 Nov 2019 09:59:19 +0000.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.203-rc1.gz
>> or in the git tree and branch at:
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
>> and the diffstat can be found below.
>>
>> thanks,
>>
>> greg k-h
>>
>> -------------
>> Pseudo-Shortlog of commits:
> 
> ...
> 
>> Marek Szyprowski <m.szyprowski@samsung.com>
>>     ARM: dts: exynos: Disable pull control for S5M8767 PMIC
> 
> The above commit is causing the following build error for ARM ...
> 
> Error: /dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm/boot/dts/exynos5250-arndale.dts:560.22-23 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/exynos5250-arndale.dtb' failed
> make[2]: *** [arch/arm/boot/dts/exynos5250-arndale.dtb] Error 1

FYI ... after reverting the above all the tests are passing for Tegra.

Jon

-- 
nvpublic
