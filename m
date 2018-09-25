From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.14 156/173] gpiolib: Respect error code of
 ->get_direction()
Date: Tue, 25 Sep 2018 16:42:52 +0200
Message-ID: <20180925144252.GA28362@kroah.com>
References: <20180924113114.334025954@linuxfoundation.org>
 <20180924113126.730832814@linuxfoundation.org>
 <dfdf04ac-2413-ccf3-a8ea-407674cc6b08@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dfdf04ac-2413-ccf3-a8ea-407674cc6b08@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <alexander.levin@microsoft.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 25, 2018 at 03:12:13PM +0100, Jon Hunter wrote:
> Hi Greg,
> 
> On 24/09/18 12:53, Greg Kroah-Hartman wrote:
> > 4.14-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > [ Upstream commit 36b312792b97933dc07abe074f50941199bd357c ]
> > 
> > In case we try to lock GPIO pin as IRQ when something going wrong
> > we print a misleading message.
> > 
> > Correct this by checking an error code from ->get_direction() in
> > gpiochip_lock_as_irq() and printing a corresponding message.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/gpio/gpiolib.c |    6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2811,6 +2811,12 @@ int gpiochip_lock_as_irq(struct gpio_chi
> >  	if (!chip->can_sleep && chip->get_direction) {
> >  		int dir = chip->get_direction(chip, offset);
> >  
> > +		if (dir < 0) {
> > +			chip_err(chip, "%s: cannot get GPIO direction\n",
> > +				 __func__);
> > +			return dir;
> > +		}
> > +
> >  		if (dir)
> >  			clear_bit(FLAG_IS_OUT, &desc->flags);
> >  		else
> 
> This change is causing a boot regression on Tegra20 and Tegra30. After
> this change was merged in mainline there was a fix for Tegra [0] that
> was also needed.
> 
> On Tegra the above change causes the allocation of GPIOs to fail and
> looks like this then exposes another bug somewhere else that finally
> leads to a system crash.
> 
> If this is needed for stable, then we will need the fix for Tegra as well.

Thanks, I've just dropped this from all of the queues, no need to cause
more problems.

greg k-h
