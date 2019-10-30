From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drivers/phy/tegra: Completion for exception handling in probe
 functions with SmPL?
Date: Wed, 30 Oct 2019 11:44:26 +0100
Message-ID: <161bbb97-09d9-f128-bd25-ef9348534144@web.de>
References: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
 <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <treding@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Dan Carpenter <dan.carpenter@oracle.com>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

> Will any search pattern variations become more interesting for correspon=
ding
> automatic software transformations?

I hoped to achieve something together with the semantic patch language
by the following transformation approach.

@adjustment@
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


Do you find such a change suggestion reasonable (in principle)?

But I stumble on another unexpected test result.

elfring@Sonne:~/Projekte/Linux/next-patched> spatch drivers/phy/tegra/xusb=
-tegra186.c ~/Projekte/Coccinelle/janitor/complete_exception_handling_in_p=
robe_functions1.cocci
init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
HANDLING: drivers/phy/tegra/xusb-tegra186.c


How would you like to clarify why diff hunks were not generated
for functions like =E2=80=9Ctegra186_usb2_pad_probe=E2=80=9D and =E2=80=9C=
tegra186_usb3_pad_probe=E2=80=9D
in such an use case?
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/phy/tegra/xusb-te=
gra186.c#L445
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/phy/tegra/xusb-tegra186.c?id=3Dbbf711682cd570697086e88388a2c718da918=
894#n445

Regards,
Markus
