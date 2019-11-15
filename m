From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.9 00/31] 4.9.202-stable review
Date: Fri, 15 Nov 2019 23:07:47 +0800
Message-ID: <20191115150747.GA375474@kroah.com>
References: <20191115062009.813108457@linuxfoundation.org>
 <be8b3704-c780-ceaf-7775-3d1f21db6224@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be8b3704-c780-ceaf-7775-3d1f21db6224@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 15, 2019 at 01:50:56PM +0000, Jon Hunter wrote:
> 
> On 15/11/2019 06:20, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.9.202 release.
> > There are 31 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sun, 17 Nov 2019 06:18:35 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.202-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.9:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     24 tests:	24 pass, 0 fail
> 
> Linux version:	4.9.202-rc1-gd7f83e4f45e8
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Thanks for testing both of these and letting me know.

greg k-h
