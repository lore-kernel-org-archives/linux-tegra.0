From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.4 00/48] 4.4.162-stable review
Date: Mon, 22 Oct 2018 14:05:00 +0100
Message-ID: <6f7a509f-19bf-f335-c874-457836485b75@nvidia.com>
References: <20181018175427.133690306@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018175427.133690306@linuxfoundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 18/10/2018 18:54, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.162 release.
> There are 48 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat Oct 20 17:54:03 UTC 2018.
> Anything received after that time might be too late.
Sorry its late, but FWIW all tests passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail

Linux version:	4.4.162-rc1-g3918330
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
