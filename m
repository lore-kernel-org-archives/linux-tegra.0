From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.4 00/78] 4.4.190-stable review
Date: Fri, 23 Aug 2019 10:38:24 -0700
Message-ID: <20190823173824.GB1040@kroah.com>
References: <20190822171832.012773482@linuxfoundation.org>
 <ea35d533-4ffb-8fe0-8639-6fc5a780748e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ea35d533-4ffb-8fe0-8639-6fc5a780748e@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 23, 2019 at 03:05:38AM +0100, Jon Hunter wrote:
> 
> On 22/08/2019 18:18, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.4.190 release.
> > There are 78 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat 24 Aug 2019 05:18:13 PM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.190-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests for Tegra are passing ...
> 
> Test results for stable-v4.4:
>     6 builds:	6 pass, 0 fail
>     12 boots:	12 pass, 0 fail
>     19 tests:	19 pass, 0 fail
> 
> Linux version:	4.4.190-rc1-gf607b8c5ce70
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra30-cardhu-a04
> 

Thanks for testing all of these and letting me know.

greg k-h
