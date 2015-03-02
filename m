From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/9] memory: tegra: add mc flush support
Date: Mon, 2 Mar 2015 18:29:52 +0900
Message-ID: <CAAVeFu+1dS-RXOEg0jmUcP907uErpOv687k=4FBJiGfKytMWPA@mail.gmail.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
 <1421216372-8025-3-git-send-email-vinceh@nvidia.com> <CAAVeFuLx5fr_kQonRZzTgsw-wND==jNwvMs9LkzhWrE0rRQ76w@mail.gmail.com>
 <54F42549.5040202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F42549.5040202-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 2, 2015 at 5:54 PM, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> +int tegra_mc_flush(struct tegra_mc_swgroup *sg)
>>> +{
>>> +       struct tegra_mc *mc;
>>> +       const struct tegra_mc_hotreset *client;
>>> +       int i;
>>> +
>>> +       if (!sg || !sg->mc)
>>> +               return -EINVAL;;
>>> +
>>> +       mc = sg->mc;
>>> +       if (!mc->soc->ops || !mc->soc->ops->flush)
>>> +               return -EINVAL;;
>>> +
>>> +       client = mc->soc->hotresets;
>>> +
>>> +       for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
>>> +               if (sg->id == client->swgroup)
>>> +                       return mc->soc->ops->flush(mc, client);
>>> +       }
>>> +
>>> +       return -EINVAL;
>>> +}
>>> +EXPORT_SYMBOL(tegra_mc_flush);
>>> +
>>> +int tegra_mc_flush_done(struct tegra_mc_swgroup *sg)
>>> +{
>>> +       struct tegra_mc *mc;
>>> +       const struct tegra_mc_hotreset *client;
>>> +       int i;
>>> +
>>> +       if (!sg || !sg->mc)
>>> +               return -EINVAL;;
>>> +
>>> +       mc = sg->mc;
>>> +       if (!mc->soc->ops || !mc->soc->ops->flush)
>>> +               return -EINVAL;;
>>> +
>>> +       client = mc->soc->hotresets;
>>> +
>>> +       for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
>>> +               if (sg->id == client->swgroup)
>>> +                       return mc->soc->ops->flush_done(mc, client);
>>> +       }
>>> +
>>> +       return -EINVAL;
>>> +}
>>> +EXPORT_SYMBOL(tegra_mc_flush_done);
>>
>> These functions are identical, excepted for the callback they are
>> invoking. Could you merge the common part into a function that returns
>> the right client to call the callback on, or ERR_PTR(-EINVAL) in case
>> of failure?
>
> I couldn't think of a clever way to do this. Any ideas? :)

How about something like this (warning: might now be that great, untested):

/* Have this in your .h and use it in your tegra_mc_ops struct */
typedef int (*mc_op)(struct tegra_mc *mc,
             const struct tegra_mc_hotreset *hotreset)

static int __tegra_mc_op(struct tegra_mc_swgroup *sg, mc_op op)
{
       struct tegra_mc *mc;
       const struct tegra_mc_hotreset *client;
       int i;

       mc = sg->mc;
       client = mc->soc->hotresets;

       for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
               if (sg->id == client->swgroup)
                       return op(mc, client);
       }

       return -EINVAL;
}

#define tegra_mc_op(sg, op)                                               \
    ((!sg || !sg->mc || !sg->mc->soc->ops || sg->mc->soc->ops->op) ?  \
        -EINVAL :                                                 \
        __tegra_mc_op(sg, sg->mc->soc->ops->op));

int tegra_mc_flush(struct tegra_mc_swgroup *sg)
{
       return tegra_mc_op(sg, flush);
}
EXPORT_SYMBOL(tegra_mc_flush);

int tegra_mc_flush_done(struct tegra_mc_swgroup *sg)
{
       return tegra_mc_op(sg, flush_done);
}
EXPORT_SYMBOL(tegra_mc_flush_done);


Actually when writing this code I found two other issues:

>>> +int tegra_mc_flush_done(struct tegra_mc_swgroup *sg)
>>> +{
>>> +       struct tegra_mc *mc;
>>> +       const struct tegra_mc_hotreset *client;
>>> +       int i;
>>> +
>>> +       if (!sg || !sg->mc)
>>> +               return -EINVAL;;

Double ; (also in tegra_mc_flush)

>>> +
>>> +       mc = sg->mc;
>>> +       if (!mc->soc->ops || !mc->soc->ops->flush)

Should be ops->flush_done?
