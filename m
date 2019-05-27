From: Gen Zhang <blackgod016574@gmail.com>
Subject: Re: [PATCH] tegra-hsp: fix a missing-check bug in
 tegra_hsp_doorbell_create()
Date: Mon, 27 May 2019 22:10:38 +0800
Message-ID: <20190527141038.GA6453@zhanggen-UX430UQ>
References: <20190527130430.GA5367@zhanggen-UX430UQ>
 <20190527140549.GA7202@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527140549.GA7202@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 27, 2019 at 04:05:49PM +0200, Thierry Reding wrote:
> On Mon, May 27, 2019 at 09:04:30PM +0800, Gen Zhang wrote:
> > In tegra_hsp_doorbell_create(), 'db->name' is allocated by 
> > devm_kstrdup_const(). It returns NULL when fails. So 'db->name' should
> > be checked.
> > 
> > Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
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
> 
> I don't think this could ever happen, since name is always from .rodata
> and hence devm_kstrdup_const() never returns NULL. But formally this is
> correct, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
Thanks for your reply, Thierry.

Thanks
Gen
