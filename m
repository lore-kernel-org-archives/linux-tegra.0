From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2] clk: Add composite clock type
Date: Wed, 06 Feb 2013 11:02:14 +0100
Message-ID: <1540338.CtVIxUnnxQ@amdc1227>
References: <5110C3E5.2010503@nvidia.com>
 <20130206.081048.71241785637713947.hdoyu@nvidia.com>
 <511227F6.3050601@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <511227F6.3050601-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 06 of February 2013 15:22:54 Prashant Gaikwad wrote:
> On Wednesday 06 February 2013 11:40 AM, Hiroshi Doyu wrote:
> > Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Wed, 6 Feb 2013 
03:55:00 +0100:
> >>>> No, clk_ops depends on the clocks you are using. There could be a
> >>>> clock
> >>>> with mux and gate while another one with mux and div.
> >>> 
> >>> You are right. What about the following? We don't have to have
> >>> similar
> >>> copy of clk_composite_ops for each instances.
> >> 
> >> Clock framework takes decision depending on the ops availability and
> >> it
> >> does not know if the clock is mux or gate.
> >> 
> >> For example,
> >> 
> >>                   if (clk->ops->enable) {
> >>                   
> >>                           ret = clk->ops->enable(clk->hw);
> >>                           if (ret) {
> >>                           
> >>                                   __clk_disable(clk->parent);
> >>                                   return ret;
> >>                           
> >>                           }
> >>                   
> >>                   }
> >> 
> >> in above case if clk_composite does not have gate clock then as per
> >> your suggestion if it returns error value then it will fail and it
> >> is wrong.> 
> > Ok, now I understand. Thank you for explanation.
> > 
> > We always need to allocate clk_composite_ops for each clk_composite,
> > right? If so what about having "struct clk_ops ops" in "struct
> > clk_composite"?
> > 
> > diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> > index f30fb4b..5240e24 100644
> > --- a/drivers/clk/clk-composite.c
> > +++ b/drivers/clk/clk-composite.c
> > @@ -129,20 +129,13 @@ struct clk *clk_register_composite(struct device
> > *dev, const char *name,> 
> >                  pr_err("%s: could not allocate composite clk\n",
> >                  __func__);
> >                  return ERR_PTR(-ENOMEM);
> >          
> >          }
> > 
> > +       clk_composite_ops = &composite->ops;
> > 
> >          init.name = name;
> >          init.flags = flags | CLK_IS_BASIC;
> >          init.parent_names = parent_names;
> >          init.num_parents = num_parents;
> > 
> > -       /* allocate the clock ops */
> > -       clk_composite_ops = kzalloc(sizeof(*clk_composite_ops),
> > GFP_KERNEL); -       if (!clk_composite_ops) {
> > -               pr_err("%s: could not allocate clk ops\n", __func__);
> > -               kfree(composite);
> > -               return ERR_PTR(-ENOMEM);
> > -       }
> > -
> > 
> >          if (mux_hw && mux_ops) {
> >          
> >                  if (!mux_ops->get_parent || !mux_ops->set_parent) {
> >                  
> >                          clk = ERR_PTR(-EINVAL);
> > 
> > @@ -202,7 +195,6 @@ struct clk *clk_register_composite(struct device
> > *dev, const char *name,> 
> >          return clk;
> >   
> >   err:
> > -       kfree(clk_composite_ops);
> > 
> >          kfree(composite);
> >          return clk;
> >   
> >   }
> > 
> > diff --git a/include/linux/clk-provider.h
> > b/include/linux/clk-provider.h index f0ac818..bb5d36a 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -346,6 +346,8 @@ struct clk_composite {
> > 
> >          const struct clk_ops    *mux_ops;
> >          const struct clk_ops    *div_ops;
> >          const struct clk_ops    *gate_ops;
> > 
> > +
> > +       const struct clk_ops    ops;
> > 
> >   };
> >   
> >   struct clk *clk_register_composite(struct device *dev, const char
> >   *name,
> This will work, but there is no harm in allocating dynamically. What is
> preferred?

IMHO it is always better to allocate one bigger structure than several 
smaller if they are always needed together and one cannot exist without 
others.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
