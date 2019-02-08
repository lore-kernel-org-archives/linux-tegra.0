From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.4 00/34] 4.4.174-stable review
Date: Fri, 8 Feb 2019 11:28:48 +0100
Message-ID: <20190208102848.GA10341@kroah.com>
References: <20190207113025.552605181@linuxfoundation.org>
 <21d81a53-adfd-9d87-17ea-4b7e78b167f3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <21d81a53-adfd-9d87-17ea-4b7e78b167f3@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 08, 2019 at 10:03:33AM +0000, Jon Hunter wrote:
> 
> On 07/02/2019 11:41, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.4.174 release.
> > There are 34 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat Feb  9 11:30:10 UTC 2019.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.174-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.4:
>     6 builds:	6 pass, 0 fail
>     12 boots:	12 pass, 0 fail
>     10 tests:	10 pass, 0 fail
> 
> Linux version:	4.4.174-rc1-g968fa3b
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra30-cardhu-a04
> 

Great, thanks for testing and letting me know.

greg k-h
