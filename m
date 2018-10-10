From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 00/94] 4.14.75-stable review
Date: Wed, 10 Oct 2018 09:42:46 +0200
Message-ID: <20181010074246.GA6664@kroah.com>
References: <20181008175605.067676667@linuxfoundation.org>
 <12c74a4f-6fff-de79-6bc4-6d1b64dab946@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <12c74a4f-6fff-de79-6bc4-6d1b64dab946@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 10, 2018 at 07:54:57AM +0100, Jon Hunter wrote:
> 
> On 08/10/18 19:30, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.14.75 release.
> > There are 94 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed Oct 10 17:55:37 UTC 2018.
> > Anything received after that time might be too late.
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.14:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     14 tests:	14 pass, 0 fail
> 
> Linux version:	4.14.75-rc2-g2040d5a
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Great, thanks for testing these and letting me know.

greg k-h
