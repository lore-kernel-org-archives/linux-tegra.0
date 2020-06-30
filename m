From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 00/78] 4.14.186-rc1 review
Date: Tue, 30 Jun 2020 10:20:26 +0100
Message-ID: <90a6431c-db16-08bd-4e1b-e23b0d9961a3@nvidia.com>
References: <20200629153806.2494953-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200629153806.2494953-1-sashal@kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 29/06/2020 16:36, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.14.186 release.
> There are 78 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 01 Jul 2020 03:38:04 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.14.y&id2=v4.14.185
> 
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> and the diffstat can be found below.
> 
> --
> Thanks,
> Sasha

Something does not seem right here. I believe that Greg released
4.14.186 last week [0] and now the makefile is showing 4.14.187-rc1 [1].
So maybe the subject and above are a typo? Anyway, for 4.14.187-rc1 ...

All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    30 tests:	30 pass, 0 fail

Linux version:	4.14.187-rc1-g27e703aa31e4
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tag/?h=v4.14.186
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Makefile?h=linux-4.14.y

-- 
nvpublic
