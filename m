From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 000/205] 4.14.99-stable review
Date: Tue, 12 Feb 2019 10:19:57 +0000
Message-ID: <d91e568f-643c-1226-2592-6e24baadb01a@nvidia.com>
References: <20190211141827.214852402@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190211141827.214852402@linuxfoundation.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 11/02/2019 14:16, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.14.99 release.
> There are 205 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed Feb 13 14:17:19 UTC 2019.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.99-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version:	4.14.99-rc1-g151d638
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

BTW, I did not seem to receive a 'stable review' for v4.4.175-rc1. I am
not sure if it is just me, but that last one I see in the archive for
v4.4 [0] is v4.4-174-rc1.

Cheers
Jon

[0] https://www.spinics.net/lists/stable/

-- 
nvpublic
