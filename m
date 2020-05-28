From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Re: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance
 on error
Date: Thu, 28 May 2020 15:08:18 +0300
Message-ID: <20200528120818.GO22511@kadam>
References: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
 <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com>
 <20200520150230.GC30374@kadam>
 <2a46539d.b977f.1723553aa81.Coremail.dinghao.liu@zju.edu.cn>
 <20200521091505.GF30374@kadam>
 <CAJZ5v0irLayBUPRWNT1tcZivz9inS1YbUgGj5WXvucLKKwRQAw@mail.gmail.com>
 <20200521173901.GA22310@kadam>
 <20200522131031.GL2163848@ulmo>
 <20200522132318.GM30374@kadam>
 <20200522144312.GA2374603@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200522144312.GA2374603@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra <linux-tegra@vger.kernel.org>, dinghao.liu@zju.edu.cn, Kangjie Lu <kjlu@umn.edu>, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 22, 2020 at 04:43:12PM +0200, Thierry Reding wrote:
> On Fri, May 22, 2020 at 04:23:18PM +0300, Dan Carpenter wrote:
> > On Fri, May 22, 2020 at 03:10:31PM +0200, Thierry Reding wrote:
> > > On Thu, May 21, 2020 at 08:39:02PM +0300, Dan Carpenter wrote:
> > > > On Thu, May 21, 2020 at 05:22:05PM +0200, Rafael J. Wysocki wrote:
> > > > > On Thu, May 21, 2020 at 11:15 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > >
> > > > > > On Thu, May 21, 2020 at 11:42:55AM +0800, dinghao.liu@zju.edu.cn wrote:
> > > > > > > Hi, Dan,
> > > > > > >
> > > > > > > I agree the best solution is to fix __pm_runtime_resume(). But there are also
> > > > > > > many cases that assume pm_runtime_get_sync() will change PM usage
> > > > > > > counter on error. According to my static analysis results, the number of these
> > > > > > > "right" cases are larger. Adjusting __pm_runtime_resume() directly will introduce
> > > > > > > more new bugs. Therefore I think we should resolve the "bug" cases individually.
> > > > > > >
> > > > > >
> > > > > > That's why I was saying that we may need to introduce a new replacement
> > > > > > function for pm_runtime_get_sync() that works as expected.
> > > > > >
> > > > > > There is no reason why we have to live with the old behavior.
> > > > > 
> > > > > What exactly do you mean by "the old behavior"?
> > > > 
> > > > I'm suggesting we leave pm_runtime_get_sync() alone but we add a new
> > > > function which called pm_runtime_get_sync_resume() which does something
> > > > like this:
> > > > 
> > > > static inline int pm_runtime_get_sync_resume(struct device *dev)
> > > > {
> > > > 	int ret;
> > > > 
> > > > 	ret = __pm_runtime_resume(dev, RPM_GET_PUT);
> > > > 	if (ret < 0) {
> > > > 		pm_runtime_put(dev);
> > > > 		return ret;
> > > > 	}
> > > > 	return 0;
> > > > }
> > > > 
> > > > I'm not sure if pm_runtime_put() is the correct thing to do?  The other
> > > > thing is that this always returns zero on success.  I don't know that
> > > > drivers ever care to differentiate between one and zero returns.
> > > > 
> > > > Then if any of the caller expect that behavior we update them to use the
> > > > new function.
> > > 
> > > Does that really have many benefits, though? I understand that this
> > > would perhaps be easier to use because it is more in line with how other
> > > functions operate. On the other hand, in some cases you may want to call
> > > a different version of pm_runtime_put() on failure, as discussed in
> > > other threads.
> > 
> > I wasn't CC'd on the other threads so I don't know.  :/
> 
> It was actually earlier in this thread, see here for example:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/#2438776

I'm not seeing what you're talking about.

The only thing I see in this thread is that we don't want to call
pm_runtime_mark_last_busy(dev) which updates the last_busy time that is
used for autosuspend.

The other thing that was discussed was pm_runtime_put_noidle() vs
pm_runtime_put_autosuspend().  "The pm_runtime_put_noidle() should have
the same effect as yours variant".  So apparently they are equivalent
in this situation.  How should we choose one vs the other?

I'm not trying to be obtuse.  I understand that probably if I worked in
PM then I wouldn't need documentation...  :/

regards,
dan carpenter
