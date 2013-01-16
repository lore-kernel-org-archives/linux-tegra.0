From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/9] clk: tegra: Add tegra specific clocks
Date: Wed, 16 Jan 2013 09:19:06 +0100
Message-ID: <20130116.101906.399662310268585658.hdoyu@nvidia.com>
References: <1357890387-23245-3-git-send-email-pgaikwad@nvidia.com><20130111.134820.1392079432650652356.hdoyu@nvidia.com><50F085A0.4090100@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F085A0.4090100-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote @ Fri, 11 Jan 2013 22:35:28 +0100:

> On 01/11/2013 04:48 AM, Hiroshi Doyu wrote:
> > Hi Prahant,
> > 
> > Some nit-pick/cosmetic comments inlined...
> 
> FYI, Prashant is on vacation for the next week or two, so I'll take over
> this series to clean up any last review comments.
> 
> > Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Fri, 11 Jan 2013 08:46:20 +0100:
> > 
> >> Add tegra specific clocks, pll, pll_out, peripheral,
> >> frac_divider, super.
> 
> (it's a good idea to quote as little text as possible; paging through
> the whole patch to find your comments was slightly painful).
> 
> >> diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
> 
> >> +struct clk *tegra_clk_sync_source(const char *name, unsigned long rate,
> >> +                                 unsigned long max_rate)
> >> +{
> >> +       struct tegra_clk_sync_source *sync;
> >> +       struct clk_init_data init;
> >> +       struct clk *clk;
> >> +
> >> +       sync = kzalloc(sizeof(struct tegra_clk_sync_source), GFP_KERNEL);
> >> +       if (!sync) {
> >> +               pr_err("%s: could not allocate sync source clk\n", __func__);
> >> +               return ERR_PTR(-ENOMEM);
> >> +       }
> >> +
> >> +       sync->rate = rate;
> >> +       sync->max_rate = max_rate;
> >> +
> >> +       init.ops = &tegra_clk_sync_source_ops;
> >> +       init.name = name;
> >> +       init.flags = CLK_IS_ROOT;
> >> +       init.parent_names = NULL;
> >> +       init.num_parents = 0;
> >> +
> >> +       sync->hw.init = &init;
> >> +
> >> +       clk = clk_register(NULL, &sync->hw);
> > 
> > The above usage of "init" from stack may be a bit
> > unfamilier. I can guess that its content is copied in clk_register()
> > but it's originally defined in stack. So I just prefer to writing this
> > as below. It may be somewhat explict that we know init is from stack.
> 
> The issue you mention is more about whether "init" is copied from the
> stack or not; simplying changing the initialization to:
> 
> > struct clk *tegra_clk_sync_source(const char *name, unsigned long rate,
> >                                  unsigned long max_rate)
> > {
> >         struct tegra_clk_sync_source *sync;
> >         struct clk_init_data init = {
> >                 .ops = &tegra_clk_sync_source_ops;
> >                 .name = name;
> >                 .flags = CLK_IS_ROOT;
> >                 .parent_names = NULL;
> >                 .num_parents = 0;
> >         };

Also since "init" is allocated from stack, members are expected to be
initialized *zero*. The last 2 lines are not necessary in the above.

         struct clk_init_data init = {
                 .ops = &tegra_clk_sync_source_ops;
                 .name = name;
                 .flags = CLK_IS_ROOT;
         };

> ... doesn't really address that, although it's a perfectly reasonable
> change.
> 
> To address the copying issue, why not just add a comment:

OK

>        /*
>         * This data pointed at by this field is copied by
>         * clk_register(), so a pointer to the stack is OK.
>         */
>        sync->hw.init = &init;
> 
>        clk = clk_register(NULL, &sync->hw);
> 
> I'll make the other changes you suggested.
