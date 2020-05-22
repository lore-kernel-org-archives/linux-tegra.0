From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance
 on error
Date: Fri, 22 May 2020 16:23:18 +0300
Message-ID: <20200522132318.GM30374@kadam>
References: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
 <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com>
 <20200520150230.GC30374@kadam>
 <2a46539d.b977f.1723553aa81.Coremail.dinghao.liu@zju.edu.cn>
 <20200521091505.GF30374@kadam>
 <CAJZ5v0irLayBUPRWNT1tcZivz9inS1YbUgGj5WXvucLKKwRQAw@mail.gmail.com>
 <20200521173901.GA22310@kadam>
 <20200522131031.GL2163848@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200522131031.GL2163848@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org, Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 22, 2020 at 03:10:31PM +0200, Thierry Reding wrote:
> On Thu, May 21, 2020 at 08:39:02PM +0300, Dan Carpenter wrote:
> > On Thu, May 21, 2020 at 05:22:05PM +0200, Rafael J. Wysocki wrote:
> > > On Thu, May 21, 2020 at 11:15 AM Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> > > >
> > > > On Thu, May 21, 2020 at 11:42:55AM +0800, dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org wrote:
> > > > > Hi, Dan,
> > > > >
> > > > > I agree the best solution is to fix __pm_runtime_resume(). But there are also
> > > > > many cases that assume pm_runtime_get_sync() will change PM usage
> > > > > counter on error. According to my static analysis results, the number of these
> > > > > "right" cases are larger. Adjusting __pm_runtime_resume() directly will introduce
> > > > > more new bugs. Therefore I think we should resolve the "bug" cases individually.
> > > > >
> > > >
> > > > That's why I was saying that we may need to introduce a new replacement
> > > > function for pm_runtime_get_sync() that works as expected.
> > > >
> > > > There is no reason why we have to live with the old behavior.
> > > 
> > > What exactly do you mean by "the old behavior"?
> > 
> > I'm suggesting we leave pm_runtime_get_sync() alone but we add a new
> > function which called pm_runtime_get_sync_resume() which does something
> > like this:
> > 
> > static inline int pm_runtime_get_sync_resume(struct device *dev)
> > {
> > 	int ret;
> > 
> > 	ret = __pm_runtime_resume(dev, RPM_GET_PUT);
> > 	if (ret < 0) {
> > 		pm_runtime_put(dev);
> > 		return ret;
> > 	}
> > 	return 0;
> > }
> > 
> > I'm not sure if pm_runtime_put() is the correct thing to do?  The other
> > thing is that this always returns zero on success.  I don't know that
> > drivers ever care to differentiate between one and zero returns.
> > 
> > Then if any of the caller expect that behavior we update them to use the
> > new function.
> 
> Does that really have many benefits, though? I understand that this
> would perhaps be easier to use because it is more in line with how other
> functions operate. On the other hand, in some cases you may want to call
> a different version of pm_runtime_put() on failure, as discussed in
> other threads.

I wasn't CC'd on the other threads so I don't know.  :/  I have always
assumed it was something like this but I don't know the details and
there is no documentation.

http://sweng.the-davies.net/Home/rustys-api-design-manifesto
You're essentially arguing that it's a #1 on Rusty's scale but ideally
we would want to be at #7.

> 
> Even ignoring that issue, any existing callsites that are leaking the
> reference would have to be updated to call the new function, which would
> be pretty much the same amount of work as updating the callsites to fix
> the leak, right?

With the current API we're constantly adding bugs.  I imagine that once
we add a straight forward default and some documentation then we will
solve this.

> 
> So if instead we just fix up the leaks, we might have a case of an API
> that doesn't work as some of us (myself included) expected it, but at
> least it would be consistent. If we add another variant things become
> fragmented and therefore even more complicated to use and review.

That's the approach that we've been trying and it's clearly not working.

regards,
dan carpenter
