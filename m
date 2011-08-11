From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] ARM: tegra: Fix <mach/gpio.h> to have necessary
 #includes
Date: Thu, 11 Aug 2011 12:49:47 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD0@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, Olof Johansson <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Russell King wrote at Thursday, August 11, 2011 1:36 PM:
> On Thu, Aug 11, 2011 at 12:05:52PM -0600, Stephen Warren wrote:
> > Without this, EINVAL isn't defined, and type bool isn't declared.
> > This leads to compilation failures.
> 
> An alternative approach would be to convert tegra to be able to use
> the gpiolib __gpio_to_irq() for the on-SoC stuff, and eliminate
> irq_to_gpio().
> 
> Would it be possible to do that instead?

That should work too.

I posted a couple patches last Friday to remove irq_to_gpio:

https://lkml.org/lkml/2011/8/5/343
https://lkml.org/lkml/2011/8/5/342

Later in the thread, you said you would merge them into your branch to
avoid merge conflicts with the other GPIO work you were doing.

For gpio_to_irq, yes, I believe we get rid of it pretty easily; we'd
just need to implement gpio-tegra.c's gpio_chip.to_irq function. Should
I cook up a patch based on top of linux-next plus the two patches above
to do that instead?

Thanks.

-- 
nvpublic
