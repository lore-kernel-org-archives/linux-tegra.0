From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 000/146] 4.14.86-stable review
Date: Wed, 5 Dec 2018 10:45:05 +0100
Message-ID: <20181205094505.GB8980@kroah.com>
References: <20181204103726.750894136@linuxfoundation.org>
 <e2c49480-12c4-83a9-94ec-a8bfc50728d4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e2c49480-12c4-83a9-94ec-a8bfc50728d4@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 05, 2018 at 09:31:45AM +0000, Jon Hunter wrote:
> 
> On 04/12/2018 10:48, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.14.86 release.
> > There are 146 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Thu Dec  6 10:36:52 UTC 2018.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.86-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.14:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     14 tests:	14 pass, 0 fail
> 
> Linux version:	4.14.86-rc2-ga5c883b
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Great, thanks for testing these and letting me know.

greg k-h
