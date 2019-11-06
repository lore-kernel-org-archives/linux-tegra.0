From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.3 000/163] 5.3.9-stable review
Date: Wed, 6 Nov 2019 11:49:32 +0100
Message-ID: <20191106104932.GD2982490@kroah.com>
References: <20191104212140.046021995@linuxfoundation.org>
 <a9c51735-86c7-9e77-707b-74628a99f76b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a9c51735-86c7-9e77-707b-74628a99f76b@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 05, 2019 at 11:41:15PM +0000, Jon Hunter wrote:
> 
> On 04/11/2019 21:43, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.3.9 release.
> > There are 163 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed 06 Nov 2019 09:14:04 PM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.3.9-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.3.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests for Tegra are passing ...
> 
> Test results for stable-v5.3:
>     12 builds:	12 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     38 tests:	38 pass, 0 fail
> 
> Linux version:	5.3.9-rc1-g75c9913bbf6e
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Thanks for testing all of these and letting me know.

greg k-h
