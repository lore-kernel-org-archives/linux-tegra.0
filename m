From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: remove warning dump if timeout happen in
 transfer
Date: Fri, 15 Feb 2013 14:04:17 +0100
Message-ID: <20130215130417.GC21335@the-dreams.de>
References: <1360845813-11334-1-git-send-email-ldewangan@nvidia.com>
 <CAM=Q2csZyX5PvOPiSJ22u0SCXvh19y1qoC3+qJmmPfTQziM-tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM=Q2csZyX5PvOPiSJ22u0SCXvh19y1qoC3+qJmmPfTQziM-tg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 15, 2013 at 06:31:07PM +0530, Shubhrajyoti Datta wrote:
> On Thu, Feb 14, 2013 at 6:13 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > If timeout error occurs in the i2c transfer then it was dumping warning
> > of call stack.
> >
> > Remove the warning dump as there is may be possibility that some slave
> > devices are busy and not responding the i2c communication.
> >
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > The patch is generated based on discussion happen between Stephena and
> > Wolfram on the patch:
> >  i2c: add bcm2835 driver
> >
> > resending patch as Wolfram's email id has been changed.
> >
> >  drivers/i2c/busses/i2c-tegra.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> > index ae2e027..36704e3 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -587,7 +587,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> >         ret = wait_for_completion_timeout(&i2c_dev->msg_complete, TEGRA_I2C_TIMEOUT);
> >         tegra_i2c_mask_irq(i2c_dev, int_mask);
> >
> > -       if (WARN_ON(ret == 0)) {
> > +       if (ret == 0) {
> 
> I think WARN_ON has a unlikely.
> 
> If you could do a profiling and have the unlikely.
> 
> BTW thats not an objection to the patch though.

The thing is: Timeouts can be expected on an I2C bus. Devices can be
busy, that's fine. So, no need for a WARN. I'm even thinking of asking
to remove the dev_err here, or at least change it into dev_warn, but
haven't made up my mind yet.

Regards,

   Wolfram
