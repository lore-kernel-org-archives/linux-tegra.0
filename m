From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.19 00/30] 4.19.25-stable review
Date: Fri, 22 Feb 2019 09:24:28 +0100
Message-ID: <20190222082428.GA6632@kroah.com>
References: <20190221125250.543158526@linuxfoundation.org>
 <bf719e14-29f8-d984-f559-13b8366c56ba@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bf719e14-29f8-d984-f559-13b8366c56ba@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 22, 2019 at 08:14:05AM +0000, Jon Hunter wrote:
> 
> On 21/02/2019 14:35, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.19.25 release.
> > There are 30 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat Feb 23 12:52:29 UTC 2019.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.25-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.19:
>     11 builds:	11 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     22 tests:	22 pass, 0 fail
> 
> Linux version:	4.19.25-rc1-g38e5064
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Great!  Thanks for testing these and letting me know.

greg k-h
