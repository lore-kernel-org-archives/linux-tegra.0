From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: tps6586x: add version detection
Date: Wed, 27 Nov 2013 13:55:47 +0000
Message-ID: <20131127135547.GK3296@lee--X1>
References: <cover.1385508112.git.stefan@agner.ch>
 <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan@agner.ch>
 <20131127130954.GF3296@lee--X1>
 <cd69295e946b48451f449eacc02efa4a@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cd69295e946b48451f449eacc02efa4a-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> >>  	if (ret < 0) {
> >>  		dev_err(&client->dev, "Chip ID read failed: %d\n", ret);
> >>  		return -EIO;
> >=20
> > Why are you returning an error here when you have a valid enum of:
> >   TPS6586X_ANY	=3D -1,
> >=20
> Hm, when the device is not answering on that request, the probe metho=
d
> should fail I would say. This means that the device is missing most
> likely. However, I should set the device version to TPS6586X_ANY if I
> happen to end up in the default case.

I would say that returning an error is the sound thing to do, but I'm
missing the point of TPS6586X_ANY, as it doesn't appear to be used in
this context.

> >>  	}
> >>
> >> -	dev_info(&client->dev, "VERSIONCRC is %02x\n", ret);
> >> -
> >> -	tps6586x =3D devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_K=
ERNEL);
> >> -	if (tps6586x =3D=3D NULL) {
> >> -		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
> >> -		return -ENOMEM;
> >> +	tps6586x->version =3D (enum tps6586x_version)ret;
> >> +	switch (ret) {
> >> +	case TPS658621A:
> >> +		name =3D "TPS658621A";
> >> +		break;
> >> +	case TPS658621CD:
> >> +		name =3D "TPS658621C/D";
> >> +		break;
> >> +	case TPS658623:
> >> +		name =3D "TPS658623";
> >> +		break;
> >> +	case TPS658643:
> >> +		name =3D "TPS658643";
> >> +		break;
> >> +	default:
> >> +		name =3D "TPS6586X";
> >> +		break;
> >>  	}
> >>
> >> +	dev_info(&client->dev, "Found %s, VERSIONCRC is %02x\n", name, r=
et);
> >> +
> >=20
> > I'd suggest pulling this out of probe() and into a separate subrout=
ine.
> >=20
> > <snip>
> Since I will alter the version when I end up in the default case in m=
y
> next patch, would you still do a separate subroutine? I think its
> somewhat heavily coupled to the probe function.
>=20
> Sorry missing you on the CC, will do next time :-)

It's not that it's unrelated, it's just a whole bulk of code which is
essentially featureless. 17 lines of code just to have the name of the
device in the bootlog. For that reason I'd like to see this abstracted
from (the useful stuff in) probe() please.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
