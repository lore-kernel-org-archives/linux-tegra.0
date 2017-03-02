From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [Outreachy kernel] [PATCH] staging: nvec: cleanup USLEEP_RANGE
 checkpatch checks
Date: Thu, 2 Mar 2017 16:18:56 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1703021618120.3414@hadrien>
References: <20170302142418.GA16773@singhal-Inspiron-5558>
 <alpine.DEB.2.20.1703021535500.3414@hadrien>
 <b90bc602-cf06-4abb-bea2-6386d4976864@googlegroups.com>
 <alpine.DEB.2.20.1703021557230.3414@hadrien>
 <4958c8a8-4b50-4567-91d8-9554e9bdf7f6@googlegroups.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-681796631-1488467905=:3414"
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <4958c8a8-4b50-4567-91d8-9554e9bdf7f6@googlegroups.com>
Content-ID: <alpine.DEB.2.20.1703021618310.3414@hadrien>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: SIMRAN SINGHAL <singhalsimran0@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, outreachy-kernel <outreachy-kernel@googlegroups.com>, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-681796631-1488467905=:3414
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.20.1703021618311.3414@hadrien>



On Thu, 2 Mar 2017, SIMRAN SINGHAL wrote:

>
>
> On Thursday, March 2, 2017 at 8:31:23 PM UTC+5:30, Julia Lawall wrote:
>
>
>       On Thu, 2 Mar 2017, SIMRAN SINGHAL wrote:
>
>       >
>       >
>       > On Thursday, March 2, 2017 at 8:06:40 PM UTC+5:30, Julia
>       Lawall wrote:
>       >
>       >
>       >       On Thu, 2 Mar 2017, simran singhal wrote:
>       >
>       >       > Resolve strict checkpatch USLEEP_RANGE checks by
>       converting
>       >       delays and
>       >       > sleeps as described in
>       >       ./Documentation/timers/timers-howto.txt.
>       >       >
>       >       > CHECK: usleep_range is preferred over udelay; see
>       >       Documentation/
>       >       > timers/timers-howto.txt
>       >       >
>       >       > Signed-off-by: simran singhal <singhal...@gmail.com>
>       >       > ---
>       >       >  drivers/staging/nvec/nvec.c | 4 ++--
>       >       >  1 file changed, 2 insertions(+), 2 deletions(-)
>       >       >
>       >       > diff --git a/drivers/staging/nvec/nvec.c
>       >       b/drivers/staging/nvec/nvec.c
>       >       > index c1feccf..cd35e64 100644
>       >       > --- a/drivers/staging/nvec/nvec.c
>       >       > +++ b/drivers/staging/nvec/nvec.c
>       >       > @@ -631,7 +631,7 @@ static irqreturn_t
>       nvec_interrupt(int irq,
>       >       void *dev)
>       >       >                  break;
>       >       >          case 2:                /* first byte after
>       command */
>       >       >                  if (status == (I2C_SL_IRQ | RNW |
>       RCVD)) {
>       >       > -                        udelay(33);
>       >       > +                        usleep_range(33, 100);
>       >
>       >       How did you choose the upper limit.
>       >
>       >       I believe that Greg previously suggested not to make
>       these
>       >       changes if you
>       >       have no way to test them.
>       >
>       > Julia, After going through the reply given by Nicholas Mc
>       Guire 
>       >
>       https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg16464.html
>       > in this reply he has mentioned that even the range of 10
>       microsecond is
>       > enough,
>       > so I prefer to take 100 as upper limit.  
>
>       Than you for the link.
>
>       It looks like he suggests to change 33 to 30-40, not to 33-100.
>        In any
>       case, you have three choices for this kind of issue:
>       1. Don't make the change, because you can't test the result
>       2. Make the change, and explain the commit log what your
>       rationale is
>       3. Make the change, and explain below the --- that you have no
>       idea what
>       you are doing, and you are just proposing the patch as something
>       concrete
>       to start a discussion.
>
>       But your preference is not a suitable justification.  The
>       hardware does
>       something, and the choice can only really be made by the person
>       who knows
>       what it does.
>
>  
> Thanks, 
> Julia I'll keep this in mind from next time.
>
> I choose the range from 33 to 100 for being on more safer side.
> Should I make it 30-40 and send v2.

I thought that the maintainer already responded saying that one shouldnot
change this code?

julia

>
>       julia
>
>       >  
>       > Simran
>       >
>       >       julia
>       >
>       >
>       >       >                          if (nvec->rx->data[0] !=
>       0x01) {
>       >       >                                  dev_err(nvec->dev,
>       >       >                                          "Read without
>       prior
>       >       read command\n");
>       >       > @@ -718,7 +718,7 @@ static irqreturn_t
>       nvec_interrupt(int irq,
>       >       void *dev)
>       >       >           * We experience less incomplete messages
>       with this
>       >       delay than without
>       >       >           * it, but we don't know why. Help is
>       appreciated.
>       >       >           */
>       >       > -        udelay(100);
>       >       > +        usleep_range(100, 200);
>       >       >
>       >       >          return IRQ_HANDLED;
>       >       >  }
>       >       > --
>       >       > 2.7.4
>       >       >
>       >       > --
>       >       > You received this message because you are subscribed
>       to the
>       >       Google Groups "outreachy-kernel" group.
>       >       > To unsubscribe from this group and stop receiving
>       emails from
>       >       it, send an email to outreachy-kern...@googlegroups.com.
>       >       > To post to this group, send email to
>       >       outreach...@googlegroups.com.
>       >       > To view this discussion on the webvisithttps://groups.google.com/d/msgid/outreachy-kernel/20170302142418.GA16
>       773%4
>       >       0singhal-Inspiron-5558.
>       >       > For more options, visit
>       https://groups.google.com/d/optout.
>       >       >
>       >
>       > --
>       > You received this message because you are subscribed to the
>       Google Groups
>       > "outreachy-kernel" group.
>       > To unsubscribe from this group and stop receiving emails from
>       it, send an
>       > email to outreachy-kern...@googlegroups.com.
>       > To post to this group, send email to
>       outreach...@googlegroups.com.
>       > To view this discussion on the webvisithttps://groups.google.com/d/msgid/outreachy-kernel/b90bc602-cf06-4abb-
>       bea2-
>       > 6386d4976864%40googlegroups.com.
>       > For more options, visit https://groups.google.com/d/optout.
>       >
>       >
>
> --
> You received this message because you are subscribed to the Google Groups
> "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to outreachy-kernel+unsubscribe@googlegroups.com.
> To post to this group, send email to outreachy-kernel@googlegroups.com.
> To view this discussion on the web visithttps://groups.google.com/d/msgid/outreachy-kernel/4958c8a8-4b50-4567-91d8-
> 9554e9bdf7f6%40googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
>
>
--8323329-681796631-1488467905=:3414
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--8323329-681796631-1488467905=:3414--
