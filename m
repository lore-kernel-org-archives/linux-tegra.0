From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging: nvec: fixed few coding style warnings
Date: Thu, 15 Oct 2015 11:48:12 +0300
Message-ID: <20151015084812.GP7289@mwanda>
References: <20151014140822.GA23114@localhost.localdomain>
 <20151014181236.GX7340@mwanda> <1971511.Ec7FdKlGRN@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1971511.Ec7FdKlGRN@fb07-iapwap2>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Sakshi Bansal <sakshi.april5@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 15, 2015 at 10:39:02AM +0200, Marc Dietrich wrote:
> > > -			if (unlikely(nvec->rx == NULL)) {
> > > +			if (!unlikely(nvec->rx)) {
> > 
> > This isn't right.  You intented to say:
> > 
> > 	if (unlikely(!nvec->rx)) {
> > 
> > But even better to just remove the unlikely entirely.
> > 
> > 	if (!nvec->rx) {
> 
> why? the "unlikely" is there to optimize a critical interrupt path.

The rule is that drivers should not use likely/unlikely() unless there
is a difference in benchmark numbers.  How critical can it be when it's
always followed by a udelay(100)???

There are more important optimizations needed here.

regards,
dan carpenter
