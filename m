From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3] Watchdog: Fix parent of watchdog_devices
Date: Wed, 2 Sep 2015 10:39:24 +0100
Message-ID: <20150902093924.GA12688@ck-lbox>
References: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pratyush Anand <panand@redhat.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, "open
 list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>, "open list:INTEL MANAGEMENT ENGINE (mei)" <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/SAMSUNG EXYNOS
 ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Lee Jones <lee@kernel.org>, Kukjin Kim <kgene@kernel.org>, Tomas Winkler <tomas.winkler@intel.com>, linux@roeck-us.net, linux-watchdog@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:TEGRA
 ARCHITECTURE SUPPORT" <linux-tegra@vge>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 19, 2015 at 08:58:24AM +0530, Pratyush Anand wrote:
> /sys/class/watchdog/watchdogn/device/modalias can help to identify the
> driver/module for a given watchdog node. However, many wdt devices does not set
> its parent and so, we do not see an entry for device in sysfs for such devices.
> 
> This patch fixes parent of watchdog_device so that
> /sys/class/watchdog/watchdogn/device is populated.
> 
> Exceptions: booke, diag288, mpc8xxx, octeon, softdog and w83627hf -- They do not
> have any parent. Not sure, how we can we identify driver for these devices.
> 
> Signed-off-by: Pratyush Anand <panand@redhat.com>
> ---

For the Wolfson parts:

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
