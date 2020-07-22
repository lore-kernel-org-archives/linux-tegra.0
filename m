From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.7 000/243] 5.7.10-rc2 review
Date: Wed, 22 Jul 2020 14:47:24 +0200
Message-ID: <20200722124724.GA3155653@kroah.com>
References: <20200720191523.845282610@linuxfoundation.org>
 <20200721131708.GH44604@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200721131708.GH44604@ulmo>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 21, 2020 at 03:17:08PM +0200, Thierry Reding wrote:
> On Mon, Jul 20, 2020 at 09:16:26PM +0200, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.7.10 release.
> > There are 243 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed, 22 Jul 2020 19:14:36 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.10-rc2.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.7:
>     11 builds:  11 pass, 0 fail
>     26 boots:   26 pass, 0 fail
>     56 tests:   56 pass, 0 fail
> 
> Linux version:  5.7.10-rc2-g7d2e5723ce4a
> Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04

Thanks for testing all of these and letting me know.

greg k-h
