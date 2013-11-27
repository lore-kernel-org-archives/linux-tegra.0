From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: tps6586x: add version detection
Date: Wed, 27 Nov 2013 22:44:52 +0100
Message-ID: <ddd65b4d645cb99c3288960ea2dbe7a3@agner.ch>
References: <cover.1385508112.git.stefan@agner.ch>
 <ef881d39f78b75b4badeebb5be0264edc3906d86.1385508112.git.stefan@agner.ch>
 <529624CA.6030604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <529624CA.6030604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am 2013-11-27 17:58, schrieb Stephen Warren:
<snip>
>> +	tps6586x = devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERNEL);
>> +	if (tps6586x == NULL) {
>> +		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
>> +		return -ENOMEM;
>> +	}
> 
>> +	tps6586x->version = (enum tps6586x_version)ret;
> 
> Why not make the version variable an integer of some kind. Then, the
> cast wouldn't be required. The values like TPS658621A can be #defines or
> const u32.
> 
Yep this would work too. Whatever is preferred, maybe define would be
more consistent since SLEW_RATE are defines too (both, the VERSIONCRC
and SLEW_RATE values are possible content of registers).

>> +	switch (ret) {
> 
> That should switch on tps6586x->version since that's been assigned;
> it'll make the purpose a bit clearer.
> 
>> +	default:
>> +		name = "TPS6586X";
>> +		break;
>>  	}
> 
> I hope the rest of the code deals with unknown values of
> tps6586x->version OK.
>
Well, the tps6586x->version is not completly unknown, its something
valid which is returned by i2c_smbus_read_byte_data. According to the
data sheet this should be a 8-Bit value.

However, the patch should handle every version, since I tried to make
the change backward compatible: The driver now and then supports every
device version, just the default voltage table are applied if there are
no specific tables available.
