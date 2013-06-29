From: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] power_supply: Add of_node_put to fix refcount
Date: Fri, 28 Jun 2013 18:22:55 -0700
Message-ID: <20130629012255.GA20924@lizard>
References: <1370899602-22123-1-git-send-email-rklein@nvidia.com>
 <1370899602-22123-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370899602-22123-2-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 10, 2013 at 05:26:39PM -0400, Rhyland Klein wrote:
> of_parse_phandle increments the refcount for a dt node before returni=
ng
> it. Add of_node_put where needed to properly decrement the refcount
> when we are done using a given node.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

With CONFIG_OF=3Dn I got this:

  CC      drivers/power/sbs-battery.o
  drivers/power/sbs-battery.c: In function =E2=80=98sbs_probe=E2=80=99:
  drivers/power/sbs-battery.c:707:20: error: =E2=80=98struct power_supp=
ly=E2=80=99 has no
  member named =E2=80=98of_node=E2=80=99
  make[1]: *** [drivers/power/sbs-battery.o] Error 1

I fixed this by the patch below and applied your 1-3 series.

Thanks!

Anton

commit b50df95c8f0703c95625181d2eaf53855c5ebee5
Author: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Date:   Fri Jun 28 18:17:22 2013 -0700

    power_supply: Move of_node out of the #ifdef CONFIG_OF
   =20
    Similar to linux/device.h, move of_node struct member out of the #i=
fdef
    CONFIG_OF so that the drivers won't have to mess with #ifdefs in .c=
 files.
   =20
    Signed-off-by: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>

diff --git a/include/linux/power_supply.h b/include/linux/power_supply.=
h
index 3828cef..804b906 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -162,6 +162,8 @@ union power_supply_propval {
 	const char *strval;
 };
=20
+struct device_node;
+
 struct power_supply {
 	const char *name;
 	enum power_supply_type type;
@@ -173,9 +175,7 @@ struct power_supply {
=20
 	char **supplied_from;
 	size_t num_supplies;
-#ifdef CONFIG_OF
 	struct device_node *of_node;
-#endif
=20
 	int (*get_property)(struct power_supply *psy,
 			    enum power_supply_property psp,
