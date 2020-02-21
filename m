From: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 5.4 000/344] 5.4.22-stable review
Date: Fri, 21 Feb 2020 16:47:45 +0530
Message-ID: <CA+G9fYv-KC0v++YsyXR-rhC2JBGUfhNGD+XYaZjN3fJSX1x_mg@mail.gmail.com>
References: <20200221072349.335551332@linuxfoundation.org> <529a5a4a-974e-995a-9556-c2a14d09bb5d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <529a5a4a-974e-995a-9556-c2a14d09bb5d@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, t-kristo@ti.com
Cc: open list <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, Shuah Khan <shuah@kernel.org>, patches@kernelci.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, lkft-triage@lists.linaro.org, linux- stable <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, 21 Feb 2020 at 15:34, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 21/02/2020 07:36, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.4.22 release.
> > There are 344 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sun, 23 Feb 2020 07:19:49 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >       https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.22-rc1.gz
> > or in the git tree and branch at:
> >       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
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
> > Tero Kristo <t-kristo@ti.com>
> >     ARM: OMAP2+: pdata-quirks: add PRM data for reset support
>
>
> The above commit is generating the following build error on ARM systems ...
>
> dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm/mach-omap2/pdata-quirks.c:27:10: fatal error: linux/platform_data/ti-prm.h: No such file or directory
>  #include <linux/platform_data/ti-prm.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

build error:

../arch/arm/mach-omap2/pdata-quirks.c:27:10: fatal error:
linux/platform_data/ti-prm.h: No such file or directory
   27 | #include <linux/platform_data/ti-prm.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [../scripts/Makefile.build:265:
arch/arm/mach-omap2/pdata-quirks.o] Error 1

With these below three patches, it applies cleanly and builds.
But I'm not sure these are not expected to get into stable rc 5.4 branch.

3e99cb214f03 ("soc: ti: add initial PRM driver with reset control support")
c5117a78dd88 ("soc: ti: omap-prm: poll for reset complete during de-assert")
d30cd83f6853 ("soc: ti: omap-prm: add support for denying idle for
reset clockdomain")

However, it's only patch
d30cd83f6853 ("soc: ti: omap-prm: add support for denying idle for
reset clockdomain")
that introduces file linux/platform_data/ti-prm.h
