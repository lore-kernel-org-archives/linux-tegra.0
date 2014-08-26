From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Tue, 26 Aug 2014 12:04:18 +0200
Message-ID: <4609609.i9jPXymFJZ@wuerfel>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
 <20140826065729.GC15573@ulmo>
 <063D6719AE5E284EB5DD2968C1650D6D17481234@AcuExch.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6D17481234@AcuExch.aculab.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jassi Brar <jassisinghbrar@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, David Laight <David.Laight@aculab.com>, 'Thierry Reding' <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 26 August 2014 08:54:53 David Laight wrote:
> From: Thierry Reding
> ...
> > > Is _nocache required? I don't see other drivers using it. I assume there's
> > > nothing special about the mbox registers.
> > 
> > Most drivers should be using devm_ioremap_resource() which will use the
> > _nocache variant of devm_ioremap() when appropriate. Usually the region
> > will not be marked cacheable (IORESOURCE_CACHEABLE) and therefore be
> > remapped uncached.
> 
> A related question:
> Is there any way for a driver to force that part of a PCIe BAR be mapped
> through the data cache even when the BAR isn't actually marked cacheable?

No. BARs are not actually marked cacheable anyway, except for the ROM
BAR, which we tend to not use.

Some architectures don't even allow any caching of PCI memory ranges,
so we have no architecture independent API for that.

It's possible that ioremap_cache() works on x86 and/or ARM if you call
it manually on the physical address (rather than using a resource
API).

> Some hardware has address regions (which might not be an entire BAR)
> that are actually memory and mapping through the data cache will
> generate longer PCIe transfers [1].
> Clearly the driver will have to be very careful about cache flushes
> and invalidates to make this work.

Some framebuffer drivers use writethrough mappings, but those again
are only available on few architectures. vesafb uses ioremap_cache,
but this works because the memory is in system RAM and not on PCI.

	Arnd
