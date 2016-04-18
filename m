From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 3/9] dt-bindings: phy: tegra-xusb-padctl: Add
 Tegra210 support
Date: Mon, 18 Apr 2016 13:50:35 +0200
Message-ID: <20160418115035.GD17716@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-3-git-send-email-thierry.reding@gmail.com>
 <56E99F10.1060508@wwwdotorg.org>
 <20160405144416.GA10809@ulmo.ba.sec>
 <570429B8.3060002@wwwdotorg.org>
 <20160406170824.GA28843@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160406170824.GA28843-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2016 at 07:08:24PM +0200, Thierry Reding wrote:
[...]
> I attached what I came up with. It extends the OF PHY provider registry
> by allowing an additional node to be specified that if specified will
> serve as the parent for the child lookup (and hence overrides the
> default node that's taken from the struct device).
>=20
> It is a fairly trivial patch, and you'll notice the bulk of the changes
> is adding the additional parameter in a number of different places. The
> only thing I'm not quite happy about is that we start needing to pass a
> fairly large number of arguments. But perhaps it's still okay.
>=20
> An alternative would be to make struct phy_provider embeddable into
> driver private structures. That way they could be completely initialized
> by a driver before being passed to the __of_phy_provider_register()
> function (much like struct gpio_chip and others). That would be a fairly
> intrusive change, one that I'd be willing to take on, though I'd like to
> have Kishon's opinion on this before going ahead.
>=20
> For reference, here's what I'm imagining:
>=20
> 	struct foo_phy_provider {
> 		struct phy_provider base;
> 		...
> 	};
>=20
> 	int foo_probe(struct platform_device *pdev)
> 	{
> 		struct foo_phy_provider *priv;
> 		...
>=20
> 		priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> 		if (!priv)
> 			return -ENOMEM;
>=20
> 		priv->base.dev =3D &pdev->dev;
> 		priv->base.of_xlate =3D foo_of_xlate;
>=20
> 		err =3D devm_of_phy_provider_register(&priv->base);
> 		if (err < 0)
> 			return err;
>=20
> 		...
> 	}
>=20
> And of course adapt the signature of the __of_phy_provider_register()
> function and remove the allocation from it.
>=20
> Thierry
>=20
> --- >8 ---
> From 15e5348a1a63837efd00309fdce5cda979498f77 Mon Sep 17 00:00:00 2001
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date: Tue, 5 Apr 2016 17:17:34 +0200
> Subject: [PATCH] phy: core: Allow children node to be overridden
>=20
> In order to more flexibly support device tree bindings, allow drivers to
> override the container of the child nodes. By default the device node of
> the PHY provider is assumed to be the parent for children, but bindings
> may decide to add additional levels for better organization.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/phy.txt   | 16 ++++++++++++++--
>  drivers/phy/phy-core.c  | 27 +++++++++++++++++++++------
>  include/linux/phy/phy.h | 31 +++++++++++++++++++++----------
>  3 files changed, 56 insertions(+), 18 deletions(-)

Hi Kishon,

I'd like to take this through the Tegra tree along with the remainder of
the XUSB pad controller and XHCI patches that depend on it. The nice
thing is that it's fairly unintrusive but gives people an easy way to
support more flexible bindings by allowing the OF node to be overridden
when registering the PHY provider.

Are you okay with the change below? If so, could you provide an
Acked-by? I can provide a stable branch for you to pull into the PHY
tree that I'd like to use as a base for the remainder of the series.
I did a fair amount of compile-testing and upon inspection the API that
the patch modifies isn't called in many places, everyone uses the
convenience macros. The stable branch will be helpful in fixing up any
new users, should any appear during the development cycle.

Thanks,
Thierry

> diff --git a/Documentation/phy.txt b/Documentation/phy.txt
> index b388c5af9e72..0aa994bd9a91 100644
> --- a/Documentation/phy.txt
> +++ b/Documentation/phy.txt
> @@ -31,16 +31,28 @@ should provide its own implementation of of_xlate. of=
_xlate is used only for
>  dt boot case.
> =20
>  #define of_phy_provider_register(dev, xlate)    \
> -        __of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +        __of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
> =20
>  #define devm_of_phy_provider_register(dev, xlate)       \
> -        __devm_of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +        __devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate=
))
> =20
>  of_phy_provider_register and devm_of_phy_provider_register macros can be=
 used to
>  register the phy_provider and it takes device and of_xlate as
>  arguments. For the dt boot case, all PHY providers should use one of the=
 above
>  2 macros to register the PHY provider.
> =20
> +Often the device tree nodes associated with a PHY provider will contain =
a set
> +of children that each represent a single PHY. Some bindings may nest the=
 child
> +nodes within extra levels for context and extensibility, in which case t=
he low
> +level of_phy_provider_register_full() and devm_of_phy_provider_register_=
full()
> +macros can be used to override the node containing the children.
> +
> +#define of_phy_provider_register_full(dev, children, xlate) \
> +	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
> +
> +#define devm_of_phy_provider_register_full(dev, children, xlate) \
> +	__devm_of_phy_provider_register_full(dev, children, THIS_MODULE, xlate)
> +
>  void devm_of_phy_provider_unregister(struct device *dev,
>  	struct phy_provider *phy_provider);
>  void of_phy_provider_unregister(struct phy_provider *phy_provider);
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index e7e574dc667a..7f7da2138c82 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -135,13 +135,19 @@ static struct phy *phy_find(struct device *dev, con=
st char *con_id)
>  static struct phy_provider *of_phy_provider_lookup(struct device_node *n=
ode)
>  {
>  	struct phy_provider *phy_provider;
> +	struct device_node *children;
>  	struct device_node *child;
> =20
>  	list_for_each_entry(phy_provider, &phy_provider_list, list) {
>  		if (phy_provider->dev->of_node =3D=3D node)
>  			return phy_provider;
> =20
> -		for_each_child_of_node(phy_provider->dev->of_node, child)
> +		if (!phy_provider->children)
> +			children =3D phy_provider->dev->of_node;
> +		else
> +			children =3D phy_provider->children;
> +
> +		for_each_child_of_node(children, child)
>  			if (child =3D=3D node)
>  				return phy_provider;
>  	}
> @@ -811,16 +817,22 @@ EXPORT_SYMBOL_GPL(devm_phy_destroy);
>  /**
>   * __of_phy_provider_register() - create/register phy provider with the =
framework
>   * @dev: struct device of the phy provider
> + * @children: device node containing children (if different from dev->of=
_node)
>   * @owner: the module owner containing of_xlate
>   * @of_xlate: function pointer to obtain phy instance from phy provider
>   *
>   * Creates struct phy_provider from dev and of_xlate function pointer.
>   * This is used in the case of dt boot for finding the phy instance from
>   * phy provider.
> + *
> + * If the PHY provider doesn't nest children directly but uses a separate
> + * child node to contain the individual children, the @children parameter
> + * can be used to override the default (i.e. dev->of_node).
>   */
>  struct phy_provider *__of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args))
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>  {
>  	struct phy_provider *phy_provider;
> =20
> @@ -829,6 +841,7 @@ struct phy_provider *__of_phy_provider_register(struc=
t device *dev,
>  		return ERR_PTR(-ENOMEM);
> =20
>  	phy_provider->dev =3D dev;
> +	phy_provider->children =3D children;
>  	phy_provider->owner =3D owner;
>  	phy_provider->of_xlate =3D of_xlate;
> =20
> @@ -854,8 +867,9 @@ EXPORT_SYMBOL_GPL(__of_phy_provider_register);
>   * on the devres data, then, devres data is freed.
>   */
>  struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args))
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>  {
>  	struct phy_provider **ptr, *phy_provider;
> =20
> @@ -863,7 +877,8 @@ struct phy_provider *__devm_of_phy_provider_register(=
struct device *dev,
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	phy_provider =3D __of_phy_provider_register(dev, owner, of_xlate);
> +	phy_provider =3D __of_phy_provider_register(dev, children, owner,
> +						  of_xlate);
>  	if (!IS_ERR(phy_provider)) {
>  		*ptr =3D phy_provider;
>  		devres_add(dev, ptr);
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 8cf05e341cff..a810f2a18842 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -77,6 +77,7 @@ struct phy {
>   */
>  struct phy_provider {
>  	struct device		*dev;
> +	struct device_node	*children;
>  	struct module		*owner;
>  	struct list_head	list;
>  	struct phy * (*of_xlate)(struct device *dev,
> @@ -93,10 +94,16 @@ struct phy_lookup {
>  #define	to_phy(a)	(container_of((a), struct phy, dev))
> =20
>  #define	of_phy_provider_register(dev, xlate)	\
> -	__of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +	__of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
> =20
>  #define	devm_of_phy_provider_register(dev, xlate)	\
> -	__devm_of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +	__devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
> +
> +#define of_phy_provider_register_full(dev, children, xlate) \
> +	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
> +
> +#define devm_of_phy_provider_register_full(dev, children, xlate) \
> +	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
> =20
>  static inline void phy_set_drvdata(struct phy *phy, void *data)
>  {
> @@ -147,11 +154,13 @@ struct phy *devm_phy_create(struct device *dev, str=
uct device_node *node,
>  void phy_destroy(struct phy *phy);
>  void devm_phy_destroy(struct device *dev, struct phy *phy);
>  struct phy_provider *__of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args));
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args));
>  struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args));
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args));
>  void of_phy_provider_unregister(struct phy_provider *phy_provider);
>  void devm_of_phy_provider_unregister(struct device *dev,
>  	struct phy_provider *phy_provider);
> @@ -312,15 +321,17 @@ static inline void devm_phy_destroy(struct device *=
dev, struct phy *phy)
>  }
> =20
>  static inline struct phy_provider *__of_phy_provider_register(
> -	struct device *dev, struct module *owner, struct phy * (*of_xlate)(
> -	struct device *dev, struct of_phandle_args *args))
> +	struct device *dev, struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>  {
>  	return ERR_PTR(-ENOSYS);
>  }
> =20
>  static inline struct phy_provider *__devm_of_phy_provider_register(struc=
t device
> -	*dev, struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args))
> +	*dev, struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>  {
>  	return ERR_PTR(-ENOSYS);
>  }
> --=20
> 2.8.0
>=20



--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFMoKAAoJEN0jrNd/PrOhYZ4P/3KPDrrfS43mmgOp28SefFSS
6kwNYgdHEGz+WG0kEWhkutzUERkKsYAEOMscbHqnrGtiVGrrsmdO+SKighQPEfkh
6Tg7PvL1U+RJeO6FQoinVGNLyYnPd7DvWZ5zYguh9EhQDMiRuWMXNQ2CPRTcIb2r
31ugX8kLX2f1UyI2/O+LKxRwfkcjLr2O9aHvYxPR15oe3Vo+2tu1pbrsythvGenm
1LM/LovRkHltO7YZH6DbAzbxr1Tov+FO1fxXZiMDbwJjXY43cjMxtbJkYqz/BnoI
4uHoHJVaHviSv3gBd6AkNl9loBPhu1I/Q07GT2rLlzcNfBSyY40ETxEc9DB1AtjD
OtjkAN0Z1LEYiQxUvKDY7aq5a76/GDmSWBcBuJiZVmbmla3ivSolAYM8+96jNMWQ
XpSXY+1yDCoA9VR+UL2L5sZ+f3dglhmZMjC307/K3ihMQ/JrwuwWzwZ8LFc8EeyU
RYM/dy2F9Y9RlZCFXg11eWJgwPrVgmHVIxZs/NCjwPsqgp0JiG28Ds/4+MkgbTmn
DH2n3l89iyRhSSvEA1wOaV7gEyb4AIa3gFbckpI4Kcp4OVNrmr6efkB3b7f73Tdz
yY6XitxEtqezAKr1KKPVvannBun7aSrZ2b2llGhTnSr9r4oW1EEEwTk3jmQdY3Ey
LZ6cabJDyCvuXp++hzRm
=HHrr
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
