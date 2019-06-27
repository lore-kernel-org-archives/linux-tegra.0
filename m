From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.4 0/1] 4.4.184-stable review
Date: Fri, 28 Jun 2019 00:54:33 +0800
Message-ID: <20190627165433.GC9855@kroah.com>
References: <20190626083604.894288021@linuxfoundation.org>
 <217e73e4-7777-558c-186f-c94658447ae0@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <217e73e4-7777-558c-186f-c94658447ae0@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 27, 2019 at 09:36:55AM +0100, Jon Hunter wrote:
> 
> On 26/06/2019 09:45, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.4.184 release.
> > There are 1 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Fri 28 Jun 2019 08:35:42 AM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.184-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.4:
>     6 builds:	6 pass, 0 fail
>     12 boots:	12 pass, 0 fail
>     19 tests:	19 pass, 0 fail
> 
> Linux version:	4.4.184-rc1-g5f1824292521
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra30-cardhu-a04
> 

Thanks for testing all of these and letting me know.

greg k-h
