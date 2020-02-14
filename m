From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 5.5 000/120] 5.5.4-stable review
Date: Fri, 14 Feb 2020 07:28:07 -0800
Message-ID: <20200214152807.GA3960470@kroah.com>
References: <20200213151901.039700531@linuxfoundation.org>
 <e49bd26e-560c-840e-7f21-ee040a783143@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e49bd26e-560c-840e-7f21-ee040a783143-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patches-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org, ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 14, 2020 at 10:27:39AM +0000, Jon Hunter wrote:
> 
> On 13/02/2020 15:19, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.5.4 release.
> > There are 120 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat, 15 Feb 2020 15:16:41 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.5.4-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.5.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v5.5:
>     13 builds:	13 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     40 tests:	40 pass, 0 fail
> 
> Linux version:	5.5.4-rc2-ged6d023a1817
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 

Thanks for testing all of these and letting me know.

greg k-h
