From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] media: staging: tegra-vde: add missing
 pm_runtime_put_autosuspend
Date: Tue, 2 Jun 2020 12:23:14 +0200
Message-ID: <248e05e2-1df9-70f2-a6ac-f1af7de59a06@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-media-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-media-owner@vger.kernel.org
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

> Call to pm_runtime_get_sync increments counter even in case of
> failure leading to incorrect ref count.
> Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime reference counter is generally incremented by a call of
   the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D.
   Thus call the function =E2=80=9Cpm_runtime_put_autosuspend=E2=80=9D als=
o in one error case
   to keep the reference counting consistent.


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?

Regards,
Markus
