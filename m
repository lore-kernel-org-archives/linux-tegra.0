From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.2 000/144] 5.2.9-stable review
Date: Fri, 16 Aug 2019 11:40:09 +0200
Message-ID: <20190816094009.GA17851@kroah.com>
References: <20190814165759.466811854@linuxfoundation.org>
 <20190816092133.16205-1-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816092133.16205-1-treding@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 16, 2019 at 11:21:33AM +0200, Thierry Reding wrote:
> On Wed, 14 Aug 2019 18:59:16 +0200, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.2.9 release.
> > There are 144 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Fri 16 Aug 2019 04:55:34 PM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2.9-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.2.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.2:
>     12 builds:	12 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     38 tests:	38 pass, 0 fail
> 
> Linux version:	5.2.9-rc1-g2440e485aeda
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Wonderful, thanks for testing all of these and letting me know.

greg k-h
