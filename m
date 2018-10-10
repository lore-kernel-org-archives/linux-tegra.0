From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4.4 000/113] 4.4.160-stable review
Date: Wed, 10 Oct 2018 07:56:54 +0100
Message-ID: <2150b3a2-613a-58af-91b5-d2ebcc4c6726@nvidia.com>
References: <20181008175530.864641368@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181008175530.864641368@linuxfoundation.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 08/10/18 19:30, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.160 release.
> There are 113 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed Oct 10 17:55:13 UTC 2018.
> Anything received after that time might be too late.
All tests are passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail

Linux version:	4.4.160-rc1-gb5eb385
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
