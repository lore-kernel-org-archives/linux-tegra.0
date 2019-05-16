From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.4 000/266] 4.4.180-stable review
Date: Thu, 16 May 2019 18:49:18 +0200
Message-ID: <20190516164918.GA12641@kroah.com>
References: <20190515090722.696531131@linuxfoundation.org>
 <f32de22f-c928-2eaa-ee3f-d2b26c184dd4@nvidia.com>
 <75c1f549-9098-933e-ab8b-4d0eeab87ddd@monom.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <75c1f549-9098-933e-ab8b-4d0eeab87ddd@monom.org>
Sender: stable-owner@vger.kernel.org
To: Daniel Wagner <wagi@monom.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 01:59:43PM +0200, Daniel Wagner wrote:
> Hi Jon,
> 
> > Boot regression detected for Tegra ...
> > 
> > Test results for stable-v4.4:
> >     6 builds:	6 pass, 0 fail
> >     15 boots:	6 pass, 9 fail
> >     8 tests:	8 pass, 0 fail
> > 
> > Linux version:	4.4.180-rc1-gbe756da
> > Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
> >                 tegra30-cardhu-a04
> > 
> > Bisect is point to the following commit ...
> > 
> > # first bad commit: [7849d64a1700ddae1963ff22a77292e9fb5c2983] mm, vmstat: make quiet_vmstat lighter
> > 
> > Reverting this on top v4.4.180-rc1 fixes the problem.  
> 
> I guess the patch depends on another change. I'll try to figure out what
> is missing.

Jon, thanks for the testing, I'll go drop this patch now from the final
version.

Daniel, if you can come up with a working series, I'll be glad to take
it.  Or, I'd recommend you just move to a newer kernel :)

thanks,

greg k-h
