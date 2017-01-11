From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: core: Don't use regulators as supplies until
 the parent is bound
Date: Wed, 11 Jan 2017 16:57:18 +0000
Message-ID: <5d9b2cf5-55ef-f389-3381-da101bda7db5@nvidia.com>
References: <1484046069-7893-1-git-send-email-jonathanh@nvidia.com>
 <20170110165717.7dfxoyajc5p2h5mr@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110165717.7dfxoyajc5p2h5mr-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 10/01/17 16:57, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Jan 10, 2017 at 11:01:09AM +0000, Jon Hunter wrote:
> 
>> +++ b/drivers/regulator/core.c
>> @@ -1553,6 +1553,11 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>>  		}
>>  	}
>>  
>> +	if (r->dev.parent && !device_is_bound(r->dev.parent)) {
>> +		put_device(&r->dev);
>> +		return -EPROBE_DEFER;
>> +	}
>> +
> 
> I realised earlier that this will trigger when the supply and the
> consumer are part of the same PMIC which will cause issues as that's a
> fairly common setup and won't be resolved by deferring.  Can you please
> modify this to only defer if the parent is not the same as the parent of
> the regulator we're currently resolving?  Sorry, should've thought of
> this yesterday.

OK, no problem. Will send out an update shortly.

Cheers
Jon

-- 
nvpublic
