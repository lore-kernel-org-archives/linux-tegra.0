From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.9 000/101] 4.9.144-stable review
Date: Fri, 7 Dec 2018 15:41:23 +0100
Message-ID: <20181207144123.GA20201@kroah.com>
References: <20181206143011.174892052@linuxfoundation.org>
 <85d7624a-c826-78d8-54a9-2aab10ba9914@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <85d7624a-c826-78d8-54a9-2aab10ba9914@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 07, 2018 at 09:03:27AM +0000, Jon Hunter wrote:
> 
> On 06/12/2018 14:37, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.9.144 release.
> > There are 101 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat Dec  8 14:29:43 UTC 2018.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.144-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.9:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     14 tests:	14 pass, 0 fail
> 
> Linux version:	4.9.144-rc1-gcf137e4
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Thanks for testing two of these and letting me know.

greg k-h
