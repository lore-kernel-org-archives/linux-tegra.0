From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Check for overflow errors with BUG_ON.
Date: Tue, 23 Aug 2011 19:39:07 +0100
Message-ID: <20110823183907.GA24318@freya.fluff.org>
References: <1313434172-18319-1-git-send-email-dianders@chromium.org>
 <20110815191745.GA7178@legolas.emea.dhcp.ti.com>
 <CAD=FV=Xd67iw=GXV9i4O5LKnJd20=BkYyfVuxPgxQ5GZRJEy4A@mail.gmail.com>
 <20110815200349.GA2616@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110815200349.GA2616-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 15, 2011 at 11:03:50PM +0300, Felipe Balbi wrote:
> HI,
> 
> On Mon, Aug 15, 2011 at 12:52:36PM -0700, Doug Anderson wrote:
> > Felipe,
> > 
> > On Mon, Aug 15, 2011 at 12:17 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > > so due to a FIFO overflow you lock up the whole system ? Can't you e.g.
> > > reset the controller and reconfigure it rather than locking up the
> > > system ?
> > 
> > Certainly we could try to be more proactive and reset / retry / return
> > the error to the client.  However, since the only expected situation
> > where this BUG_ON should hit is due to a bug in this driver itself
> > (AKA: i2c clients shouldn't be able to do anything to cause the BUG_ON
> > to hit), that seems like a lot of added complexity.
> 
> so at least just pass an error to the client, but hanging the entire
> system seems a bit too much, dont you think ?
> 
> > Also: if there is an arbitrary software bug that causing an overflow
> > condition to occur, I'm not sure how stable the system will be.
> > Specifically, the i2c controller is used (among other things) to talk
> > to the PMU and adjust voltages in the system.  If we just sent it a
> > random command, I'd rather report the bug right away so we don't get
> > hard to find/reproduce failures in other parts of the system.
> 
> that's a good point, I still think that e.g. making a cellphone
> unresponsive until a watchdog reset triggers just because you got a FIFO
> overflow on the I2C controller is too much.

Yes, I would agree on that. BUG() really should be only used
for occasions where there's little possiblity the entire system
can continue to work.

In this case, it seems far more sensible to report this as an
error and see what can be done to recover the bus and controller
for the next transaction.

-- 
Ben
