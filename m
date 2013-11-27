From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: tps6586x: add version detection
Date: Wed, 27 Nov 2013 13:09:54 +0000
Message-ID: <20131127130954.GF3296@lee--X1>
References: <cover.1385508112.git.stefan@agner.ch>
 <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, sameo@linux.intel.com, dev@lynxeye.de, mark.rutland@arm.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

<snip>

>  static int __remove_subdev(struct device *dev, void *unused)
>  {
>  	platform_device_unregister(to_platform_device(dev));
> @@ -477,6 +486,7 @@ static int tps6586x_i2c_probe(struct i2c_client *=
client,
>  {
>  	struct tps6586x_platform_data *pdata =3D dev_get_platdata(&client->=
dev);
>  	struct tps6586x *tps6586x;
> +	const char *name =3D "";

How much memory space does this guarantee?

>  	int ret;
> =20
>  	if (!pdata && client->dev.of_node)
> @@ -487,20 +497,39 @@ static int tps6586x_i2c_probe(struct i2c_client=
 *client,
>  		return -ENOTSUPP;
>  	}
> =20
> +	tps6586x =3D devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERN=
EL);
> +	if (tps6586x =3D=3D NULL) {

Can you take this oppotunity to change to:
  if (!tps6586x)

> +		dev_err(&client->dev, "memory for tps6586x alloc failed\n");

I'm not keen on -ENOMEM prints, just return -ENOMEM and be done with it=
=2E

> +		return -ENOMEM;
> +	}
> +
>  	ret =3D i2c_smbus_read_byte_data(client, TPS6586X_VERSIONCRC);

If you're going to do this, please change 'ret' to 'version'.

>  	if (ret < 0) {
>  		dev_err(&client->dev, "Chip ID read failed: %d\n", ret);
>  		return -EIO;

Why are you returning an error here when you have a valid enum of:
  TPS6586X_ANY	=3D -1,

>  	}
> =20
> -	dev_info(&client->dev, "VERSIONCRC is %02x\n", ret);
> -
> -	tps6586x =3D devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERN=
EL);
> -	if (tps6586x =3D=3D NULL) {
> -		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
> -		return -ENOMEM;
> +	tps6586x->version =3D (enum tps6586x_version)ret;
> +	switch (ret) {
> +	case TPS658621A:
> +		name =3D "TPS658621A";
> +		break;
> +	case TPS658621CD:
> +		name =3D "TPS658621C/D";
> +		break;
> +	case TPS658623:
> +		name =3D "TPS658623";
> +		break;
> +	case TPS658643:
> +		name =3D "TPS658643";
> +		break;
> +	default:
> +		name =3D "TPS6586X";
> +		break;
>  	}
> =20
> +	dev_info(&client->dev, "Found %s, VERSIONCRC is %02x\n", name, ret)=
;
> +

I'd suggest pulling this out of probe() and into a separate subroutine.

<snip>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
