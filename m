From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.20 000/183] 4.20.13-stable review
Date: Tue, 26 Feb 2019 14:08:57 +0100
Message-ID: <20190226130857.GB10343@kroah.com>
References: <20190225195054.748060397@linuxfoundation.org>
 <1619e5d9-a8a2-ca2a-1550-b77062891530@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1619e5d9-a8a2-ca2a-1550-b77062891530@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 26, 2019 at 12:27:30PM +0000, Jon Hunter wrote:
> 
> On 25/02/2019 21:09, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.20.13 release.
> > There are 183 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed Feb 27 19:49:59 UTC 2019.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.20.13-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.20.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.20:
>     11 builds:	11 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     22 tests:	22 pass, 0 fail
> 
> Linux version:	4.20.13-rc1-g6d10f1d
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Nice to see a new branch working for you :)

Thanks for testing all of these and letting me know.

greg k-h
