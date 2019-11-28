From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.3 00/95] 5.3.14-stable review
Date: Thu, 28 Nov 2019 11:36:04 +0100
Message-ID: <20191128103604.GB3399855@kroah.com>
References: <20191127202845.651587549@linuxfoundation.org>
 <0c65f759-f22c-1b15-1f71-929def8ac43e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0c65f759-f22c-1b15-1f71-929def8ac43e@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 28, 2019 at 09:15:45AM +0000, Jon Hunter wrote:
> 
> On 27/11/2019 20:31, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.3.14 release.
> > There are 95 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Fri, 29 Nov 2019 20:18:09 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.3.14-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.3.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> ...
> 
> > Jouni Hogander <jouni.hogander@unikie.com>
> >     net-sysfs: Fix reference count leak in rx|netdev_queue_add_kobject
> 
> The above commit is causing a boot regression (NULL pointer deference
> crash) on Tegra210 for v5.3. Reverting this on top of 5.3.14-rc1 fixes
> the problem. Complete results for Tegra are here ...
> 
> Test results for stable-v5.3:
>     13 builds:	13 pass, 0 fail
>     24 boots:	18 pass, 6 fail
>     34 tests:	34 pass, 0 fail
> 
> Linux version:	5.3.14-rc1-g7173a2d18fa6
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

I've pushed out a -rc2 that should resolve this now.  If not, please let
me know.

thansk,

greg k-h
