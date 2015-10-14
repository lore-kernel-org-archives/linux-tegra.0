From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging: nvec: fixed few coding style warnings
Date: Wed, 14 Oct 2015 21:12:36 +0300
Message-ID: <20151014181236.GX7340@mwanda>
References: <20151014140822.GA23114@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20151014140822.GA23114@localhost.localdomain>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakshi Bansal <sakshi.april5@gmail.com>
Cc: devel@driverdev.osuosl.org, jak@jak-linux.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 14, 2015 at 07:38:22PM +0530, Sakshi Bansal wrote:
> Fixed allignmnet issues and block comments usage
> 

Split it apart by type of fix.

> @@ -617,7 +618,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		} else {
>  			nvec->rx = nvec_msg_alloc(nvec, NVEC_MSG_RX);
>  			/* Should not happen in a normal world */
> -			if (unlikely(nvec->rx == NULL)) {
> +			if (!unlikely(nvec->rx)) {

This isn't right.  You intented to say:

	if (unlikely(!nvec->rx)) {

But even better to just remove the unlikely entirely.

	if (!nvec->rx) {

>  				nvec->state = 0;
>  				break;
>  			}

regards,
dan carpenter
