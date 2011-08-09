From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 00/13] Clean up mach/gpio.h headers
Date: Tue, 9 Aug 2011 09:04:12 +0100
Message-ID: <20110809080411.GA1831@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Nicolas Pitre <nico@fluxnic.net>
List-Id: linux-tegra@vger.kernel.org

This is a preliminary posting of my gpio patch set.

This patch series moves the trivial gpiolib implementations out of
mach/gpio.h and into asm/gpio.h.

As a side effect of that, most of this patch series is about fixing up
direct includes of mach/gpio.h - this is something I've been on at
people over the last year or more about ensuring that they use
linux/gpio.h in preference.  While I've blindly converted all arch/arm
to use linux/gpio.h (with the exception of mach/ includes which are
converted to asm/gpio.h), drivers were only converted to asm/gpio.h.
These should be reviewed and changed to linux/gpio.h.

As a result of this patch series, several mach/gpio.h end up being
empty.

Many others just contain platform private GPIO APIs and definitions.

The last thing which mach/gpio.h is used for is to provide a definition
for ARCH_GPIO_NR to asm-generic/gpio.h.  I've not attempted to solve
that issue yet.

A small number of platforms optimize the gpio accessors for on-SoC
GPIOs.  In the interests of consolidation, these will have to be killed
but this patch set does not do that yet.

Lastly, several {mach,plat}/gpio.h needs to be looked at with a view to
deleting the direct include of asm-generic/gpio.h.
