From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 10/13] of: add a generic pinmux helper
Date: Mon, 29 Aug 2011 13:09:19 +0200
Message-ID: <CACRpkdaTiWEtgjVOhUKeXhpiESvrWyz97p5j_PHe3MvEM4UaCw@mail.gmail.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
	<1314315824-9687-11-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1314315824-9687-11-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 26, 2011 at 1:43 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> diff --git a/drivers/of/of_pinmux.c b/drivers/of/of_pinmux.c

> +int of_pinmux_parse(const struct of_pinmux_ctrl *ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct of_pinmux_cfg *cfg)

OK...

> +{
> + =A0 =A0 =A0 struct device_node *np;
> +
> + =A0 =A0 =A0 if (!ctrl || !ctrl->dev || !ctrl->node || !ctrl->configure)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 for_each_child_of_node(ctrl->node, np) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bool hadpins =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct of_iter_string_prop iter;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->node =3D np;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D of_property_read_string(np, "functi=
on",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 &cfg->function);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ctrl->dev, "no func=
tion for node %s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 np->name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }

I buy this part.

> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags &=3D 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_find_property(np, "pull-up", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags |=3D OF_PINMUX_P=
ULL_UP;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_find_property(np, "pull-down", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags |=3D OF_PINMUX_P=
ULL_DOWN;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((cfg->flags & OF_PINMUX_PULL_MASK) =3D=
=3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 OF_PINMUX_PULL_MASK) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(ctrl->dev, "node %=
s has both "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"pull-up=
 and pull-down properties - "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"default=
ing to no pull\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0np->name=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags &=3D ~OF_PINMUX_=
PULL_MASK;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_find_property(np, "tristate", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->flags |=3D OF_PINMUX_T=
RISTATE;

But what does this stuff has to do with pinmux?

I call this "pin biasing" and it has very little to do with muxing.

If a broader, generic term is to be used, I'd prefer "pin control"
which sort of nails the thing.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_string_property_value(iter, np, "p=
ins") {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hadpins =3D 1;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->pin =3D iter.value;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(ctrl->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "configure =
pin %s func=3D%s flags=3D0x%lx\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg->pin, c=
fg->function, cfg->flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctrl->configure(ctrl, c=
fg))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(ct=
rl->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0"failed to configure pin %s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0cfg->pin);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!hadpins)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(ctrl->dev, "no pin=
s for node %s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0np->name=
);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_pinmux_parse);

Renamed of_pinctrl_parse I'm happier with it.

> +/**
> + * struct of_pinmux_cfg - configuration state for a single pinmux entry.
> + *
> + * @function: the name of the function that the pinmux entry should be
> + * =A0 =A0 configured to.
> + * @pin: the device_node of the pinmux entry that should be configured.
> + * =A0 =A0 Platform specific properties that aren't in the generic bindi=
ng may be
> + * =A0 =A0 obtained from this device node.
> + * @flags: flags for common pinmux options such as pull and tristate.

I don't think these things has anything to do with pinmux at all.

But with the struct renamed of_pinctrl_cfg I'm again happier.

> + */
> +struct of_pinmux_cfg {
> + =A0 =A0 =A0 struct device_node =A0 =A0 =A0*node;
> + =A0 =A0 =A0 const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*pin;
> + =A0 =A0 =A0 const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*function;
> + =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 flags;
> +};

The current pinctrl patch set would probably want an unsigned
"position" attribute too. (If we should build on that.)

> +/**
> + * struct of_pinmux_ctrl - platform specific pinmux control state.
> + *
> + * @pinmux: the pinmux device node. =A0All child nodes are required to b=
e the
> + * =A0 =A0 pinmux entry definitions. =A0Depending on the platform, this =
may either be
> + * =A0 =A0 a single pin or a group of pins where they can be set to a co=
mmon
> + * =A0 =A0 function.
> + * @configure: platform specific callback to configure the pinmux entry.
> + */
> +struct of_pinmux_ctrl {
> + =A0 =A0 =A0 struct device =A0 =A0 =A0*dev;
> + =A0 =A0 =A0 struct device_node *node;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(*parse)(const struct of=
_pinmux_ctrl *ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct of_pinmux_cfg *cfg);
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(*configure)(const struc=
t of_pinmux_ctrl *ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const struct of_pinmux_cfg *cfg);
> +};

s/pinmux/pinctrl/g

Yours,
Linus Walleij
