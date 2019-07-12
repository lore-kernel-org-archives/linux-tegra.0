From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.2 00/61] 5.2.1-stable review
Date: Fri, 12 Jul 2019 18:51:46 +0200
Message-ID: <20190712165146.GA32146@kroah.com>
References: <20190712121620.632595223@linuxfoundation.org>
 <a1ae16a7-e8f7-b6fc-df4e-46079bebf9b3@nvidia.com>
 <20190712153108.GD13940@kroah.com>
 <a0d871e7-a68c-5c77-1389-5b9a86f93ac9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a0d871e7-a68c-5c77-1389-5b9a86f93ac9@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 12, 2019 at 05:10:30PM +0100, Jon Hunter wrote:
> 
> On 12/07/2019 16:31, Greg Kroah-Hartman wrote:
> > On Fri, Jul 12, 2019 at 02:36:29PM +0100, Jon Hunter wrote:
> >>
> >> On 12/07/2019 13:19, Greg Kroah-Hartman wrote:
> >>> This is the start of the stable review cycle for the 5.2.1 release.
> >>> There are 61 patches in this series, all will be posted as a response
> >>> to this one.  If anyone has any issues with these being applied, please
> >>> let me know.
> >>>
> >>> Responses should be made by Sun 14 Jul 2019 12:14:36 PM UTC.
> >>> Anything received after that time might be too late.
> >>>
> >>> The whole patch series can be found in one patch at:
> >>> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2.1-rc1.gz
> >>> or in the git tree and branch at:
> >>> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.2.y
> >>> and the diffstat can be found below.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >>
> >> All tests are passing for Tegra ...
> >>
> >> Test results for stable-v5.2:
> >>     12 builds:	12 pass, 0 fail
> >>     22 boots:	22 pass, 0 fail
> >>     38 tests:	38 pass, 0 fail
> >>
> >> Linux version:	5.2.1-rc1-g61731e8fe278
> >> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
> >>                 tegra194-p2972-0000, tegra20-ventana,
> >>                 tegra210-p2371-2180, tegra30-cardhu-a04
> > 
> > That was fast, thanks for testing all of these.
> 
> Friday afternoon for me and so I am even more motivated :-)
> 
> BTW, has anyone ever requested pushing out a deadline failing on the
> weekend to the following Monday? There is a chance I could miss this if
> I happen to leave early on a Friday.

Sure, if things break and I notice them, I've delayed releases until
they get fixed in the past.

thanks,

greg k-h
