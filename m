From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [Outreachy kernel] [PATCH] staging: nvec: cleanup USLEEP_RANGE
 checkpatch checks
Date: Thu, 2 Mar 2017 15:36:29 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1703021535500.3414@hadrien>
References: <20170302142418.GA16773@singhal-Inspiron-5558>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170302142418.GA16773@singhal-Inspiron-5558>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: simran singhal <singhalsimran0@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org



On Thu, 2 Mar 2017, simran singhal wrote:

> Resolve strict checkpatch USLEEP_RANGE checks by converting delays and
> sleeps as described in ./Documentation/timers/timers-howto.txt.
>
> CHECK: usleep_range is preferred over udelay; see Documentation/
> timers/timers-howto.txt
>
> Signed-off-by: simran singhal <singhalsimran0@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index c1feccf..cd35e64 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -631,7 +631,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(33, 100);

How did you choose the upper limit.

I believe that Greg previously suggested not to make these changes if you
have no way to test them.

julia


>  			if (nvec->rx->data[0] != 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");
> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  	 * We experience less incomplete messages with this delay than without
>  	 * it, but we don't know why. Help is appreciated.
>  	 */
> -	udelay(100);
> +	usleep_range(100, 200);
>
>  	return IRQ_HANDLED;
>  }
> --
> 2.7.4
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To post to this group, send email to outreachy-kernel@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20170302142418.GA16773%40singhal-Inspiron-5558.
> For more options, visit https://groups.google.com/d/optout.
>
