From: Josh Abraham <j.abraham1776@gmail.com>
Subject: Re: [PATCH] staging: nvec: Fix usleep_range is preferred over udelay
Date: Wed, 29 Nov 2017 11:17:18 -0500
Message-ID: <20171129161718.GA26902@josharch>
References: <20171129160002.GA26462@josharch>
 <78551ca3-9ebe-3010-f856-46026f9ce9a3@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <78551ca3-9ebe-3010-f856-46026f9ce9a3@kapsi.fi>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 29, 2017 at 06:07:53PM +0200, Mikko Perttunen wrote:
> On 11/29/2017 06:00 PM, Joshua Abraham wrote:
> > Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>
> > 
> > This patch fixes the issue:
> > 
> > CHECK: usleep_range is preferred over udelay; see
> > Documentation/timers/timers-howto.txt
> > 
> > ---
> >   drivers/staging/nvec/nvec.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > index 4ff8f47385da..2a01ef4b54ff 100644
> > --- a/drivers/staging/nvec/nvec.c
> > +++ b/drivers/staging/nvec/nvec.c
> > @@ -631,7 +631,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
> >   		break;
> >   	case 2:		/* first byte after command */
> >   		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> > -			udelay(33);
> > +			usleep_range(30, 35);
> >   			if (nvec->rx->data[0] != 0x01) {
> >   				dev_err(nvec->dev,
> >   					"Read without prior read command\n");
> > 
> 
> This is incorrect, as this function is an interrupt handler and we cannot
> sleep in interrupt context.
> 
> Cheers,
> Mikko

My mistake.  Thank you for the feedback!
-Josh
