From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging/nvec: Pass proper resource to mfd_add_devices()
Date: Mon, 21 Jul 2014 14:39:15 -0700
Message-ID: <20140721213915.GA8168@kroah.com>
References: <1405943561-2656-1-git-send-email-thierry.reding@gmail.com>
 <20140721220136.5bd54deb52f7717d8880b11c@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20140721220136.5bd54deb52f7717d8880b11c@gmx.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, Thierry Reding <thierry.reding@gmail.com>, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 21, 2014 at 10:01:36PM +0200, Marc Dietrich wrote:
> Hi Thierry,
> 
> On Mon, 21 Jul 2014 13:52:41 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
> 
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > The mfd_add_devices() parameter takes a struct resource * as fifth
> > argument, but the nvec driver passes in a void __iomem *. The driver
> > gets away with it because none of the subdevices ever directly access
> > the registers.
> 
> you are right, this one looked bogus. 
> 
> > While at it, use platform_get_irq() instead of platform_get_resource()
> > to get the device's interrupt. This makes it easier to pass in the
> > register region since the variable is no longer reused.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Alternatively we could simply pass NULL into mfd_add_devices(), which
> > might be a slightly more accurate representation of what's going on.
> >
> > Marc, Greg, any preferences?
> 
> I just tested with NULL as base and it seems to produce no harm. Even
> if we may get rid of mfd_add_devices in the future, passing NULL is
> cleaner for now and no children will ever make use of it. So please send
> a new version with this change.
> 
> Otherwise, thanks for looking and cleaning up.

Ok, can I get your ack for this patch then?

thanks,

greg k-h
