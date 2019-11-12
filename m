From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 000/105] 4.14.154-stable review
Date: Tue, 12 Nov 2019 14:52:22 +0100
Message-ID: <20191112135222.GA1331422@kroah.com>
References: <20191111181421.390326245@linuxfoundation.org>
 <20191112052822.GC1208865@kroah.com>
 <3f16154f-018f-1472-1c91-008f1199af7f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3f16154f-018f-1472-1c91-008f1199af7f@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 12, 2019 at 12:01:03PM +0000, Jon Hunter wrote:
> 
> On 12/11/2019 05:28, Greg Kroah-Hartman wrote:
> > On Mon, Nov 11, 2019 at 07:27:30PM +0100, Greg Kroah-Hartman wrote:
> >> This is the start of the stable review cycle for the 4.14.154 release.
> >> There are 105 patches in this series, all will be posted as a response
> >> to this one.  If anyone has any issues with these being applied, please
> >> let me know.
> >>
> >> Responses should be made by Wed, 13 Nov 2019 18:08:44 +0000.
> >> Anything received after that time might be too late.
> >>
> >> The whole patch series can be found in one patch at:
> >> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.154-rc1.gz
> > 
> > There is now a -rc2 out:
> >  	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.154-rc2.gz
> > 
> 
> All tests for Tegra are passing ...
> 
> Test results for stable-v4.14:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     24 tests:	24 pass, 0 fail
> 
> Linux version:	4.14.154-rc2-gfc7e45ae100f
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Oh good, thanks for testing all of these and letting me know.

greg k-h
