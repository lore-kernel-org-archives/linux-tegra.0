From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 00/45] 4.14.76-stable review
Date: Fri, 12 Oct 2018 12:24:50 +0200
Message-ID: <20181012102450.GC29897@kroah.com>
References: <20181011152508.885515042@linuxfoundation.org>
 <0e968049-bcb6-cd62-b0cb-77a9745ae785@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0e968049-bcb6-cd62-b0cb-77a9745ae785@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 12, 2018 at 08:50:56AM +0100, Jon Hunter wrote:
> 
> On 11/10/18 16:39, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.14.76 release.
> > There are 45 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat Oct 13 15:24:53 UTC 2018.
> > Anything received after that time might be too late.
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.14:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     14 tests:	14 pass, 0 fail
> 
> Linux version:	4.14.76-rc1-gc0c2a43
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Thanks for testing 2 of these and letting me know.

greg k-h
