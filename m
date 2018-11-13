From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 000/222] 4.14.81-stable review
Date: Tue, 13 Nov 2018 11:11:28 -0800
Message-ID: <20181113191128.GB27890@kroah.com>
References: <20181111221647.665769131@linuxfoundation.org>
 <306f3631-7b82-6827-021f-e345c2191332@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <306f3631-7b82-6827-021f-e345c2191332@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 13, 2018 at 08:40:02AM +0000, Jon Hunter wrote:
> 
> On 11/11/2018 22:21, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.14.81 release.
> > There are 222 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Tue Nov 13 22:15:32 UTC 2018.
> > Anything received after that time might be too late.
> All tests are passing for Tegra ...
> 
> Test results for stable-v4.14:
>     8 builds:	8 pass, 0 fail
>     16 boots:	16 pass, 0 fail
>     14 tests:	14 pass, 0 fail
> 
> Linux version:	4.14.81-rc1-g8ea9437
> Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Thanks for testing and letting me know.

greg k-h
