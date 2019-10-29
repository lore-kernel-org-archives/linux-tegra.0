From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: phy: tegra: xusb: Complete exception handling in probe functions
Date: Tue, 29 Oct 2019 10:40:56 +0100
Message-ID: <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
References: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Coccinelle <cocci@systeme.lip6.fr>
List-Id: linux-tegra@vger.kernel.org

> I have got the impression then that the exception handling is incomplete=
 so far
> at these source code places.

How do you think about to try the following small script for the semantic =
patch
language out on the directory =E2=80=9Cdrivers/phy/tegra=E2=80=9D?

@display@
expression object;
identifier exit;
@@
 ... when any
 object =3D kzalloc(...)
 ...
 if (...)
 {
*kfree(object);
 goto exit;
 }
 ...
 if (...)
*   goto unregister;


Will any search pattern variations become more interesting for correspondi=
ng
automatic software transformations?

Regards,
Markus
