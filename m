From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Staging: nvec: nvec: fixed check style issues
Date: Sun, 16 Dec 2018 14:30:01 -0800
Message-ID: <325ac79885892082f4a5b9fe294178d59c2ced68.camel@perches.com>
References: <1544996634-10427-1-git-send-email-indigoomega021@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544996634-10427-1-git-send-email-indigoomega021@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>, marvin24@gmx.de
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, 2018-12-16 at 13:43 -0800, Amir Mahdi Ghorbanian wrote:
> Replaced udelay() by the preferred usleep_range() function.
[]
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
[]
> @@ -626,7 +626,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(0, 33);

Umm, this is not the same outcome.

udelay delays a minimum of 33 usecs.
usleep_range delays from min to max usecs.


kernel/time/timer.c: * usleep_range - Sleep for an approximate time
kernel/time/timer.c- * @min: Minimum time in usecs to sleep
kernel/time/timer.c- * @max: Maximum time in usecs to sleep
kernel/time/timer.c- *
kernel/time/timer.c- * In non-atomic context where the exact wakeup time is flexible, use
kernel/time/timer.c: * usleep_range() instead of udelay().  The sleep improves responsiveness
kernel/time/timer.c- * by avoiding the CPU-hogging busy-wait of udelay(), and the range reduces
kernel/time/timer.c- * power usage by allowing hrtimers to take advantage of an already-
kernel/time/timer.c- * scheduled interrupt instead of scheduling a new one just for this sleep.
kernel/time/timer.c- */

>  			if (nvec->rx->data[0] != 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");
> @@ -713,7 +713,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  	 * We experience less incomplete messages with this delay than without
>  	 * it, but we don't know why. Help is appreciated.
>  	 */
> -	udelay(100);
> +	usleep_range(0, 100);

here too.
