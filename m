From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: tps6586x: add version detection
Date: Thu, 05 Dec 2013 10:06:55 -0700
Message-ID: <52A0B2AF.60803@wwwdotorg.org>
References: <cover.1386108712.git.stefan@agner.ch> <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/03/2013 03:18 PM, Stefan Agner wrote:
> Use the VERSIONCRC to determine the exact device version. According to
> the datasheet this register can be used as device identifier. The
> identification is needed since some tps6586x regulators use a different
> voltage table.

> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c

> @@ -493,13 +527,12 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
>  		return -EIO;
>  	}
>  
> -	dev_info(&client->dev, "VERSIONCRC is %02x\n", ret);
> -
>  	tps6586x = devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERNEL);
> -	if (tps6586x == NULL) {
> -		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
> +	if (!tps6586x)
>  		return -ENOMEM;
> -	}
> +
> +	tps6586x->version = ret;

I have to say, I dislike this version of the patch. Separating the
reading of the version register from the assignment to tps6586x->version
doesn't make any sense, especially given that the version value is
stored in a variable named "ret"; that name isn't remotely related to
what's stored there. What if someone comes along later and adds more
code that assigns to ret between where it's repurposed for the version
value and where it's assigned to tps6586x->version? It'd be extremely
difficult for a patch reviewer to spot that given the limited context in
a diff, and quite non-obvious to the person changing the code too..
