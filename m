From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drivers/phy/tegra: Completion for exception handling in probe
 functions with SmPL?
Date: Wed, 30 Oct 2019 21:50:17 +0100
Message-ID: <205e2b3a-2934-f5d0-6b12-59beee0d58fa@web.de>
References: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
 <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
 <161bbb97-09d9-f128-bd25-ef9348534144@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <161bbb97-09d9-f128-bd25-ef9348534144@web.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <treding@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Dan Carpenter <dan.carpenter@oracle.com>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

> But I stumble on another unexpected test result.

I got more promising results by the following transformation approach.

@adjustment exists@
expression object;
identifier exit;
@@
 object =3D kzalloc(...)
 ...
 if (...)
-{  kfree(object);
    goto
-        exit
+        release_memory
    ;
-}
 ... when any
 device_unregister(...);
-exit
+release_memory
 :
+kfree(object);
 return ERR_PTR(...);


The scope property of such a SmPL rule occasionally needs also more
software development attention.
https://github.com/coccinelle/coccinelle/blob/ed1eb8e06f800739d3992158d369=
45c0c4c6f0c7/docs/manual/cocci_syntax.tex#L860

I observe that the pretty-printing for the generated source code will need
further improvements (according to the Linux coding style).

Example:

elfring@Sonne:~/Projekte/Linux/next-patched> spatch drivers/phy/tegra/xusb=
-tegra186.c ~/Projekte/Coccinelle/janitor/complete_exception_handling_in_p=
robe_functions6.cocci
=E2=80=A6
@@ -461,10 +461,8 @@ tegra186_usb2_pad_probe(struct tegra_xus
 	pad->soc =3D soc;

 	err =3D tegra_xusb_pad_init(pad, padctl, np);
-	if (err < 0) {
-		kfree(usb2);
-		goto out;
-	}
+	if (err < 0)
+		goto release_memory;

 	priv->usb2_trk_clk =3D devm_clk_get(&pad->dev, "trk");
 	if (IS_ERR(priv->usb2_trk_clk)) {
@@ -483,7 +481,8 @@ tegra186_usb2_pad_probe(struct tegra_xus

 unregister:
 	device_unregister(&pad->dev);
-out:
+release_memory :
+kfree(usb2);
 	return ERR_PTR(err);
 }
=E2=80=A6


How reasonable do you find the presented update suggestion?

Regards,
Markus
