From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: tps6586x: add version detection
Date: Fri, 6 Dec 2013 08:44:53 +0000
Message-ID: <20131206084453.GB13093@lee--X1>
References: <cover.1386108712.git.stefan@agner.ch>
 <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan@agner.ch>
 <52A0B2AF.60803@wwwdotorg.org>
 <b2a1db4167d319d355dd2a3a844553bc@agner.ch>
 <52A0BA85.4020201@wwwdotorg.org>
 <ac11b85d05765b3b68eff8c27041e965@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ac11b85d05765b3b68eff8c27041e965-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> >> <snip>
> >>>> @@ -493,13 +527,12 @@ static int tps6586x_i2c_probe(struct i2c_c=
lient *client,
> >>>>  		return -EIO;
> >>>>  	}
> >>>>
> >>>> -	dev_info(&client->dev, "VERSIONCRC is %02x\n", ret);
> >>>> -
> >>>>  	tps6586x =3D devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP=
_KERNEL);
> >>>> -	if (tps6586x =3D=3D NULL) {
> >>>> -		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
> >>>> +	if (!tps6586x)
> >>>>  		return -ENOMEM;
> >>>> -	}
> >>>> +
> >>>> +	tps6586x->version =3D ret;
> >>>
> >>> I have to say, I dislike this version of the patch. Separating th=
e
> >>> reading of the version register from the assignment to tps6586x->=
version
> >>> doesn't make any sense, especially given that the version value i=
s
> >>> stored in a variable named "ret"; that name isn't remotely relate=
d to
> >>> what's stored there. What if someone comes along later and adds m=
ore
> >>> code that assigns to ret between where it's repurposed for the ve=
rsion
> >>> value and where it's assigned to tps6586x->version? It'd be extre=
mely
> >>> difficult for a patch reviewer to spot that given the limited con=
text in
> >>> a diff, and quite non-obvious to the person changing the code too=
=2E.
> >>
> >> The value comes from the return value of i2c_smbus_read_byte_data.=
 If
> >> the value is below zero its an EIO error.
> >>
> >> I could add a variable "version", but for me it felt strange becau=
se we
> >> check if version is below zero. This feels like its a wrong versio=
n
> >> rather than a transmit error. So I would prefer ret over version. =
But I
> >> agree, when one just reads the patch, its not obvious what exactly
> >> happens.
> >=20
> > In my opinion, using a variable named "version" here would be
> > preferable. Testing that against <0 is just the way the I2C API wor=
ks,
> > so the same argument could be applied to any I2C access.

So, FWIW I agree with Stephen and have done from the start. Please
see my original comment from the first submission:

> >       ret =3D i2c_smbus_read_byte_data(client, TPS6586X_VERSIONCRC)=
;
>   If you're going to do this, please change 'ret' to 'version'.

> Hm, I try the empiric way:
>=20
> $ grep -r -e i2c_smbus_read_byte_data | grep "ret =3D" | wc -l
> 139
> $ grep -r -e i2c_smbus_read_byte_data | grep "version =3D" | wc -l
> 3
>=20
> Ok, thats not fair at all, version is usage specific whilst ret is no=
t.
>=20
> $ grep -r -e i2c_smbus_read_byte_data | grep " =3D " | wc -l
> 703

I not really that worried about what everyone else does. I'm more
concerned with doing what we deem to be the correct thing here.

> On the other hand is the additional variable. But I think the compile=
r
> will optimize that anyway, so this might not be an argument at all :-=
)
>=20
> I see your point... Should I create another patch revision? Lee, is t=
he
> patch already merged?

It isn't. Please submit another version as Stephen requests.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
