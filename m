From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] ARM: tegra: avoid section mismatch warning
Date: Tue, 11 Dec 2018 11:08:53 +0100
Message-ID: <CAK8P3a1zbmYMFZB8R+rs=vdJY=KNqgRPBCQNO91LcSSTR0O03Q@mail.gmail.com>
References: <20181210215856.2238253-1-arnd@arndb.de> <20181210215856.2238253-2-arnd@arndb.de>
 <20181211100550.GD14426@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211100550.GD14426@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: arm-soc <arm@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 11, 2018 at 11:05 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Mon, Dec 10, 2018 at 10:58:37PM +0100, Arnd Bergmann wrote:
> > WARNING: vmlinux.o(.text+0x39ecc): Section mismatch in reference from the function tegra114_gic_cpu_pm_registration() to the (unknown reference) .init.rodata:(unknown)
> > The function tegra114_gic_cpu_pm_registration() references
> > the (unknown reference) __initconst (unknown).
> > This is often because tegra114_gic_cpu_pm_registration lacks a __initconst
> > annotation or the annotation of (unknown) is wrong.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/mach-tegra/irq.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> I'm not seeing these. Do I need to enable any special options to trigger
> these? Or are these just so new that I haven't run into them yet?

My guess would be that this is a result of the CONFIG_NO_AUTO_INLINE
option that is now available in linux-next.

       Arnd
