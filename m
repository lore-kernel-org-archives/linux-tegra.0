From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: tps6586x: add version detection
Date: Wed, 4 Dec 2013 10:07:28 +0000
Message-ID: <20131204100728.GA907@lee--X1>
References: <cover.1386108712.git.stefan@agner.ch>
 <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan@agner.ch>
 <20131204081021.GB7469@lee--X1>
 <e2ae7b9602d0c1e11f8e56ced17e9da0@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e2ae7b9602d0c1e11f8e56ced17e9da0-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 04 Dec 2013, Stefan Agner wrote:

> Am 2013-12-04 09:10, schrieb Lee Jones:
> >> +int tps6586x_get_version(struct device *dev)
> >> +{
> >> +	struct tps6586x *tps6586x =3D dev_get_drvdata(dev);
> >> +
> >> +	return tps6586x->version;
> >> +}
> >> +EXPORT_SYMBOL_GPL(tps6586x_get_version);
> >=20
> > I thought Mark suggested that this routine was converted to a 'stat=
ic
> > inline' and moved into the header? Did you not think this was a goo=
d
> > idea?
> As I pointed out in the comment above, the struct tps6586x is in the =
C
> file, so I would need to move that too. That's why I did not made tha=
t
> change in the end. What do you think, should I still move (and move t=
he
> struct too?)=20

Why would the struct have to be moved if the function is inline?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
