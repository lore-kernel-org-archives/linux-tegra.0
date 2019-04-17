From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.0 000/117] 5.0.8-stable review
Date: Wed, 17 Apr 2019 13:03:55 +0200
Message-ID: <20190417110355.GA6878@kroah.com>
References: <20190415183744.887851196@linuxfoundation.org>
 <c3ff53a4-9d22-47b8-a385-e01229c43a0d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c3ff53a4-9d22-47b8-a385-e01229c43a0d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 16, 2019 at 11:34:44AM +0100, Jon Hunter wrote:
> 
> On 15/04/2019 19:59, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.0.8 release.
> > There are 117 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed Apr 17 18:36:42 UTC 2019.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.8-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v5.0:
>     11 builds:	11 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     30 tests:	30 pass, 0 fail
> 
> Linux version:	5.0.8-rc1-ge6fdfdb
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Thanks for testing all of these and letting me know.

greg k-h
