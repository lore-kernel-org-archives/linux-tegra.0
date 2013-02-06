From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] clk: Add composite clock type
Date: Wed, 6 Feb 2013 11:00:14 +0100
Message-ID: <20130206.120014.87075843729177552.hdoyu@nvidia.com>
References: <5111C604.8070104@nvidia.com><20130206.081048.71241785637713947.hdoyu@nvidia.com><511227F6.3050601@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511227F6.3050601-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Wed, 6 Feb 2013 10:52:54 +0100:

> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index f0ac818..bb5d36a 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -346,6 +346,8 @@ struct clk_composite {
> >          const struct clk_ops    *mux_ops;
> >          const struct clk_ops    *div_ops;
> >          const struct clk_ops    *gate_ops;
> > +
> > +       const struct clk_ops    ops;
> >   };
> >   
> >   struct clk *clk_register_composite(struct device *dev, const char *name,
> 
> This will work, but there is no harm in allocating dynamically. What is 
> preferred?

If we've already know that this "ops" is necessary per "struct
clk_composite" in advance, there's no point to allocate
"clk_composite" and "ops" separately.
