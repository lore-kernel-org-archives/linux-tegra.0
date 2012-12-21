From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv4 5/8] drm: tegra: Remove redundant host1x
Date: Fri, 21 Dec 2012 15:36:14 +0100
Message-ID: <20121221143614.GA16167@avionic-0098.adnet.avionic-design.de>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
 <1356089964-5265-6-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1356089964-5265-6-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2012 at 01:39:21PM +0200, Terje Bergstrom wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[...]
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
[...]
> +static int tegra_drm_add_client(struct device *dev, void *data)
> +{
> +	static const char * const compat[] =3D {
> +		"nvidia,tegra20-dc",
> +		"nvidia,tegra20-hdmi",
> +		"nvidia,tegra30-dc",
> +		"nvidia,tegra30-hdmi",
> +	};
> +	struct tegradrm *tegradrm =3D data;
> +	struct tegra_drm_client_entry *client;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(compat); i++) {
> +		if (of_device_is_compatible(dev->of_node, compat[i]) &&
> +		    of_device_is_available(dev->of_node)) {
> +			client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> +			if (!client)
> +				return -ENOMEM;
> +
> +			INIT_LIST_HEAD(&client->list);
> +			client->np =3D of_node_get(dev->of_node);
> +
> +			list_add_tail(&client->list, &tegradrm->drm_clients);
> +			dev_set_drvdata(dev, tegradrm);

This should go away now that we have an accessor for this, right?

> +static int tegra_drm_parse_dt(struct tegradrm *tegradrm)
> +{
> +	int err;
> +	struct device *dev;
> +
> +	/* host1x is parent of all devices */
> +	dev =3D bus_find_device_by_name(&platform_bus_type, NULL, "host1x");
> +	if (!dev)
> +		return -ENODEV;
> +
> +	/* find devices that are available and add them into the 'required'
> +	 * list */
> +	err =3D device_for_each_child(dev, tegradrm, tegra_drm_add_client);
> +
> +	return err;
> +}

I don't see why we can't keep the original code here. The problem with
your approach is that you'll match on a global device host1x, regardless
of it's relationship to tegra-drm. Instead what you should be doing is
use the hierarchical information that you have to make this work. So the
dummy device should be registered as a child device of host1x, because
that allows the host1x device to be obtained from the dummy's parent. In
that way you can use the host1x device's of_node to search through the
devicetree. That's precisely what the existing code does and I see no
reason to change that.

> +static void tegra_drm_close(struct drm_device *drm, struct drm_file *fil=
p)
> +{
> +
> +}
> +

This can be removed, right?

> +static struct platform_driver tegra_drm_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegradrm",

This should be "tegra-drm" to match the module name.

> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
[...]
> index 3a843a7..34cc3a1 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -17,6 +17,7 @@
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fixed.h>
> +#include <drm/tegra_drm.h>
> =20
>  struct tegra_framebuffer {
>  	struct drm_framebuffer base;
> @@ -28,17 +29,11 @@ static inline struct tegra_framebuffer *to_tegra_fb(s=
truct drm_framebuffer *fb)
>  	return container_of(fb, struct tegra_framebuffer, base);
>  }
> =20
> -struct host1x {
> -	struct drm_device *drm;
> +struct tegradrm {

Similarly, this should be tegra_drm.

> -struct host1x_client;
> +struct tegra_drm_client;

I don't see the point in renaming this. All of the devices are still
host1x clients, right? This patch would be a whole shorter if we didn't
rename these. None of these symbols are exported either so there's not
much chance for them to clash with anything.

>  static int tegra_hdmi_probe(struct platform_device *pdev)
>  {
> -	struct host1x *host1x =3D dev_get_drvdata(pdev->dev.parent);
>  	struct tegra_hdmi *hdmi;
>  	struct resource *regs;
>  	int err;
> +	struct tegradrm *tegradrm =3D platform_get_drvdata(pdev);

I think we all agreed already that you shouldn't be mucking with the
driver private data in this way.

> diff --git a/include/drm/tegra_drm.h b/include/drm/tegra_drm.h
> new file mode 100644
> index 0000000..8632f49
> --- /dev/null
> +++ b/include/drm/tegra_drm.h
> @@ -0,0 +1,20 @@
> +/*
> + * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _TEGRA_DRM_H_
> +#define _TEGRA_DRM_H_
> +
> +#endif

This can be removed as well.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ1HPeAAoJEN0jrNd/PrOhgjwP+gOYna3jczDSzhh5ZqKoofUB
S7XgTnFbRLn9oVxEldV7HYzYpmkX5XNdYxi/uIqRZ+6qKcXLEoirDxrY8GMF5Ogw
sDc7rnJ06B93UlVXb4l2OJorru3g3QfzvjzYwf0rqTmQ4RIwzZgJvYhrLCOD0xLQ
owcivuXKGFhRGSoYS8tgWIkBPOqR/y9Myr+urSGYib5eiMEm+Lo92mZ1rtHNwMCG
BYYi8ChcIaw1ToNl/cSYN0vXy0qrpA73fGz7c+SDUqgQw1QSX0ioM6AbM8tjcDo8
NLg8dYkJpgjjHn7weBMloXYubc0FOC4DloiJi94GlbaKmYuV/hSmoT534JF8c7D1
1Pga6U2X5rylwTqiDw/XM+Zyi1C+wzk/OxdsXsNodARK1uOvwUeNZvMmbGqF3fiN
0/cDHaRHi7SspwdsA3kDs0ZAXIxpEBeE/ENHjYEcME518bLHEqcjl/JfOFeSLqSq
/QrnHoUlAFG6PY3/mRf3r5ZLAhN7ChKvLOMijCc1tK0smvaCC04htzYjTB6H9YWe
oPH3N6CqlQ4U9o/eHAr7tLehfGGT8P1kr65zars9IUwp3YCjdUaKgCLruKKkueP5
RdOeDilUjh3DRQegNdY5wQXTVaXiXnIISE296MUiH8v6BOkv0s/4v1h3HmnoOFvm
aoMvEQK5/PyqF0R7ujfA
=ydl4
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
