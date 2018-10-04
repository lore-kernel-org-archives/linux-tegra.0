From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.14 000/137] 4.14.74-stable review
Date: Thu, 4 Oct 2018 13:42:48 +0100
Message-ID: <424795e5-7ef6-63ff-7908-babf1b34ff58@nvidia.com>
References: <20181002132458.446916963@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181002132458.446916963@linuxfoundation.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 02/10/18 14:23, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.14.74 release.
> There are 137 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu Oct  4 13:24:18 UTC 2018.
> Anything received after that time might be too late.

All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    8 boots:	8 pass, 0 fail
    14 tests:	14 pass, 0 fail

Linux version: 4.14.74-rc1-g3fa7781
Boards tested: tegra124-jetson-tk1, tegra20-ventana,
               tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
