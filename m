From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 26/27] drm/tegra: Add DSI support
Date: Mon, 14 Oct 2013 15:55:48 +0200
Message-ID: <20131014135548.GB16302@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-27-git-send-email-treding@nvidia.com>
 <52587F17.7060104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52587F17.7060104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:43:35PM -0600, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> > This commit adds support for both DSI outputs found on Tegra. Only very
> > minimal functionality is implemented, so advanced features like ganged
> > mode won't work.
> >=20
> > Due to the lack of other test hardware, some sections of the driver are
> > hardcoded to work with Dalmore.
>=20
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>=20
> > +static int tegra_dsi_show_regs(struct seq_file *s, void *data)
> > +{
> > +	struct drm_info_node *node =3D s->private;
> > +	struct tegra_dsi *dsi =3D node->info_ent->data;
> > +
> > +#define DUMP_REG(name)						\
> > +	seq_printf(s, "%-32s %#05x %08lx\n", #name, name,	\
> > +		   tegra_dsi_readl(dsi, name))
> > +
> > +	DUMP_REG(DSI_INCR_SYNCPT);
>=20
> Does it make sense to use an MMIO regmap instead? That way, you get all
> the debugfs files for free...

As far as I know, regmap doesn't give you the symbolic names for the
registers. I find that a rather useful feature because it allows to
easily compare the registers to the ones in our downstream kernels.

> > +static int tegra_dsi_probe(struct platform_device *pdev)
>=20
> > +	dsi->clk_parent =3D devm_clk_get(&pdev->dev, "parent");
> > +	if (IS_ERR(dsi->clk_parent))
> > +		return PTR_ERR(dsi->clk_parent);
> ...
> > +static const struct of_device_id tegra_dsi_of_match[] =3D {
> > +	{ .compatible =3D "nvidia,tegra114-dsi", },
>=20
> Is this DT binding documented? The clk_get() call above in particular
> imposes the requirement that DT contain a clock with that name, which
> should be part of the binding documentation.

I've documented the requirement for both the regular "dsi" as well as
the "parent" clock in the binding documentation, which I forgot to
update in the previous series.

Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt is where
this is documented. The DSI node has a compatible property of
nvidia,tegra<chip>-dsi, which I think is a common way to write the
binding at least for Tegra.

> Hopefully the values that this driver hard-codes won't be an issue for
> the DT binding; we can simply make those values the default if
> properties are missing. I assume it's likely that such a strategy will
> work here?

They shouldn't. In fact I think it should be possible to probe them
either using mechanisms built into DSI, or by querying the attached
panel (as matched by the corresponding device tree node).

I haven't done the latter yet because I plan to investigate whether
builtin DSI functionality can be used to probe for the information.

Thierry

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW/fkAAoJEN0jrNd/PrOhYhMQAMGpZhGkBLjP2fe01U0r8Asq
SKrp9kD9a1XJQaB4bL68m36/tFNAkGRq+uHjkKSh1FQLlTWOxcFqJ7c/LII/IZvZ
jFj39042ub91JyC5aD88EQoLy3eSagy8TbnoFDJRj6mMTkquR3p8pDdOgmgn7hmq
eNp+4QYg8upHWm0ySJiK/owjSccDFq9mfGLP8w0N0ZcYm+mvjZc6EXWfc1u84Fqi
jyZYYr7BrV8fPTPM1QY9HE/YBzw17VTloop5wb13Be6+K842a2oTtcnj02zwEUpq
nDrIcCTOggdcUAU7CXl0LwaeXcUbU/RuB+0GpGrbP7ztCCBFvM6iL/iEfiyp14JF
csX04WIWw0Yq5e52Hw57SNw92wC4CkYAKZ2iyDEm5dkWx+eCMl3aAYISOfeRbpli
IzJTdUVDM/xQzPkQ+wn8ApqkuYU7oiIZ7IrOHPCljsIQt0omGZBvtM//PjkIvH6O
O0CWzmyHGZzk/xXfkRF8+BVxzVrt+zJv9z4mRzmNwmyGlzG9Y/YHNf05SZgq9EV8
iE1S2Dn5sKEMAMb9pipS9pTvBceZaATzrtD+zRRMSOyeUv2UAIvwKTOt0hU8zrr8
qGJkCoNnvevl4X18BU7yOJS9l5TBFW2bmbxec5Gp27s6Mbs40OaOBnoh+x3gKRQP
5BNV52xFwkg7aKwtDvOj
=0d81
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
