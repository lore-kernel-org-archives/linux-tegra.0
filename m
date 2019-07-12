From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 5.1 000/138] 5.1.18-stable review
Date: Fri, 12 Jul 2019 13:21:41 -0700
Message-ID: <20190712202141.GA18698@roeck-us.net>
References: <20190712121628.731888964@linuxfoundation.org>
 <4dae64c8-046e-3647-52d6-43362e986d21@nvidia.com>
 <20190712153035.GC13940@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190712153035.GC13940@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, j-keerthy@ti.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 12, 2019 at 05:30:35PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 12, 2019 at 02:26:57PM +0100, Jon Hunter wrote:
> > Hi Greg,
> > 
> > On 12/07/2019 13:17, Greg Kroah-Hartman wrote:
> > > This is the start of the stable review cycle for the 5.1.18 release.
> > > There are 138 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > > 
> > > Responses should be made by Sun 14 Jul 2019 12:14:36 PM UTC.
> > > Anything received after that time might be too late.
> > > 
> > > The whole patch series can be found in one patch at:
> > > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.1.18-rc1.gz
> > > or in the git tree and branch at:
> > > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.1.y
> > > and the diffstat can be found below.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > > 
> > > -------------
> > > Pseudo-Shortlog of commits:
> > 
> Both are now dropped, thanks.  I'll push out a -rc2 with that changed.
> 

Can you push that update into the git repository ?
v5.1.17-137-gde182b90f76d still has the problem.

Also:

Building powerpc:ppc6xx_defconfig ... failed

drivers/crypto/talitos.c: In function ‘get_request_hdr’:
include/linux/kernel.h:979:51: error:
	dereferencing pointer to incomplete type ‘struct talitos_edesc’

Seen with both v4.19.58-92-gd66f8e7 and v5.1.17-137-gde182b90f76d.

This problem is caused by "crypto: talitos - fix hash on SEC1.", which will
need a proper backport - struct talitos_edesc is declared later in the
source file.

Guenter
