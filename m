From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v2 5/7] media: use the BIT() macro
Date: Fri, 23 Aug 2019 07:12:05 -0500
Message-ID: <20190823121204.ze4m6m3dxevjpjp6@ti.com>
References: <20190823000829.GN5027@pendragon.ideasonboard.com>
 <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Richard Fontana <rfontana@redhat.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, devel@driverdev.osuosl.org, Krzysztof Kozlowski <krzk@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Ismael Luceno <ismael@iodev.co.uk>, Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Anton Sviridenko <anton@corp.bluecherry.net>
List-Id: linux-tegra@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote on Fri [2019-Aug-23 06:47:30 -0300]:
> As warned by cppcheck:
> 
> 	[drivers/media/dvb-frontends/cx24123.c:434]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 	[drivers/media/pci/bt8xx/bttv-input.c:87]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 	[drivers/media/pci/bt8xx/bttv-input.c:98]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 			...
> 	[drivers/media/v4l2-core/v4l2-ioctl.c:1391]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 
> There are lots of places where we're doing 1 << 31. That's bad,
> as, depending on the architecture, this has an undefined behavior.
> 
> The BIT() macro is already prepared to handle this, so, let's
> just switch all "1 << number" macros by BIT(number) at the header files
> with has 1 << 31.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
> 
> v2: 
>   As suggested by Laurent:
>      - Don't touch multi-bit masks
>      - remove explicit casts
> 
For:
drivers/media/platform/am437x/am437x-vpfe_regs.h
drivers/media/platform/ti-vpe/vpe_regs.h

Reviewed-by: Benoit Parrot <bparrot@ti.com>
