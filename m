From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: tps6586x: add version detection
Date: Wed, 27 Nov 2013 14:36:41 +0000
Message-ID: <20131127143641.GO3296@lee--X1>
References: <cover.1385508112.git.stefan@agner.ch>
 <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan@agner.ch>
 <20131127130954.GF3296@lee--X1>
 <cd69295e946b48451f449eacc02efa4a@agner.ch>
 <20131127135547.GK3296@lee--X1>
 <cfb203a896eda67c106794d89e668d56@agner.ch>
 <20131127143429.GN3296@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131127143429.GN3296@lee--X1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Re-adding the list.

Please remember to 'reply to all' when discussing patches.

> > >> Hm, when the device is not answering on that request, the probe =
method
> > >> should fail I would say. This means that the device is missing m=
ost
> > >> likely. However, I should set the device version to TPS6586X_ANY=
 if I
> > >> happen to end up in the default case.
> > >=20
> > > I would say that returning an error is the sound thing to do, but=
 I'm
> > > missing the point of TPS6586X_ANY, as it doesn't appear to be use=
d in
> > > this context.
> > >=20
> >=20
> > Yes, its mainly used in the regulator code later on. I do assign vo=
ltage
> > table to TPS6586X_ANY, if its the appropriate table for any version=
 of
> > the device.=20
>=20
> <snip>
>=20
> > Ok, will change this. Setting the version to TPS6586X_ANY in the de=
fault
> > case is anyway not a good idea since it would suppress unknown vers=
ions.
>=20
> Perhaps I should suggest to make TPS6586X_ANY a positive number then,
> as a negative value to me indicates more of an error than a generic
> parameter.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
