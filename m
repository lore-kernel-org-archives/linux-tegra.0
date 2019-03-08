From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.0 00/46] 5.0.1-stable review
Date: Fri, 8 Mar 2019 17:35:14 +0100
Message-ID: <20190308163514.GB12898@kroah.com>
References: <20190308124902.257040783@linuxfoundation.org>
 <e5695788-9ba4-5543-6f68-a99c7b972073@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e5695788-9ba4-5543-6f68-a99c7b972073@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 08, 2019 at 04:06:19PM +0000, Jon Hunter wrote:
> 
> On 08/03/2019 12:49, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.0.1 release.
> > There are 46 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sun Mar 10 12:48:36 UTC 2019.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.1-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> All tests passing for Tegra ...
> 
> Test results for stable-v5.0:
>     11 builds:	11 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     28 tests:	28 pass, 0 fail
> 
> Linux version:	5.0.1-rc1-gbe3f501
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Wonderful, thanks for testing all 3 of these and letting me know.

greg k-h
