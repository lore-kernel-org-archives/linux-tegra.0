From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 11/12] clk: tegra: Add BPMP clock driver
Date: Mon, 22 Aug 2016 15:28:33 +0200
Message-ID: <20160822132833.GD17367@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-12-thierry.reding@gmail.com>
 <0d7080bc-9e82-75dd-7169-0a5b7429801e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0d7080bc-9e82-75dd-7169-0a5b7429801e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 11:11:57AM +0100, Jon Hunter wrote:
>=20
> On 19/08/16 18:32, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This driver uses the services provided by the BPMP firmware driver to
> > implement a clock driver based on the MRQ_CLK request. This part of the
> > BPMP ABI provides a means to enumerate and control clocks and should
> > allow the driver to work on any chip that supports this ABI.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/clk/tegra/Makefile   |   1 +
> >  drivers/clk/tegra/clk-bpmp.c | 565 +++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 566 insertions(+)
> >  create mode 100644 drivers/clk/tegra/clk-bpmp.c
> >=20
> > diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> > index 33fd0938d79e..130df5685d21 100644
> > --- a/drivers/clk/tegra/Makefile
> > +++ b/drivers/clk/tegra/Makefile
> > @@ -22,3 +22,4 @@ obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124-df=
ll-fcpu.o
> >  obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+=3D clk-tegra124.o
> >  obj-y					+=3D cvb.o
> >  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210.o
> > +obj-$(CONFIG_ARCH_TEGRA_186_SOC)	+=3D clk-bpmp.o
> > diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> > new file mode 100644
> > index 000000000000..96cd6becf73e
> > --- /dev/null
> > +++ b/drivers/clk/tegra/clk-bpmp.c
> > @@ -0,0 +1,565 @@
> > +#define DEBUG
>=20
> Do we want DEBUG by default?

That was left-over from debugging. I've removed it.

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
> > +
> > +	err =3D tegra_bpmp_clk_transfer(clk->bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
>=20
> tegra_bpmp_clk_transfer returns an int, but this function returns a u8.

I've added an error message containing the error code and made this
return U8_MAX.

> > +
> > +	for (i =3D 0; i < clk->num_parents; i++)
> > +		if (clk->parents[i] =3D=3D response.parent_id)
> > +			return i;
> > +
> > +	return U8_MAX;
>=20
> Is there any chance the U8_MAX =3D=3D num_parents? Should we warn here
> somewhere?

I've added a check to the function registration code that will refuse to
add clocks with num_parents >=3D U8_MAX. This should never happen because
the MRQ_CLK_MAX_PARENTS is the upper bound for this, and it's currently
very small.

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
> > +	return response.max_id;
>=20
> response.max_id is a uint32

I've added a check to make sure this doesn't overflow.

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
> > +static int tegra_bpmp_probe_clocks(struct tegra_bpmp *bpmp,
> > +				   struct tegra_bpmp_clk_info **clocksp)
> > +{
> > +	struct tegra_bpmp_clk_info *clocks;
> > +	unsigned int max_id, id, count =3D 0;
> > +	int err;
> > +
> > +	err =3D tegra_bpmp_clk_get_max_id(bpmp);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	max_id =3D err;
> > +
> > +	dev_dbg(bpmp->dev, "maximum clock ID: %u\n", max_id);
> > +
> > +	clocks =3D kcalloc(max_id + 1, sizeof(*clocks), GFP_KERNEL);
> > +	if (!clocks)
> > +		return -ENOMEM;
> > +
> > +	for (id =3D 0; id <=3D max_id; id++) {
> > +		struct tegra_bpmp_clk_info *info =3D &clocks[count];
> > +#if 0
> > +		const char *prefix =3D "";
> > +		struct seq_buf buf;
> > +		unsigned int i;
> > +		char flags[64];
> > +#endif
> > +
> > +		err =3D tegra_bpmp_clk_get_info(bpmp, id, info);
> > +		if (err < 0) {
> > +			dev_err(bpmp->dev, "failed to query clock %u: %d\n",
> > +				id, err);
> > +			continue;
> > +		}
> > +
> > +#if 0
> > +		seq_buf_init(&buf, flags, sizeof(flags));
> > +
> > +		if (info->flags)
> > +			seq_buf_printf(&buf, "(");
> > +
> > +		if (info->flags & TEGRA_BPMP_CLK_HAS_MUX) {
> > +			seq_buf_printf(&buf, "%smux", prefix);
> > +			prefix =3D ", ";
> > +		}
> > +
> > +		if ((info->flags & TEGRA_BPMP_CLK_HAS_SET_RATE) =3D=3D 0) {
> > +			seq_buf_printf(&buf, "%sfixed", prefix);
> > +			prefix =3D ", ";
> > +		}
> > +
> > +		if (info->flags & TEGRA_BPMP_CLK_IS_ROOT) {
> > +			seq_buf_printf(&buf, "%sroot", prefix);
> > +			prefix =3D ", ";
> > +		}
> > +
> > +		if (info->flags)
> > +			seq_buf_printf(&buf, ")");
> > +
> > +		dev_dbg(bpmp->dev, "  %03u: %s\n", id, info->name);
> > +		dev_dbg(bpmp->dev, "    flags: %lx %s\n", info->flags, flags);
> > +		dev_dbg(bpmp->dev, "    parents: %u\n", info->num_parents);
> > +
> > +		for (i =3D 0; i < info->num_parents; i++)
> > +			dev_dbg(bpmp->dev, "      %03u\n", info->parents[i]);
> > +#endif
> > +
> > +		/* clock not exposed by BPMP */
> > +		if (info->name[0] =3D=3D '\0')
> > +			continue;
> > +
> > +		info->id =3D id;
> > +		count++;
> > +	}
> > +
> > +	*clocksp =3D clocks;
>=20
> Nit we could just return the pointer.
>=20
> > +
> > +	return count;
>=20
> We return unsigned int here and not int. Why do we bother returning
> count and just store it directly in the bpmp->num_clocks here (see
> tegra_bpmp_register_clocks)?

Hm... I'm not sure but I think I had initially imagined this to be used
in two steps: call tegra_bpmp_probe_clocks() without passing in a clocks
buffer to get a count for how many clocks to allocate, allocate a buffer
with the proper size in the caller and call again, this time passing in
the new buffer. It looks like halfway through the code I changed my mind
and it's no longer consistent with what I had intended originally.

I'll rewrite this so that it (hopefully) makes more sense.

> > +	for (i =3D 0; i < info->num_parents; i++) {
> > +		/* keep a private copy of the ID to parent index map */
> > +		priv->parents[i] =3D info->parents[i];
> > +
> > +		for (j =3D 0; j < num_clocks; j++) {
> > +			const struct tegra_bpmp_clk_info *parent =3D &clocks[j];
> > +
> > +			if (parent->id =3D=3D info->parents[i]) {
> > +				parents[i] =3D parent->name;
> > +				break;
> > +			}
> > +		}
>=20
> Is it necessary to loop through all the clocks again here? This function
> is called from tegra_bpmp_register_clocks() which is already looping
> through all the clocks. So for each clock we loop through all the clocks
> again.

Yes, it's unfortunately necessary because clocks aren't topologically
sorted. That is, in the earlier loop we may encounter clocks for which a
parent hasn't been probed yet. That's not a problem for the common clock
framework because it supports orphan clocks and reparenting when their
parent becomes available. However, given that the driver queries all the
clock names from BPMP, we first need to get all names before we can save
the parent names for the CCFs consumption.

>=20
> > +		if (!parents[i])
> > +			dev_err(bpmp->dev, "no parent %u found for %u\n",
> > +				info->parents[i], info->id);
> > +	}
> > +
> > +	init.parent_names =3D parents;
> > +
> > +	clk =3D clk_register(bpmp->dev, &priv->hw);
>=20
> IS_ERR?

Yes, I've added a check.

> > +int tegra_bpmp_init_clocks(struct tegra_bpmp *bpmp)
> > +{
> > +	struct tegra_bpmp_clk_info *clocks;
> > +	unsigned int count;
> > +	int err;
> > +
> > +	dev_dbg(bpmp->dev, "> %s(bpmp=3D%p)\n", __func__, bpmp);
> > +
> > +	err =3D tegra_bpmp_probe_clocks(bpmp, &clocks);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	count =3D err;
> > +
> > +	dev_dbg(bpmp->dev, "%u clocks probed\n", count);
> > +
> > +	err =3D tegra_bpmp_register_clocks(bpmp, clocks, count);
> > +	if (err < 0) {
> > +		kfree(clocks);
> > +		return err;
> > +	}
> > +
> > +	kfree(clocks);
> > +
> > +	of_clk_add_hw_provider(bpmp->dev->of_node, tegra_bpmp_clk_of_xlate,
> > +			       bpmp);
>=20
> We should check the return code.

Yes, I suppose we should also make sure to remove all clocks if this
ever fails. I'll see how difficult it is to implement that.

Thierry

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXuv3+AAoJEN0jrNd/PrOhy6MP/iL0vrEn2gVGBh2H8ux0ahjH
UtHomEBXF+uiM2BtuNyDCjkUoRh3Fa2oKhdisIQjoQPhCjT0y3HVzqhLV8N1iYD+
G4spW/rGng3hiMWEbkIGcHrKYwmOuKEeaqQPYj9aVVH/cwX00atHrXVUDQITnVwH
h5r3rRzK5sKGu0W6g48TxzLxaakURqfZ50EIF3WrKuovjOhn7XkiPY4lyYVIctj3
KruZoKy2ObLc2EjQYVwrBclmbWJ4Yr1kvzJ5LM2pVLFweUlLNV5HVwVtu6rHIsVw
G6BrJg2Q2MjxS1l4eXm4Q6IXVE24OlhUfnMSh9gB5fSiBfvm1yKtU9BUIFqDgwvd
ZI0GyOjAEJ8UXKTVZ7d1L9TDCrJf6wRfBlzafYe+4ZDCApOfEaLnBjYcy2dA0g/3
rm+UoKp95tqY45yEeR2Ft2paIFAXjPqbvp6BwZYQfwjRLuj0+qABPOopsQ7dQy/W
uJnmbiwHpPI/iCotTgtHLAFmqDVYsAo8HDfOI2aO2C0ofnCcKGKYyYi2oJwqPGKm
GO0U7yQECD3OVz47ISNb/8Wvw3NXn6WjsEXYQAj6QxZitZmgaVkyKZ+Hdx1ZUofC
0xsraAJoUXSb2qbrNSKZN/MIPfMWkjRRsRF8IeTgJGb+hqAyZ8IZMLISoPFjVdVz
hwzKeHkg7gp9Mahn2/aZ
=EBJy
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
