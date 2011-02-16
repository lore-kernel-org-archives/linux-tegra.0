From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 12/21] ARM: tegra: clock: Add shared bus clock type
Date: Wed, 16 Feb 2011 13:01:09 -0800
Message-ID: <AANLkTi=knKY65xaOT85jFidy6Be8K8RT0L1XtGqq_v2V@mail.gmail.com>
References: <1297590033-15035-1-git-send-email-ccross@android.com>
	<1297590033-15035-13-git-send-email-ccross@android.com>
	<4D5C34E0.5000209@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D5C34E0.5000209-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 16, 2011 at 12:34 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> w=
rote:
> On 02/13/2011 01:40 AM, Colin Cross wrote:
>> +/* shared bus ops */
>> +/*
>> + * Some clocks may have multiple downstream users that need to requ=
est a
>> + * higher clock rate. =A0Shared bus clocks provide a unique shared_=
bus_user
>> + * clock to each user. =A0The frequency of the bus is set to the hi=
ghest
>> + * enabled shared_bus_user clock, with a minimum value set by the
>> + * shared bus.
>> + */
>> +static void tegra_clk_shared_bus_update(struct clk *bus)
>> +{
>> + =A0 =A0 struct clk *c;
>> + =A0 =A0 unsigned long rate =3D bus->min_rate;
>> +
>> + =A0 =A0 list_for_each_entry(c, &bus->shared_bus_list, u.shared_bus=
_user.node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (c->u.shared_bus_user.enabled)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate =3D max(c->u.shared_b=
us_user.rate, rate);
>> +
>> + =A0 =A0 if (rate !=3D clk_get_rate(bus))
>> + =A0 =A0 =A0 =A0 =A0 =A0 clk_set_rate(bus, rate);
>
> What do you do if clk_set_rate() fails? Should you unwind all the sta=
te
> such as the rate and if it's enabled/disabled? Or is it safe to say
> clk_set_rate() can't fail unless the kernel is buggy in which case wh=
y
> aren't all those return -E* in the set rate functions just BUG_ONs?

In general, clk_set_rate can fail and return an error, but in this
case the failure may not be directly related to the driver that called
into tegra_clk_shared_bus_update.  For example, if clk_disable is
called on a shared clock handle, the rate may drop to the rate
requested by another shared clock handle.  clk_disable cannot fail, so
there's nothing that could be done with the return code, and the
problem was not caused by the driver that called clk_disable, so an
error would be meaningless.

I will modify tegra_clk_shared_bus_update to BUG on a failed
clk_set_rate, and modify tegra_clk_shared_bus_set_rate to
call clk_round_rate on the parent to ensure that the requested rate is =
valid.

>> +};
>> +
>> +static void tegra_clk_shared_bus_init(struct clk *c)
>> +{
>> + =A0 =A0 c->max_rate =3D c->parent->max_rate;
>> + =A0 =A0 c->u.shared_bus_user.rate =3D c->parent->max_rate;
>> + =A0 =A0 c->state =3D OFF;
>> +#ifdef CONFIG_DEBUG_FS
>> + =A0 =A0 c->set =3D 1;
>> +#endif
>> +
>> + =A0 =A0 list_add_tail(&c->u.shared_bus_user.node,
>> + =A0 =A0 =A0 =A0 =A0 =A0 &c->parent->shared_bus_list);
>> +}
>> +
>> +static int tegra_clk_shared_bus_set_rate(struct clk *c, unsigned lo=
ng rate)
>> +{
>> + =A0 =A0 c->u.shared_bus_user.rate =3D rate;
>> + =A0 =A0 tegra_clk_shared_bus_update(c->parent);
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static long tegra_clk_shared_bus_round_rate(struct clk *c, unsigned=
 long rate)
>> +{
>> + =A0 =A0 return clk_round_rate(c->parent, rate);
>> +}
>> +
>> +static int tegra_clk_shared_bus_enable(struct clk *c)
>> +{
>> + =A0 =A0 c->u.shared_bus_user.enabled =3D true;
>> + =A0 =A0 tegra_clk_shared_bus_update(c->parent);
>> + =A0 =A0 return 0;
>> +}
>
> Shouldn't you call clk_enable(c->parent)? And do you need to check fo=
r
> errors from clk_enable()?

clk_enable on the parent is handled by the clock op implementation in
mach-tegra/clock.c

>> +
>> +static void tegra_clk_shared_bus_disable(struct clk *c)
>> +{
>> + =A0 =A0 c->u.shared_bus_user.enabled =3D false;
>> + =A0 =A0 tegra_clk_shared_bus_update(c->parent);
>> +}
>
> And a similar clk_disable(c->parent) here.

Same for disable
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
