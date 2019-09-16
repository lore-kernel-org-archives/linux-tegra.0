From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.4 0/9] 4.4.193-stable review
Date: Mon, 16 Sep 2019 10:16:00 +0100
Message-ID: <b8d90d3a-3af4-4a24-f214-41308e6c452e@nvidia.com>
References: <20190913130424.160808669@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913130424.160808669@linuxfoundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 13/09/2019 14:06, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.193 release.
> There are 9 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun 15 Sep 2019 01:03:32 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.193-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


All tests passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail
    19 tests:	19 pass, 0 fail

Linux version:	4.4.193-rc1-g0a1ee44c6916
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
