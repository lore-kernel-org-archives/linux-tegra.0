From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Wed, 09 Mar 2011 09:41:23 +0200
Message-ID: <4D772F23.70304@compulab.co.il>
References: <cover.1299588456.git.mike@compulab.co.il> <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike@compulab.co.il> <20110308131541.GB5892@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110308131541.GB5892-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/11 15:15, Mark Brown wrote:
> On Tue, Mar 08, 2011 at 02:58:58PM +0200, Mike Rapoport wrote:
> 
>> +static struct regulator_consumer_supply tps658621_ldo2_supply[] = {
>> +	REGULATOR_SUPPLY("vdd_rtc", NULL),
>> +};
> 
> I feel sure that some of these could be using a struct device, though
> since they're probably all going to be required to be always on I'd
> expect it's not useful to have them mapped as supplies at all and the
> drivers could just assume they were there.

I'd prefer to keep it as is for now and update the supplies when merging the
drivers that actually use them.

>> +#define REGULATOR_INIT(_id, _minmv, _maxmv)				\
>> +	{								\
> 
> This should be namespaced, someone might add a generic macro with that
> name.

Ok, will fix.

-- 
Sincerely yours,
Mike.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
