From: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Subject: Re: [PATCH] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter
 functionality
Date: Sun, 29 May 2011 23:57:02 +0300
Message-ID: <20110529205702.GA5252@gentoodev.compulab.local>
References: <1302691521-19096-1-git-send-email-mike@compulab.co.il>
 <4DBFBEAD.2080103@compulab.co.il>
 <20110504215133.GY15795@trinity.fluff.org>
Reply-To: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110504215133.GY15795-SMNkleLxa3Z6Wcw2j4pizdi2O/JbrIOy@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Ben,

On Wed, May 04, 2011 at 10:51:33PM +0100, Ben Dooks wrote:
> On Tue, May 03, 2011 at 11:37:01AM +0300, Mike Rapoport wrote:
> > Hi Ben,
> > Any comments on this?
> > 
> > On 04/13/11 13:45, Mike Rapoport wrote:
> > > as there are a lot of i2c device drivers that require it.
> > > 
> > > Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> > > ---
> > >  drivers/i2c/busses/i2c-tegra.c |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > 
> 
> I think this is ok, but will check tomorrow

Can you please merge this patch? So that it can hit the mainline at
leaset at 2.6.41?

> -- 
> Ben Dooks, ben-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, http://www.fluff.org/ben/
> 
> Large Hadron Colada: A large Pina Colada that makes the universe disappear.
> 
--
Sincerely yours,
Mike
