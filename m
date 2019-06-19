From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 00/53] 4.14.128-stable review
Date: Wed, 19 Jun 2019 15:40:44 +0200
Message-ID: <20190619134044.GA11148@kroah.com>
References: <20190617210745.104187490@linuxfoundation.org>
 <c4c6c3f5-2117-2db2-58a8-1a84143dc034@nvidia.com>
 <20190619104600.GC3150@kroah.com>
 <af010d53-ae9e-6550-326c-8ad9e705d8fa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <af010d53-ae9e-6550-326c-8ad9e705d8fa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 19, 2019 at 02:30:51PM +0100, Jon Hunter wrote:
> 
> On 19/06/2019 11:46, Greg Kroah-Hartman wrote:
> > On Wed, Jun 19, 2019 at 09:49:00AM +0100, Jon Hunter wrote:
> >>
> >> On 17/06/2019 22:09, Greg Kroah-Hartman wrote:
> >>> This is the start of the stable review cycle for the 4.14.128 release.
> >>> There are 53 patches in this series, all will be posted as a response
> >>> to this one.  If anyone has any issues with these being applied, please
> >>> let me know.
> >>>
> >>> Responses should be made by Wed 19 Jun 2019 09:06:21 PM UTC.
> >>> Anything received after that time might be too late.
> >>>
> >>> The whole patch series can be found in one patch at:
> >>> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.128-rc1.gz
> >>> or in the git tree and branch at:
> >>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> >>> and the diffstat can be found below.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >>
> >> I am still waiting on the test results for 4.14-128-rc1. The builds are
> >> all passing, but waiting for the tests to complete. We have been having
> >> some issues with our test farm this week and so the results are delayed,
> >> but should be available later today, I hope.
> > 
> > No worries, thanks for testing all of these and letting me know.
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v4.14:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     24 tests:	24 pass, 0 fail
> 
> Linux version:	4.14.128-rc1-g16102d7ed840
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Great, thanks!
