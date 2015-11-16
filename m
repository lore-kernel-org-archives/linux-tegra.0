From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: use "depends on" for SoC configs instead of "if"
 after prompt
Date: Mon, 16 Nov 2015 11:06:22 +0000
Message-ID: <20151116110622.GL8644@n2100.arm.linux.org.uk>
References: <1447643170-23773-1-git-send-email-yamada.masahiro@socionext.com>
 <4171977.M1BLuS2ZzP@wuerfel>
 <d5271606263b496c841abd62647f9db0@SOC-EX02V.e01.socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d5271606263b496c841abd62647f9db0@SOC-EX02V.e01.socionext.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: yamada.masahiro@socionext.com
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, arm@kernel.org, mmarek@suse.com, olof@lixom.net, linux-kbuild@vger.kernel.org, jamie@jamieiles.com, agross@codeaurora.org, kernel@pengutronix.de, gregory.clement@free-electrons.com, linux-sh@vger.kernel.org, tsahee@annapurnalabs.com, linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org, galak@codeaurora.org, plagnioj@jcrosoft.com, dinguyen@opensource.altera.com, baohua@kernel.org, shiraz.linux.kernel@gmail.com, rjui@broadcom.com, patrice.chotard@st.com, kernel@stlinux.com, soren.brinkmann@xilinx.com, horms@verge.net.au, michal.simek@xilinx.com, heiko@sntech.de, linux-rockchip@lists.infradead.org, linux-soc@vger.kernel.org, davidb@codeaurora.org, sbranden@broadcom.com, vireshk@kernel.org, alexandre.belloni@free-electrons.com, kyungmin.park@samsung.com, mappyland78@gmail.com, k.kozlowski@samsung.com, bcm-kernel-fee
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 16, 2015 at 10:32:51AM +0000, yamada.masahiro@socionext.com wrote:
> Hi Arnd,
> 
>  
> > On Monday 16 November 2015 12:06:10 Masahiro Yamada wrote:
> > > Many ARM sub-architectures use prompts followed by "if" conditional,
> > > but it is wrong.
> > >
> > > Please notice the difference between
> > >
> > >     config ARCH_FOO
> > >             bool "Foo SoCs" if ARCH_MULTI_V7
> > >
> > > and
> > >
> > >     config ARCH_FOO
> > >             bool "Foo SoCs"
> > >             depends on ARCH_MULTI_V7
> > >
> > > These two are *not* equivalent!
> > >
> > > In the former statement, it is not ARCH_FOO, but its prompt that
> > > depends on ARCH_MULTI_V7.  So, it is completely valid that ARCH_FOO is
> > > selected by another, but ARCH_MULTI_V7 is still disabled. As it is not
> > > unmet dependency, Kconfig never warns.  This is probably not what you
> > > want.
> > 
> > Did you encounter a case where someone actually did a 'select' on one of
> > those symbols? I probably introduced a lot of them and did not expect that
> > to happen.
> 
> No, for ARM sub-architectures.
> But, yes for the ARM core part.
> 
> 
> For example, the following entry in arch/arm/Kconfig is suspicous.
> 
> config PCI
>         bool "PCI support" if MIGHT_HAVE_PCI
>         help
>           Find out whether you have a PCI motherboard. PCI is the name of a
>           bus system, i.e. the way the CPU talks to the other stuff inside
>           your box. Other bus systems are ISA, EISA, MicroChannel (MCA) or
>           VESA. If you have PCI, say Y, otherwise N.
> 
> 
> 
> 
> Try "make ARCH=arm footbridge_defconfig" and check the .config file.
> 
> It defines CONFIG_PCI=y, but not CONFIG_MIGHT_HAVE_PCI.
> I am not sure this is a sane .config or not.

It's correct.  "MIGHT_HAVE_PCI" is used by platforms which _might_ _have_
_PCI_, not by platforms which _do_ _have_ _PCI_.  Platforms which _do_
_have_ _PCI_ select PCI directly, and because "MIGHT_HAVE_PCI" is not
set, users are not offered an option that they can never disable.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
