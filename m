From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH V2 2/2] ARM: tegra: move timer.c to drivers/clocksource/
Date: Tue, 20 Nov 2012 09:17:11 +0100
Message-ID: <20121120091711.2609af06@skate>
References: <1353371237-2482-1-git-send-email-swarren@wwwdotorg.org>
	<1353371237-2482-2-git-send-email-swarren@wwwdotorg.org>
	<20121120005036.GA6280@kryptos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121120005036.GA6280@kryptos>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <josh.cartwright@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, John Stultz <johnstul@us.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Josh,

On Mon, 19 Nov 2012 18:50:36 -0600, Josh Cartwright wrote:

> I had suggested this with Thomas Petazzoni's consolidated irq_chip patch
> as well:
> 
> It seems like it would be a bit cleaner/easier to maintain if we relied
> on the linker to stitch together a clksrc_of_match table, based on what
> clocksources are being built into the image.  With that approach, at
> least, a public initialization header wouldn't have to be exposed, and
> this central table wouldn't have to be maintained (as more clocksrcs are
> added, I forsee [admittedly trivial] merge conflicts).

... and I indeed have a new version of my irqchip patches that indeed
use the linker to merge together the of_device_id entries!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
