From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Tue, 26 Feb 2013 10:36:09 +0100
Message-ID: <4928288.ie8EUukfVD@fb07-iapwap2.physik.uni-giessen.de>
References: <512BF81A.3080700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <512BF81A.3080700@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, ARM kernel mailing list <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Stephen,

Am Montag, 25. Februar 2013, 16:47:38 schrieb Stephen Warren:
> I'm looking into enabling CONFIG_MULTIPLATFORM on Tegra for 3.10, and
> the main blocking issue is due to commit 62e4d35 "ARM: 7609/1: disable
> errata work-arounds which access secure registers". Various Tegra
> versions need 3 of those workarounds, and our bootloader doesn't
> implement them (at the least, upstream U-Boot; not sure about our
> downstream code, but I'm fairly sure given the lack of any feedback I
> got in the bug I filed to implement them).
> 
> Now, I can easily add those 3 errata workarounds to U-Boot, but that
> will require people to reflash their bootloader. This is probably
> acceptable for development/reference boards (although I'm sure people
> will find it annoying) but for re-purposed production boards (such as
> the Toshiba AC100 or various tablets) it will be impossible to update
> the factory bootloader. Switching to upstream U-Boot would currently
> lose some functionality, and significantly affect people's boot flow, so
> is likely unacceptable.

personally, I have no problem to require a certain u-boot version for a given 
kernel. From a distro point of view, you will likely update the 
bootloader/kernel on a distro update anyway.

> Is there any other alternative I'm not seeing? Having the kernel
> suddenly become incompatible with any currently extant bootloader when I
> enable CONFIG_MULTIPLATFORM doesn't seem like a great idea.

I *think* it's ok to deprecate fastboot on older devices. AFAIK, the in-kernel 
supported boards all have u-boot support already.

Marc
