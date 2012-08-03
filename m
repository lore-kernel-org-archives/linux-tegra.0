From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: paz00: add regulators
Date: Fri, 03 Aug 2012 12:49:12 -0600
Message-ID: <501C1D28.60804@wwwdotorg.org>
References: <1343932593-999-1-git-send-email-swarren@wwwdotorg.org> <501C1944.4030505@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <501C1944.4030505-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/03/2012 12:32 PM, Laxman Dewangan wrote:
> On Friday 03 August 2012 12:06 AM, Stephen Warren wrote:
>> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The Toshiba AC100/PAZ00 uses a TPS6586x regulator. Instantiate this.
...
> Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks.

>> +    regulators {
>> +        compatible = "simple-bus";
>> +        #address-cells =<1>;
>> +        #size-cells =<0>;
>> +
> 
> Is "simple-bus" accepted?
> Accordingly I need to update for the Cardhu  also to have regulator
> support which I am going to send.

I believe so yes; the ability to use that bus type was the specific
purpose of:

https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-August/017963.html

... which Rob seems to find acceptable.
