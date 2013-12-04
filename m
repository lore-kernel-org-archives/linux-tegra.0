From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: tps6586x: add version detection
Date: Wed, 4 Dec 2013 11:58:00 +0000
Message-ID: <20131204115800.GA6332@lee--X1>
References: <cover.1386108712.git.stefan@agner.ch>
 <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan@agner.ch>
 <20131204081021.GB7469@lee--X1>
 <e2ae7b9602d0c1e11f8e56ced17e9da0@agner.ch>
 <20131204100728.GA907@lee--X1>
 <20131204114909.GK29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131204114909.GK29268-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> > > As I pointed out in the comment above, the struct tps6586x is in =
the C
> > > file, so I would need to move that too. That's why I did not made=
 that
> > > change in the end. What do you think, should I still move (and mo=
ve the
> > > struct too?)=20
>=20
> > Why would the struct have to be moved if the function is inline?
>=20
> If the function is in the header and trying to use a struct that's on=
ly
> defined in the C file then it's not going to build - keeping the stru=
ct
> in the C file only does seem like a worthwhile thing for encapsulatio=
n.

Yes, I just carried out my own testing and found that out. Prior to
this I was under the impression that inline functions were directly
transposed into the location of the call, were perhaps it could make
use of any resources declared within that context. It appears that
impression was not correct.

Every day continues to be a school day. :)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
