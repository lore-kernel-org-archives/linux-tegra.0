From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5.4 00/66] 5.4.1-stable review
Date: Thu, 28 Nov 2019 10:42:00 +0000
Message-ID: <772b6606-f65c-371f-ec74-e78aba55f798@nvidia.com>
References: <20191127202632.536277063@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191127202632.536277063@linuxfoundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 27/11/2019 20:31, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.1 release.
> There are 66 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 29 Nov 2019 20:18:09 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.1-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
> -------------

Here are the test results for Tegra ...

Test results for stable-v5.4:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	37 pass, 1 fail

Linux version:	5.4.1-rc1-gd6453d6b0c57
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

We are seeing 1 failure for Tegra194, but this is not a new failure this
is present in v5.4 and it is a kernel warnings failure that has been
fixed for v5.5 by the following commits.

This one has been merged for v5.5 ...

commit c745da8d4320c49e54662c0a8f7cb6b8204f44c4
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Fri Oct 11 09:34:59 2019 +0100

    mailbox: tegra: Fix superfluous IRQ error message

This one has not been merged for v5.5 yet ...

commit d440538e5f219900a9fc9d96fd10727b4d2b3c48
Author: Jon Hunter <jonathanh@nvidia.com>
Date:   Wed Sep 25 15:12:28 2019 +0100

    arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator

If you like I can let you know once the above is merged so we can merge
for linux-5.4.y.

Cheers
Jon

-- 
nvpublic
