From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] pinctrl: Cleanup string initializations (char[] instead of char *)
Date: Sat, 17 May 2014 16:37:25 +0200
Message-ID: <1400337445-25750-1-git-send-email-manuel.schoelling@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Initializations like 'char *foo =3D "bar"' will create two variables: a=
 static
string and a pointer (foo) to that static string. Instead 'char foo[] =3D=
 "bar"'
will declare a single variable and will end up in shorter
assembly (according to Jeff Garzik on the KernelJanitor's TODO list).

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mxs.c    |    6 +++---
 drivers/pinctrl/pinctrl-single.c |    4 ++--
 drivers/pinctrl/pinctrl-tegra.c  |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mxs.c b/drivers/pinctrl/pinctrl-mx=
s.c
index 40c76f2..cd4215e 100644
--- a/drivers/pinctrl/pinctrl-mxs.c
+++ b/drivers/pinctrl/pinctrl-mxs.c
@@ -351,7 +351,7 @@ static int mxs_pinctrl_parse_group(struct platform_=
device *pdev,
 	struct mxs_pinctrl_data *d =3D platform_get_drvdata(pdev);
 	struct mxs_group *g =3D &d->soc->groups[idx];
 	struct property *prop;
-	const char *propname =3D "fsl,pinmux-ids";
+	const char propname[] =3D "fsl,pinmux-ids";
 	char *group;
 	int length =3D strlen(np->name) + SUFFIX_LEN;
 	u32 val, i;
@@ -399,8 +399,8 @@ static int mxs_pinctrl_probe_dt(struct platform_dev=
ice *pdev,
 	struct device_node *np =3D pdev->dev.of_node;
 	struct device_node *child;
 	struct mxs_function *f;
-	const char *gpio_compat =3D "fsl,mxs-gpio";
-	const char *fn, *fnull =3D "";
+	const char gpio_compat[] =3D "fsl,mxs-gpio";
+	const char *fn, fnull[] =3D "";
 	int i =3D 0, idxf =3D 0, idxg =3D 0;
 	int ret;
 	u32 val;
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl=
-single.c
index 2960557..a3ed99f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1561,8 +1561,8 @@ static struct of_device_id pcs_of_match[];
=20
 static int pcs_add_gpio_func(struct device_node *node, struct pcs_devi=
ce *pcs)
 {
-	const char *propname =3D "pinctrl-single,gpio-range";
-	const char *cellname =3D "#pinctrl-single,gpio-range-cells";
+	const char propname[] =3D "pinctrl-single,gpio-range";
+	const char cellname[] =3D "#pinctrl-single,gpio-range-cells";
 	struct of_phandle_args gpiospec;
 	struct pcs_gpiofunc_range *range;
 	int ret, i;
diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-=
tegra.c
index 6545809..43eeb1b 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -576,7 +576,7 @@ static void tegra_pinconf_config_dbg_show(struct pi=
nctrl_dev *pctldev,
 {
 	enum tegra_pinconf_param param =3D TEGRA_PINCONF_UNPACK_PARAM(config)=
;
 	u16 arg =3D TEGRA_PINCONF_UNPACK_ARG(config);
-	const char *pname =3D "unknown";
+	const char pname[] =3D "unknown";
 	int i;
=20
 	for (i =3D 0; i < ARRAY_SIZE(cfg_params); i++) {
--=20
1.7.10.4
