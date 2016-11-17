From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] clk: tegra: Add BPMP clock driver
Date: Thu, 17 Nov 2016 10:58:40 +0100
Message-ID: <20161117095840.GA9843@ulmo.ba.sec>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117011915.GN25626@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161117011915.GN25626-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 05:19:15PM -0800, Stephen Boyd wrote:
> On 11/15, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This driver uses the services provided by the BPMP firmware driver to
>=20
> What does BPMP mean?

BPMP is the "Boot and Power Management Processor". It's a companion
processor on Tegra186 that takes on the responsibilities of booting the
system and running a firmware that deals with a bunch of the power
management. The firmware communicates with Linux via an IPC protocol
based on shared memory and a mailbox for notification.

One of the features implemented by the firmware is a clock API that
closely resembles that of the CCF in Linux. It also implements resets
and powergates, all of which are tied together in the BPMP to properly
manage these resources and simplify the driver support in the OS.

> > implement a clock driver based on the MRQ_CLK request. This part of the
> > BPMP ABI provides a means to enumerate and control clocks and should
> > allow the driver to work on any chip that supports this ABI.
>=20
> Cool! Discoverable is great.

Yeah. It's pretty neat. It means that this driver will potentially be
reusable on future chips if they support the same firmware interface.
It also means very little code, since we essentially only proxy things
to the BPMP and it will do the bulk of the work.

> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Hi Mike, Stephen,
> >=20
> > I'm looking for an Acked-by on this so that I can take it through the
> > Tegra tree because the dependencies are fairly complex.
>=20
> Getting this merged for the next window is fairly unlikely. This
> is the first time I've seen the patch and it's on v4.

The v4 is actually misleading. The whole of the BPMP support patches is
at v4, whereas this is the first time that I posted the clock driver
patch itself. It's a really simple driver, so I'd hope that there's not
a lot of contentious material in here.

> > diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> > new file mode 100644
> > index 000000000000..9b89cedfcb98
> > --- /dev/null
> > +++ b/drivers/clk/tegra/clk-bpmp.c
> > @@ -0,0 +1,665 @@
> > +/*
> > + * Copyright (C) 2016 NVIDIA Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/seq_buf.h>
> > +#include <linux/slab.h>
> > +
> > +#include <soc/tegra/bpmp.h>
> > +#include <soc/tegra/bpmp-abi.h>
> > +
> > +#define TEGRA_BPMP_DUMP_CLOCK_INFO	0
> > +
> > +#define TEGRA_BPMP_CLK_HAS_MUX		BIT(0)
> > +#define TEGRA_BPMP_CLK_HAS_SET_RATE	BIT(1)
> > +#define TEGRA_BPMP_CLK_IS_ROOT		BIT(2)
> > +
> > +struct tegra_bpmp_clk_info {
> > +	unsigned int id;
> > +	char name[MRQ_CLK_NAME_MAXLEN];
> > +	unsigned int parents[MRQ_CLK_MAX_PARENTS];
> > +	unsigned int num_parents;
> > +	unsigned long flags;
> > +};
> > +
> > +struct tegra_bpmp_clk {
> > +	struct clk_hw hw;
> > +
> > +	struct tegra_bpmp *bpmp;
> > +	unsigned int id;
> > +
> > +	unsigned int num_parents;
> > +	unsigned int *parents;
> > +};
> > +
> > +static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *=
hw)
> > +{
> > +	return container_of(hw, struct tegra_bpmp_clk, hw);
> > +}
> > +
> > +struct tegra_bpmp_clk_message {
> > +	unsigned int cmd;
> > +	unsigned int clk;
>=20
> s/clk/id or clk_id?

id sounds fine.

> > +
> > +	struct {
> > +		const void *data;
> > +		size_t size;
> > +	} tx;
> > +
> > +	struct {
> > +		void *data;
> > +		size_t size;
> > +	} rx;
> > +};
> > +
> > +static int
> > +__tegra_bpmp_clk_transfer_atomic(struct tegra_bpmp *bpmp,
> > +				 struct tegra_bpmp_message *msg)
> > +{
> > +	unsigned long flags;
> > +	int err;
> > +
> > +	local_irq_save(flags);
> > +	err =3D tegra_bpmp_transfer_atomic(bpmp, msg);
> > +	local_irq_restore(flags);
>=20
> Why do we need to disable irqs? Seems like an odd thing for the
> caller to decide given that there aren't any interrupt handlers
> in this driver.

This is there to allow clock operations to succeed very early in boot
when some of the infrastructure to execute the non-atomic equivalents
hasn't been brought up yet.

That said, I'm not sure we actually need it. I'll run some tests and can
drop this if we don't need it.

> > +	return err;
> > +}
> > +
> > +static int
> > +tegra_bpmp_clk_transfer_atomic(struct tegra_bpmp *bpmp,
> > +			       const struct tegra_bpmp_clk_message *clk)
> > +{
> > +	struct mrq_clk_request request;
> > +	struct tegra_bpmp_message msg;
> > +	void *req =3D (void *)&request;
>=20
> We shouldn't need to cast to void * here.

Indeed. Removed.

> > +	memset(&request, 0, sizeof(request));
> > +	request.cmd_and_id =3D (clk->cmd << 24) | clk->clk;
> > +	memcpy(req + 4, clk->tx.data, clk->tx.size);
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.mrq =3D MRQ_CLK;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D clk->rx.data;
> > +	msg.rx.size =3D clk->rx.size;
> > +
> > +	return __tegra_bpmp_clk_transfer_atomic(bpmp, &msg);;
>=20
> Double semicolon here.

Good catch. Removed.

> > +static int tegra_bpmp_clk_transfer(struct tegra_bpmp *bpmp,
> > +				   const struct tegra_bpmp_clk_message *clk)
> > +{
> > +	struct mrq_clk_request request;
> > +	struct tegra_bpmp_message msg;
> > +	void *req =3D (void *)&request;
>=20
> Useless cast to void.

Removed.

> > +	int err;
> > +
> > +	memset(&request, 0, sizeof(request));
> > +	request.cmd_and_id =3D (clk->cmd << 24) | clk->clk;
>=20
> Haha clk clk. I sound like a chicken when I read this.

id really makes sense here because then it reads:

	cmd_and_id =3D cmd << 24 | id

> > +	memcpy(req + 4, clk->tx.data, clk->tx.size);
>=20
> struct mrq_clk_request could have a member for this called "data"
> or something. Then all the casting to void and adding 4 magic
> could be computed by the compiler and changeable without us
> having to remember we're doing void pointer math here.

Yes, this is somewhat unfortunate. However, the struct mrq_clk_request
is defined in an ABI header that's extracted as-is from the firmware
tree so that it can be easily synced. Modifying it would create extra
maintenance burden, so I'd like to avoid that if at all possible. Would
adding a comment above this help alleviate your concern?

> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.mrq =3D MRQ_CLK;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D clk->rx.data;
> > +	msg.rx.size =3D clk->rx.size;
> > +
> > +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> > +	if (err !=3D -EAGAIN)
> > +		return err;
> > +
> > +	return __tegra_bpmp_clk_transfer_atomic(bpmp, &msg);
> > +}
> > +
> > +static int tegra_bpmp_clk_enable(struct clk_hw *hw)
>=20
> Maybe this should be called tegra_bpmp_clk_prepare() so as to not
> confuse the reader.

Well, the function does implement an enable of the clock. The reason why
it is later assigned to the ->prepare() operation is merely because that
is what the CCF requires, given that this may sleep.

Bus if you prefer I can change this and also...

> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct tegra_bpmp_clk_message msg;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_ENABLE;
> > +	msg.clk =3D clk->id;
> > +
> > +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +}
> > +
> > +static void tegra_bpmp_clk_disable(struct clk_hw *hw)

=2E.. this to tegra_bpmp_clk_unprepare().

> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct tegra_bpmp_clk_message msg;
> > +	int err;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_DISABLE;
> > +	msg.clk =3D clk->id;
> > +
> > +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +	if (err < 0)
> > +		dev_err(clk->bpmp->dev, "failed to disable clock %s: %d\n",
> > +			clk_hw_get_name(hw), err);
> > +}
> > +
> > +static int tegra_bpmp_clk_is_enabled(struct clk_hw *hw)
>=20
> Why not *_is_prepared()?

Yes, given the above that makes sense.

> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct cmd_clk_is_enabled_response response;
> > +	struct tegra_bpmp_clk_message msg;
> > +	int err;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_IS_ENABLED;
> > +	msg.clk =3D clk->id;
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	err =3D tegra_bpmp_clk_transfer_atomic(clk->bpmp, &msg);
>=20
> And then I presume this wouldn't need to worry about being called
> in atomic situations.

I'll go test if that works. If it does, I agree that this would be
preferable.

> > +	if (err < 0)
> > +		return err;
> > +
> > +	return response.state;
> > +}
> > +
> > +static u8 tegra_bpmp_clk_get_parent(struct clk_hw *hw)
> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct cmd_clk_get_parent_response response;
> > +	struct tegra_bpmp_clk_message msg;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_GET_PARENT;
> > +	msg.clk =3D clk->id;
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(&response);
>=20
> Shouldn't that be sizeof(response)? Or you're expecting a
> pointer to come back?

Good catch. The above could potentially trash the stack, though I've
never seen that happen. It's likely only overwriting some structure that
we don't use after this (msg perhaps).

> > +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +	if (err < 0) {
> > +		dev_err(clk->bpmp->dev, "failed to get parent for %s: %d\n",
> > +			clk_hw_get_name(hw), err);
> > +		return U8_MAX;
> > +	}
> > +
> > +	for (i =3D 0; i < clk->num_parents; i++)
>=20
> Could be clk_hw_get_num_parents() instead?

Both should always be the same thing, though clk->num_parents might be
slightly warmer in the cache. It's also a little shorter to write, so if
you don't feel very strongly about it, I'd prefer to leave it as-is.

> > +		if (clk->parents[i] =3D=3D response.parent_id)
> > +			return i;
> > +
> > +	return U8_MAX;
> > +}
> > +
> > +static int tegra_bpmp_clk_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct cmd_clk_set_parent_response response;
> > +	struct cmd_clk_set_parent_request request;
> > +	struct tegra_bpmp_clk_message msg;
> > +	int err;
> > +
> > +	if (index >=3D clk->num_parents)
> > +		return -EINVAL;
>=20
> The framework already handles that. Why do we need to check here?

I suppose I just wanted to be extra cautious. I'll remove it.

> > +	memset(&request, 0, sizeof(request));
> > +	request.parent_id =3D clk->parents[index];
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_SET_PARENT;
> > +	msg.clk =3D clk->id;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
>=20
> Maybe this could be a macro as it comes up a few times.
>=20
> 	msg_set_tx(m, d) ({ m.tx.data =3D d; m.tx.size =3D sizeof(d); })
> 	msg_set_rx(m, d) ({ m.rx.data =3D d; m.rx.size =3D sizeof(d); })
> 	msg_set_tx_rx(m, t, r) ({ msg_set_tx(m, t); msg_set_rx(m, r); })

I like the explicitness of the original better and I think the macro
would obfuscate somewhat. But I don't feel very strongly, so if you
insist I will add that set of macros. Or maybe make them inline
functions for better type safety or convenient error reporting.

> > +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	/* XXX check parent ID in response */
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra_bpmp_clk_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> > +				   unsigned long parent_rate)
> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct cmd_clk_set_rate_response response;
> > +	struct cmd_clk_set_rate_request request;
> > +	struct tegra_bpmp_clk_message msg;
> > +
> > +	memset(&request, 0, sizeof(request));
> > +	request.rate =3D rate;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_SET_RATE;
> > +	msg.clk =3D clk->id;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	return tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +}
> > +
> > +static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long=
 rate,
> > +				      unsigned long *parent_rate)
> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +	struct cmd_clk_round_rate_response response;
> > +	struct cmd_clk_round_rate_request request;
>=20
> Would this structure be used outside of this driver? Why can't we
> define it in this C file?

Like I mentioned above, these are defined in an ABI header that gets
extracted from the firmware build tree. We could potentially move it
over to this file, but at the cost of added maintenance burden.

> > +	struct tegra_bpmp_clk_message msg;
> > +	int err;
> > +
> > +	memset(&request, 0, sizeof(request));
> > +	request.rate =3D rate;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_ROUND_RATE;
> > +	msg.clk =3D clk->id;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return response.rate;
> > +}
> > +
> > +static unsigned long tegra_bpmp_clk_get_rate(struct tegra_bpmp *bpmp,
> > +					     unsigned int id)
> > +{
> > +	struct cmd_clk_get_rate_response response;
> > +	struct cmd_clk_get_rate_request request;
> > +	struct tegra_bpmp_clk_message msg;
> > +	int err;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_GET_RATE;
> > +	msg.clk =3D id;
> > +	msg.tx.data =3D &request;
> > +	msg.tx.size =3D sizeof(request);
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	err =3D tegra_bpmp_clk_transfer(bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	return response.rate;
> > +}
> > +
> > +static unsigned long tegra_bpmp_clk_recalc_rate(struct clk_hw *hw,
> > +						unsigned long parent_rate)
> > +{
> > +	struct tegra_bpmp_clk *clk =3D to_tegra_bpmp_clk(hw);
> > +
> > +	return tegra_bpmp_clk_get_rate(clk->bpmp, clk->id);
> > +}
>=20
> Is there a reason to have two functions? Please fold the two
> together into one.

Done. This was leftover from an earlier version where the above
tegra_bpmp_clk_get_rate() function was used to obtain the clock rate for
fixed clocks. This is now handled by providing clk_ops without a
->set_rate() implementation, so this is effectively unused and can be
collapsed into the ->recalc_rate() op.

> > +static const struct clk_ops tegra_bpmp_clk_gate_ops =3D {
> > +	.is_enabled =3D tegra_bpmp_clk_is_enabled,
> > +	.prepare =3D tegra_bpmp_clk_enable,
> > +	.unprepare =3D tegra_bpmp_clk_disable,
> > +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> > +};
> > +
> > +static const struct clk_ops tegra_bpmp_clk_mux_ops =3D {
> > +	.get_parent =3D tegra_bpmp_clk_get_parent,
> > +	.set_parent =3D tegra_bpmp_clk_set_parent,
> > +	.is_enabled =3D tegra_bpmp_clk_is_enabled,
> > +	.prepare =3D tegra_bpmp_clk_enable,
> > +	.unprepare =3D tegra_bpmp_clk_disable,
> > +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> > +};
> > +
> > +static const struct clk_ops tegra_bpmp_clk_rate_ops =3D {
> > +	.is_enabled =3D tegra_bpmp_clk_is_enabled,
> > +	.prepare =3D tegra_bpmp_clk_enable,
> > +	.unprepare =3D tegra_bpmp_clk_disable,
> > +	.set_rate =3D tegra_bpmp_clk_set_rate,
> > +	.round_rate =3D tegra_bpmp_clk_round_rate,
> > +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> > +};
> > +
> > +static const struct clk_ops tegra_bpmp_clk_mux_rate_ops =3D {
> > +	.get_parent =3D tegra_bpmp_clk_get_parent,
> > +	.set_parent =3D tegra_bpmp_clk_set_parent,
> > +	.is_enabled =3D tegra_bpmp_clk_is_enabled,
> > +	.prepare =3D tegra_bpmp_clk_enable,
> > +	.unprepare =3D tegra_bpmp_clk_disable,
> > +	.set_rate =3D tegra_bpmp_clk_set_rate,
> > +	.round_rate =3D tegra_bpmp_clk_round_rate,
> > +	.recalc_rate =3D tegra_bpmp_clk_recalc_rate,
> > +};
> > +
> > +static int tegra_bpmp_clk_get_max_id(struct tegra_bpmp *bpmp)
> > +{
> > +	struct cmd_clk_get_max_clk_id_response response;
> > +	struct tegra_bpmp_clk_message msg;
> > +	int err;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_GET_MAX_CLK_ID;
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	err =3D tegra_bpmp_clk_transfer(bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	if (response.max_id > INT_MAX)
> > +		return -E2BIG;
>=20
> I'm not sure the argument list is too long.

git grep suggests that it's fairly common practice for E2BIG to be used
for similar purposes elsewhere. Do you have a more appropriate candidate
in mind?

> > +	return response.max_id;
> > +}
> > +
> > +static int tegra_bpmp_clk_get_info(struct tegra_bpmp *bpmp, unsigned i=
nt id,
> > +				   struct tegra_bpmp_clk_info *info)
> > +{
> > +	struct cmd_clk_get_all_info_response response;
> > +	struct tegra_bpmp_clk_message msg;
> > +	unsigned int i;
> > +	int err;
> > +
> > +	memset(&msg, 0, sizeof(msg));
> > +	msg.cmd =3D CMD_CLK_GET_ALL_INFO;
> > +	msg.clk =3D id;
> > +	msg.rx.data =3D &response;
> > +	msg.rx.size =3D sizeof(response);
> > +
> > +	err =3D tegra_bpmp_clk_transfer(bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	strlcpy(info->name, response.name, MRQ_CLK_NAME_MAXLEN);
> > +	info->num_parents =3D response.num_parents;
> > +
> > +	for (i =3D 0; i < info->num_parents; i++)
> > +		info->parents[i] =3D response.parents[i];
> > +
> > +	info->flags =3D response.flags;
> > +
> > +	return 0;
> > +}
> > +
> > +static void tegra_bpmp_clk_info_dump(struct tegra_bpmp *bpmp,
> > +				     const char *level,
> > +				     const struct tegra_bpmp_clk_info *info)
> > +{
> > +	const char *prefix =3D "";
> > +	struct seq_buf buf;
> > +	unsigned int i;
> > +	char flags[64];
> > +
> > +	seq_buf_init(&buf, flags, sizeof(flags));
> > +
> > +	if (info->flags)
> > +		seq_buf_printf(&buf, "(");
> > +
> > +	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> > +		seq_buf_printf(&buf, "%smux", prefix);
> > +		prefix =3D ", ";
> > +	}
> > +
> > +	if ((info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE) =3D=3D 0) {
> > +		seq_buf_printf(&buf, "%sfixed", prefix);
> > +		prefix =3D ", ";
> > +	}
> > +
> > +	if (info->flags & TEGRA_BPMP_CLK_IS_ROOT) {
> > +		seq_buf_printf(&buf, "%sroot", prefix);
> > +		prefix =3D ", ";
> > +	}
> > +
> > +	if (info->flags)
> > +		seq_buf_printf(&buf, ")");
> > +
> > +	dev_printk(level, bpmp->dev, "%03u: %s\n", info->id, info->name);
> > +	dev_printk(level, bpmp->dev, "  flags: %lx %s\n", info->flags, flags);
> > +	dev_printk(level, bpmp->dev, "  parents: %u\n", info->num_parents);
> > +
> > +	for (i =3D 0; i < info->num_parents; i++)
> > +		dev_printk(level, bpmp->dev, "    %03u\n", info->parents[i]);
> > +}
> > +
> > +static int tegra_bpmp_probe_clocks(struct tegra_bpmp *bpmp,
> > +				   struct tegra_bpmp_clk_info **clocksp)
> > +{
> > +	struct tegra_bpmp_clk_info *clocks;
> > +	unsigned int max_id, id, count =3D 0;
> > +	unsigned int holes =3D 0;
> > +	int err;
> > +
> > +	err =3D tegra_bpmp_clk_get_max_id(bpmp);
>=20
> Just assign to max_id here and make max_id int instead?
>=20
> > +	if (err < 0)
> > +		return err;
> > +
> > +	max_id =3D err;
>=20
> Would make this redundant.

I prefer to keep types as strict as possible. In this case, after this
point it's guaranteed by its type that max_id is non-negative.

Doing this also avoids potential warnings from GCC about signedness
being different in comparisons, such as...

> > +
> > +	dev_dbg(bpmp->dev, "maximum clock ID: %u\n", max_id);
> > +
> > +	clocks =3D kcalloc(max_id + 1, sizeof(*clocks), GFP_KERNEL);
> > +	if (!clocks)
> > +		return -ENOMEM;
> > +
> > +	for (id =3D 0; id <=3D max_id; id++) {

=2E.. here.

> > +		struct tegra_bpmp_clk_info *info =3D &clocks[count];
> > +
> > +		err =3D tegra_bpmp_clk_get_info(bpmp, id, info);
> > +		if (err < 0) {
> > +			dev_err(bpmp->dev, "failed to query clock %u: %d\n",
> > +				id, err);
> > +			continue;
> > +		}
> > +
> > +		if (info->num_parents >=3D U8_MAX) {
> > +			dev_err(bpmp->dev,
> > +				"clock %u has too many parents (%u, max: %u)\n",
> > +				id, info->num_parents, U8_MAX);
> > +			continue;
> > +		}
> > +
> > +		/* clock not exposed by BPMP */
> > +		if (info->name[0] =3D=3D '\0') {
> > +			holes++;
> > +			continue;
> > +		}
> > +
> > +		info->id =3D id;
>=20
> Why not store info at the offset associated with id? We've
> already computed max so it should work?

The problem is that the ID space of clocks is very sparse. There's only
about 300 clocks, but IDs going all the way to somewhere in the 600s.

> > +		count++;
> > +
> > +		if (TEGRA_BPMP_DUMP_CLOCK_INFO)
> > +			tegra_bpmp_clk_info_dump(bpmp, KERN_DEBUG, info);
> > +	}
> > +
> > +	dev_dbg(bpmp->dev, "holes: %u\n", holes);
> > +	*clocksp =3D clocks;
> > +
> > +	return count;
> > +}
> > +
> > +static const struct tegra_bpmp_clk_info *
> > +tegra_bpmp_clk_find(const struct tegra_bpmp_clk_info *clocks,
> > +		    unsigned int num_clocks, unsigned int id)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < num_clocks; i++)
> > +		if (clocks[i].id =3D=3D id)
> > +			return &clocks[i];
> > +
> > +	return NULL;
> > +}
> > +
> > +static struct clk_hw *
> > +tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
> > +			const struct tegra_bpmp_clk_info *info,
> > +			const struct tegra_bpmp_clk_info *clocks,
> > +			unsigned int num_clocks)
> > +{
> > +	struct tegra_bpmp_clk *priv;
> > +	struct clk_init_data init;
>=20
> Best to intialize init to { } here. I don't see init.flags set
> anywhere so that's already a problem.

Any objections about making this more explicitly with a memset() further
down?

> > +	const char **parents;
> > +	struct clk *clk;
> > +	unsigned int i;
> > +
> > +	priv =3D devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	priv->bpmp =3D bpmp;
> > +	priv->id =3D info->id;
> > +
> > +	priv->parents =3D devm_kcalloc(bpmp->dev, info->num_parents,
> > +				     sizeof(*priv->parents), GFP_KERNEL);
> > +	if (!priv->parents)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	priv->num_parents =3D info->num_parents;
> > +
> > +	/* hardware clock initialization */
> > +	priv->hw.init =3D &init;
> > +	init.name =3D info->name;
> > +
> > +	if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> > +		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
> > +			init.ops =3D &tegra_bpmp_clk_mux_rate_ops;
> > +		else
> > +			init.ops =3D &tegra_bpmp_clk_mux_ops;
> > +	} else {
> > +		if (info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE)
> > +			init.ops =3D &tegra_bpmp_clk_rate_ops;
> > +		else
> > +			init.ops =3D &tegra_bpmp_clk_gate_ops;
> > +	}
> > +
> > +	init.num_parents =3D info->num_parents;
> > +
> > +	parents =3D kcalloc(info->num_parents, sizeof(*parents), GFP_KERNEL);
> > +	if (!parents)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	for (i =3D 0; i < info->num_parents; i++) {
> > +		const struct tegra_bpmp_clk_info *parent;
> > +
> > +		/* keep a private copy of the ID to parent index map */
> > +		priv->parents[i] =3D info->parents[i];
> > +
> > +		parent =3D tegra_bpmp_clk_find(clocks, num_clocks,
> > +					     info->parents[i]);
> > +		if (!parent) {
> > +			dev_err(bpmp->dev, "no parent %u found for %u\n",
> > +				info->parents[i], info->id);
> > +			continue;
> > +		}
> > +
> > +		parents[i] =3D parent->name;
> > +	}
> > +
> > +	init.parent_names =3D parents;
> > +
> > +	clk =3D clk_register(bpmp->dev, &priv->hw);
>=20
> Just use clk_hw_register() please, or devm_clk_hw_register().

Okay, done.

> > +
> > +	kfree(parents);
> > +
> > +	if (IS_ERR(clk))
> > +		return ERR_CAST(clk);
> > +
> > +	return &priv->hw;
> > +}
> > +
> > +static int tegra_bpmp_register_clocks(struct tegra_bpmp *bpmp,
> > +				      struct tegra_bpmp_clk_info *clocks,
>=20
> s/clocks/infos?

Okay, done.

> > +				      unsigned int count)
> > +{
> > +	struct clk_hw *hw;
> > +	unsigned int i;
> > +
> > +	bpmp->num_clocks =3D count;
> > +
> > +	bpmp->clocks =3D devm_kcalloc(bpmp->dev, count, sizeof(hw), GFP_KERNE=
L);
> > +	if (!bpmp->clocks)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < count; i++) {
> > +		struct tegra_bpmp_clk_info *info =3D &clocks[i];
> > +
> > +		hw =3D tegra_bpmp_clk_register(bpmp, info, clocks, count);
> > +		if (IS_ERR(hw)) {
> > +			dev_err(bpmp->dev,
> > +				"failed to register clock %u (%s): %ld\n",
> > +				info->id, info->name, PTR_ERR(hw));
> > +			continue;
> > +		}
> > +
> > +		bpmp->clocks[i] =3D hw;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void tegra_bpmp_unregister_clocks(struct tegra_bpmp *bpmp)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < bpmp->num_clocks; i++)
> > +		clk_hw_unregister(bpmp->clocks[i]);
> > +}
> > +
> > +static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args *=
clkspec,
> > +					      void *data)
> > +{
> > +	unsigned int id =3D clkspec->args[0], i;
> > +	struct tegra_bpmp *bpmp =3D data;
> > +	struct tegra_bpmp_clk *clk;
> > +
> > +	for (i =3D 0; i < bpmp->num_clocks; i++) {
> > +		clk =3D to_tegra_bpmp_clk(bpmp->clocks[i]);
> > +		if (clk->id =3D=3D id)
> > +			return bpmp->clocks[i];
> > +	}
>=20
>  	for (i =3D 0; i < bpmp->num_clocks; i++) {
> 		hw =3D bpmp->clocks[i];
> 		clk =3D to_tegra_bpmp_clk(hw);
> 		if (clk->id =3D=3D id)
> 			return hw;
> 	}
>=20
> Uses another local variable but is much clearer.

Really? I think it's pretty clear in the original that we upcast,
compare and return the original pointer. Even if bpmp->clocks[i] is a
little longer than hw, the two occurrences are close enough together to
make this immediately obvious.

Maybe yet another alternative would be to make bpmp->clocks an array to
struct tegra_bpmp_clk instead of struct clk_hw. That way the ->xlate()
becomes simpler to handle at the expense of a slightly more complicated
implementation for tegra_bpmp_unregister_clocks(). Given that
unregistering clocks is a one-time operation but ->xlate() may be called
very often, this might be advantageous.

> > +
> > +	return NULL;
> > +}
> > +
> > +int tegra_bpmp_init_clocks(struct tegra_bpmp *bpmp)
>=20
> Someone is going to call this function? Why aren't we doing the
> typical device driver probe?

The BPMP driver is going to call this directly and everything will be
instantiated with the BPMP's parent device. If we were to go through the
driver probe dance, we'd need to add extra boilerplate to create the
device and extra boilerplate for the clock driver to bind to the device.
We'd also have to be especially careful to craft the device in such a
way as to make it hang off the same device tree node, so that we can use
the bpmp label to reference clocks.

It didn't seem worth to go through all that trouble.

Thanks for the review,
Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLX9QAAoJEN0jrNd/PrOhd4cQAKAnNXRZMWiBrlBG95fqQJdT
60yPcRKlchoRXwizk/xnKKuZwib+vzpD8qEoTSdsZ3l/LwiTmyd7Hwg0LL9riHh3
TkC0fa2j7f05oQ4JxjDX4qjgx+04ZzDzF8Wg1Ls7znxBXpAvHONvS+KxX3hWjyLV
UsURI489GUbaP3xpyPM1tdHzDY+ug83pi5QPlLeriwrdT3cx+glLrLwX4D9WiOVp
J3NvvpNy8vlXqPFhbuRJQ/EQanw+Q4OFVhafUbZSes8HA9OXRX761m3tfPVIHEd2
BNJuyve7LeC7wVfWY6CCPc0eFQVbjMbgVezeBICHC/boWIx3cGc34NrbH8xQrt1U
eT45kUVpYUkcJ5P2Hi7xRHiVfIcxmWaCQU56KBnpPn3z8o/LwniCDu3jv9X9CSZW
P8UETOSLsSDlJf+0O1F1ZR3vH0uJJkfcy2fVS8/NrMU7CUjKS0WKWATAn1jt8SSP
cJxPnH5jPBdG3MQyvHMeXuDDWIQtfRYJeZHvCc4luHx4tdKCAzEcJjuOS7UKScbf
NuX9jwXZ0buvUNyYRLepE3wcH+BNKHBNEg9haDyFUPEzrBCuW0IMNVfj4sf0sxk4
UVhYb/q8jdghBxmuIjpGM+DuQfLm+9PwY7tr50x4QBUDSV0dfbnkULGCTr6u80jH
/K3AzH+pQXPJVZT8okYN
=E+Ul
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
