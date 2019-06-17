From: Gen Zhang <blackgod016574@gmail.com>
Subject: Re: [PATCH] tegra-hsp: fix a missing-check bug in
 tegra_hsp_doorbell_create()
Date: Mon, 17 Jun 2019 02:23:28 -0700
Message-ID: <20190617092328.GA3764@ubuntu>
References: <20190530011920.GA6490@zhanggen-UX430UQ>
 <20190608161144.GA4090@zhanggen-UX430UQ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190608161144.GA4090@zhanggen-UX430UQ>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: thierry.reding@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 09, 2019 at 12:11:44AM +0800, Gen Zhang wrote:
> On Thu, May 30, 2019 at 09:19:20AM +0800, Gen Zhang wrote:
> > In tegra_hsp_doorbell_create(), 'db->name' is allocated by 
> > devm_kstrdup_const(). It returns NULL when fails. So 'db->name' should
> > be checked.
> > 
> > Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > ---
> > diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> > index 11fc9fd..b613c46 100644
> > --- a/drivers/mailbox/tegra-hsp.c
> > +++ b/drivers/mailbox/tegra-hsp.c
> > @@ -292,6 +292,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, const char *name,
> >  	db->channel.hsp = hsp;
> >  
> >  	db->name = devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
> > +	if (!db->name)
> > +		return ERR_PTR(-ENOMEM);
> >  	db->master = master;
> >  	db->index = index;
> >  
> > ---
> Can anyone look into this patch? It's acked by Thierry Reding 
> <treding@nvidia.com>.
> 
> Thanks
> Gen
Could anyone look into this patch? It's not updated for about 20 days.
And I am really on a deadline to get this patch applied.

Thanks
Gen
