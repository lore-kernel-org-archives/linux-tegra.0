From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Wed, 31 Aug 2011 17:31:29 +0100
Message-ID: <20110831163129.GY2061@opensource.wolfsonmicro.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
 <CAMbhsRRRa_JV8_LHEvsM2h3e8Hbf1GAcpXz8gdU3wCc8Jgz5gw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04B3279D4F@HQMAIL01.nvidia.com>
 <201108311828.40783.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201108311828.40783.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 31, 2011 at 06:28:40PM +0200, Arnd Bergmann wrote:

> Sorry, I normally like to give my opinion on everything, but I really don't
> have a clue what this one is about. I don't understand i2c or power management ;-)

The issue is that due to our sequencing suspend and resume using the
control heirachy rather than dependencies we attempt to suspend the I2C
controller prior to some devices that need it.  As we don't have a good
solution for this at the minute where it's an issue we've been avoiding
it by using the _noirq() suspend and resume functions for the controller
to reorder their suspend with respect to the rest of the system.  It's
not great but practically speaking it works.
