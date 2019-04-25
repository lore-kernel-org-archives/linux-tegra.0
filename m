From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.0 000/115] 5.0.10-stable review
Date: Thu, 25 Apr 2019 16:29:10 +0200
Message-ID: <20190425142910.GB29936@kroah.com>
References: <20190424170924.797924502@linuxfoundation.org>
 <471444ef-bff9-146f-5261-7625e81d83d3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <471444ef-bff9-146f-5261-7625e81d83d3@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 25, 2019 at 12:56:11PM +0100, Jon Hunter wrote:
> 
> On 24/04/2019 18:08, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.0.10 release.
> > There are 115 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Fri 26 Apr 2019 05:07:37 PM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.10-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v5.0:
>     12 builds:	12 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     32 tests:	32 pass, 0 fail
> 
> Linux version:	5.0.10-rc2-ge428bc9
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana, tegra210,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Wonderful, thanks for testing 5 of these and letting me know.

greg k-h
