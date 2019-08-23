From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 5/7] media: use the BIT() macro
Date: Fri, 23 Aug 2019 12:22:42 +0200
Message-ID: <59cf5c76-2bbb-6cdd-4a3a-12af0faf1238@samsung.com>
References: <20190823000829.GN5027@pendragon.ideasonboard.com>
 <CGME20190823094759epcas2p49a6bd2b5a8ada11cac762a67606d2b24@epcas2p4.samsung.com>
 <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
Content-Language: en-GB
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Richard Fontana <rfontana@redhat.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Krzysztof Kozlowski <krzk@kernel.org>, devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Ismael Luceno <ismael@iodev.co.uk>, Mauro Carvalho Chehab <mchehab@infradead.org>, Benoit Parrot <bparrot@ti.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Anton Sviridenko <anton@corp.bluecherry.net>, Allison Randal <allison@lohutok.net>, Andy Walls <awalls@md.metrocast.net>, Hyun Kwon <hyun.kwon@xilinx.com>, Greg
List-Id: linux-tegra@vger.kernel.org

On 8/23/19 11:47, Mauro Carvalho Chehab wrote:
> There are lots of places where we're doing 1 << 31. That's bad,
> as, depending on the architecture, this has an undefined behavior.
> 
> The BIT() macro is already prepared to handle this, so, let's
> just switch all "1 << number" macros by BIT(number) at the header files
> with has 1 << 31.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> v2: 
>   As suggested by Laurent:
>      - Don't touch multi-bit masks
>      - remove explicit casts

For:
  drivers/media/platform/exynos4-is/fimc-lite-reg.h
  drivers/media/platform/exynos4-is/fimc-reg.h
  drivers/media/platform/s3c-camif/camif-regs.h

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
