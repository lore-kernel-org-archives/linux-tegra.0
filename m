From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: tps6586x: add version detection
Date: Wed, 27 Nov 2013 09:58:50 -0700
Message-ID: <529624CA.6030604@wwwdotorg.org>
References: <cover.1385508112.git.stefan@agner.ch> <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/26/2013 04:45 PM, Stefan Agner wrote:
> Use the VERSIONCRC to determine the exact device version. According to
> the datasheet this register can be used as device identifier. The
> identification is needed since some tps6586x regulators use a different
> voltage table.

> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c

> @@ -477,6 +486,7 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
>  {
>  	struct tps6586x_platform_data *pdata = dev_get_platdata(&client->dev);
>  	struct tps6586x *tps6586x;
> +	const char *name = "";

There's no need to assign any value here; the switch below always
assigns something over the top of the variable, so it doesn't need to be
pre-initialized.

> +	tps6586x = devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERNEL);
> +	if (tps6586x == NULL) {
> +		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
> +		return -ENOMEM;
> +	}

> +	tps6586x->version = (enum tps6586x_version)ret;

Why not make the version variable an integer of some kind. Then, the
cast wouldn't be required. The values like TPS658621A can be #defines or
const u32.

> +	switch (ret) {

That should switch on tps6586x->version since that's been assigned;
it'll make the purpose a bit clearer.

> +	default:
> +		name = "TPS6586X";
> +		break;
>  	}

I hope the rest of the code deals with unknown values of
tps6586x->version OK.
