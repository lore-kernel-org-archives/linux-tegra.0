From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 10/13] of: add a generic pinmux helper
Date: Mon, 29 Aug 2011 14:46:00 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B3279BEB@HQMAIL01.nvidia.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
	<1314315824-9687-11-git-send-email-swarren@nvidia.com>
 <CACRpkdaTiWEtgjVOhUKeXhpiESvrWyz97p5j_PHe3MvEM4UaCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaTiWEtgjVOhUKeXhpiESvrWyz97p5j_PHe3MvEM4UaCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Linus Walleij wrote at Monday, August 29, 2011 5:09 AM:
> On Fri, Aug 26, 2011 at 1:43 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
>=20
> > diff --git a/drivers/of/of_pinmux.c b/drivers/of/of_pinmux.c
>=20
> > +int of_pinmux_parse(const struct of_pinmux_ctrl *ctrl,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct of_pinmux_cfg *cfg)
>=20
> OK...
>=20
> > +{
> > + =A0 =A0 =A0 struct device_node *np;
> > +
> > + =A0 =A0 =A0 if (!ctrl || !ctrl->dev || !ctrl->node || !ctrl->conf=
igure)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> > +
> > + =A0 =A0 =A0 for_each_child_of_node(ctrl->node, np) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ret;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bool hadpins =3D 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct of_iter_string_prop iter;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->node =3D np;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D of_property_read_string(np, "=
function",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 &cfg->function);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ctrl->dev, "n=
o function for node %s\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 np->n=
ame);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>=20
> I buy this part.
>=20
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags &=3D 0;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_find_property(np, "pull-up", N=
ULL))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags |=3D OF_PI=
NMUX_PULL_UP;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_find_property(np, "pull-down",=
 NULL))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags |=3D OF_PI=
NMUX_PULL_DOWN;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((cfg->flags & OF_PINMUX_PULL_MASK=
) =3D=3D
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 OF_PINMUX_PULL_MASK) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(ctrl->dev, "=
node %s has both "
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"p=
ull-up and pull-down properties - "
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"d=
efaulting to no pull\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0np=
->name);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags &=3D ~OF_P=
INMUX_PULL_MASK;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_find_property(np, "tristate", =
NULL))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags |=3D OF_PI=
NMUX_TRISTATE;
>=20
> But what does this stuff has to do with pinmux?
>=20
> I call this "pin biasing" and it has very little to do with muxing.
>=20
> If a broader, generic term is to be used, I'd prefer "pin control"
> which sort of nails the thing.
>=20
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_string_property_value(iter, =
np, "pins") {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hadpins =3D 1;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->pin =3D iter.val=
ue;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(ctrl->dev,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "conf=
igure pin %s func=3D%s flags=3D0x%lx\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->=
pin, cfg->function, cfg->flags);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctrl->configure(c=
trl, cfg))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_w=
arn(ctrl->dev,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0"failed to configure pin %s\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0cfg->pin);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!hadpins)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(ctrl->dev, "=
no pins for node %s\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0np=
->name);
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(of_pinmux_parse);
>=20
> Renamed of_pinctrl_parse I'm happier with it.

Well, it's not just that; the struct contains the function field to
select for each pingroup, so it's not just pinctrl either.

> > +/**
> > + * struct of_pinmux_cfg - configuration state for a single pinmux =
entry.
> > + *
> > + * @function: the name of the function that the pinmux entry shoul=
d be
> > + * =A0 =A0 configured to.
> > + * @pin: the device_node of the pinmux entry that should be config=
ured.
> > + * =A0 =A0 Platform specific properties that aren't in the generic=
 binding may be
> > + * =A0 =A0 obtained from this device node.
> > + * @flags: flags for common pinmux options such as pull and trista=
te.
>=20
> I don't think these things has anything to do with pinmux at all.
>=20
> But with the struct renamed of_pinctrl_cfg I'm again happier.
>=20
> > + */
> > +struct of_pinmux_cfg {
> > + =A0 =A0 =A0 struct device_node =A0 =A0 =A0*node;
> > + =A0 =A0 =A0 const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*pin;
> > + =A0 =A0 =A0 const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*function;
> > + =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 flags;
> > +};
>=20
> The current pinctrl patch set would probably want an unsigned
> "position" attribute too. (If we should build on that.)

This does beg the question I asked previously:

The intent of this patch was to provide a way for devicetree to set the
complete initial state of the pinmux, in a SoC-specific fashion, withou=
t
interaction with the pinmux API.

However, I'm guessing you see the pinmux driver as not touching HW at
boot at all, and never programming anything except in response to a
driver calling pinmux_get()/pinmux_enable()?

In the former case, this code and related bindings wouldn't be influenc=
ed
by the pinmux API at all (and indeed arguably never should be, since DT
is supposed to be oriented purely at HW, and not influenced by driver
design). This approach might make the pinmux API mostly relevant only
for drivers that actively change between configurations at run-time, an=
d
not for drivers that don't need dynamic muxing.

However, in the latter case, this code should be part of the pinmux cor=
e,
and my patches to Tegra's pinmux driver dropped. It'd be difficult to
define a pinmux binding that wasn't influenced by the pinmux API's need=
s
in this case.

So, that's probably something we have to resolve first.

--=20
nvpublic
