From: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Wed, 13 Mar 2013 18:01:13 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E50311432@BGMAIL02.nvidia.com>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <D958900912E20642BCBC71664EFECE3E6E50310DD2@BGMAIL02.nvidia.com>
 <20130308073821.GG21589@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130308073821.GG21589-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org" <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org" <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Friday, March 08, 2013 1:08 PM
> To: Venu Byravarasu
> Cc: Stephen Warren; Felipe Balbi; Linux USB Mailing List; Greg KH; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org; p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org; tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org; yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
> Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
> 
> * PGP Signed by an unknown key
> 
> On Fri, Mar 08, 2013 at 12:51:13PM +0530, Venu Byravarasu wrote:
> > > -----Original Message-----
> > > From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> > > owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> > > Sent: Friday, March 08, 2013 2:07 AM
> > > To: Felipe Balbi; Venu Byravarasu
> > > Cc: Linux USB Mailing List; Greg KH; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > > s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> > > gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org;
> > > p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org; tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org;
> > > yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
> > > Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
> > >
> > > On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> > > > this will make sure that we have sensible names
> > > > for all phy drivers. Current situation was already
> > > > quite bad with too generic names being used.
> > >
> > > Is phy-$name specific enough? There are other types of PHY such as
> > > Ethernet, etc. What about phy-usb-$name?
> > >
> > > Venu, please comment on what conflicts, if any, this will cause with the
> > > patches you'll be sending to clean up the Tegra USB/PHY drivers. Thanks.
> >
> > As this is just a name change, it should not cause any big issues, other than
> porting
> > all changes on top of this new file.
> >
> > Felipe,
> > When can we expect these changes getting merged into linux-next?
> 
> After -rc2 is tagged, I will have everything I need to start my -next
> branch. From that point on it should be in linux-next ;-)

As your change is not yet merged, can you plz exclude Tegra USB PHY driver renaming 
alone from your patch, as my patches are almost ready on top of current linux-next code base?
If you are OK, I can push the renaming patch as part of my last patch, so that manual merge on
top of new file can be avoided and your target of changing file names also will be served. 

> 
> --
> balbi
> 
> * Unknown Key
> * 0x35CAA444
