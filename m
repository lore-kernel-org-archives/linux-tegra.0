From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/3] mfd: tps6586x: add version detection
Date: Fri, 6 Dec 2013 15:39:03 +0000
Message-ID: <20131206153903.GD23519@lee--X1>
References: <cover.1386333697.git.stefan@agner.ch>
 <7812fb79beac0a6a409090f43d129893f9f93b5b.1386333697.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7812fb79beac0a6a409090f43d129893f9f93b5b.1386333697.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 06 Dec 2013, Stefan Agner wrote:

> Use the VERSIONCRC to determine the exact device version. According t=
o
> the datasheet this register can be used as device identifier. The
> identification is needed since some tps6586x regulators use a differe=
nt
> voltage table.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Changes since v4:
>   - Use variable named version instead of ret
>=20
> Changes since v2:
>   - Avoid moving devm_kzalloc
> ---
>  drivers/mfd/tps6586x.c       | 50 ++++++++++++++++++++++++++++++++++=
+++-------
>  include/linux/mfd/tps6586x.h |  7 +++++++
>  2 files changed, 49 insertions(+), 8 deletions(-)

Applied with Acks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
