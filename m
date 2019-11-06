From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.19 000/149] 4.19.82-stable review
Date: Wed, 6 Nov 2019 11:49:21 +0100
Message-ID: <20191106104921.GC2982490@kroah.com>
References: <20191104212126.090054740@linuxfoundation.org>
 <6e8b6e19-0d66-beb0-8e16-7975aa1d462a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6e8b6e19-0d66-beb0-8e16-7975aa1d462a@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 05, 2019 at 11:46:05PM +0000, Jon Hunter wrote:
> 
> On 04/11/2019 21:43, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 4.19.82 release.
> > There are 149 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed 06 Nov 2019 09:14:04 PM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.82-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> > -------------
> > Pseudo-Shortlog of commits:
> 
> ...
> 
> > Jose Abreu <jose.abreu@synopsys.com>
> >     net: stmmac: Fix NAPI poll in TX path when in multi-queue
> 
> The above commit is causing a boot regression on Tegra186. Bisect points
> to this commit and reverting fixes the issue.

Thanks for testing this.  I've dropped this patch now, so all shoudl be
good.

greg k-h
