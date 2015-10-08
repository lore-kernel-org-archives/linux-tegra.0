From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] arm: rpi: Device tree modifications for U-Boot
Date: Thu, 8 Oct 2015 17:50:15 +0200
Message-ID: <20151008155015.GC11776@xo-6d-61-c0.localdomain>
References: <1439303153-12171-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439303153-12171-1-git-send-email-sjg@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Glass <sjg@chromium.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

Hi!

> This updates the device tree from the kernel version to something suitable
> for U-Boot:
> 
> - Add stdout-path alias for console
> - Mark the /soc node to be available pre-relocation so that the early
> serial console works (we need the 'ranges' property to be available)
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  arch/arm/boot/dts/bcm2835.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> @@ -16,6 +17,7 @@
>  		#size-cells = <1>;
>  		ranges = <0x7e000000 0x20000000 0x02000000>;
>  		dma-ranges = <0x40000000 0x00000000 0x20000000>;
> +		u-boot,dm-pre-reloc;
>

Given low ammount of memory available for SPL, such stuff is going to be neccessary.

Should it have more generic name... "critical-for-early-boot" ?

Best regards,
									Pavel
