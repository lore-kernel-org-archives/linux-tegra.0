From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] base: dd: don't remove driver_data in -EPROBE_DEFER case
Date: Tue, 3 May 2016 08:07:39 -0700
Message-ID: <20160503150739.GA14897@kroah.com>
References: <1457450122-5792-1-git-send-email-yizhang_hust@163.com>
 <20160503131126.GA18494@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160503131126.GA18494-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yi Zhang <yizhang_hust-9Onoh4P/yGk@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 03, 2016 at 03:11:26PM +0200, Thierry Reding wrote:
> On Tue, Mar 08, 2016 at 11:15:22PM +0800, Yi Zhang wrote:
> > the driver_data may be used for sanity check, it fails the
> > probe() if driver_data is NULL after it is re-triggered.
> > for example, soc_probe() in sound/soc/soc-core.c
> > 
> > Signed-off-by: Yi Zhang <yizhang_hust-9Onoh4P/yGk@public.gmane.org>
> > ---
> >  drivers/base/dd.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Hi Greg,
> 
> This causes a boot regression on at least one board, caused by one of
> the drivers looking at driver data to check whether or not the driver
> has properly loaded. If the code encounters a non-NULL pointer it
> tries to dereference it, but because it's already been freed there is
> no memory backing it and things crash.
> 
> I don't think keeping stale pointers around is a good idea. The whole
> point of setting this to NULL in the core is so that probe failures
> result in the same starting conditions no matter what.
> 
> Can we please get this reverted?
> 
> Cc'ing linux-tegra for visibility since that's where the boot regression
> is observed.

Now reverted, thanks for letting me know.

greg k-h
