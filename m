From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip/tegra: fix fix sparse warnings on __iomem
Date: Mon, 13 Jun 2016 00:54:01 +0000
Message-ID: <20160613005401.GH24391@io.lakedaemon.net>
References: <1465302292-4840-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1465302292-4840-1-git-send-email-ben.dooks@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Ben,

On Tue, Jun 07, 2016 at 01:24:52PM +0100, Ben Dooks wrote:
> Fix the following warnings from sparse due to casting to/from __iomem
> annotated variables:
> 
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:269:57: warning: incorrect type in argument 5 (different address spaces)
> drivers/irqchip/irq-tegra.c:269:57:    expected void *chip_data
> drivers/irqchip/irq-tegra.c:269:57:    got void [noderef] <asn:2>*<noident>
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/irqchip/irq-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to irqchip/misc with Thierry's Ack.

thx,

Jason.
