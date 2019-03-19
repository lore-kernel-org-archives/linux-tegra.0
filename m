From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.20 00/52] 4.20.17-stable review
Date: Tue, 19 Mar 2019 10:34:32 +0000
Message-ID: <b1fca30b-f7b1-ac69-87c6-bbc60783ac82@nvidia.com>
References: <20190318083843.398913295@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318083843.398913295@linuxfoundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 18/03/2019 09:24, Greg Kroah-Hartman wrote:
> ------------------
> NOTE, this is going to be the LAST 4.20.y release.  After this one, 4.20
> will be end-of-life.  Please move to the 5.0.y tree at this point in
> time, or let me know why that is not possible.
> ------------------
> 
> This is the start of the stable review cycle for the 4.20.17 release.
> There are 52 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed Mar 20 08:38:27 UTC 2019.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.20.17-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.20.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v4.20:
    11 builds:	11 pass, 0 fail
    22 boots:	22 pass, 0 fail
    28 tests:	28 pass, 0 fail

Linux version:	4.20.17-rc1-g3244476
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
