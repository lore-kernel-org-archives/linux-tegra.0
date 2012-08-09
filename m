From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] ARM: dt: tegra: ventana: add regulators
Date: Thu, 09 Aug 2012 09:15:13 -0600
Message-ID: <5023D401.20303@wwwdotorg.org>
References: <1344017356-29352-1-git-send-email-swarren@wwwdotorg.org> <5023A716.50807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5023A716.50807-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/09/2012 06:03 AM, Laxman Dewangan wrote:
> On Friday 03 August 2012 11:39 PM, Stephen Warren wrote:
>> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Ventana uses a TPS6586x regulator. Instantiate this, and hook up a
>> couple of fixed GPIO-controlled regulators too.
>>
>> The data was chosen to match the PMIC HW defaults, with the following
>> exception:
>>
>> ldo6: The HW default is 2.85v. The schematics are unlabelled. Internal
>> research indicates that 1.8v is correct. Our downstream kernel also uses
>> 1.8v.
>>
>> Portions based on work by Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
...
> 
> Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> You can addd my ACK for harmony dts file.

There is no Harmony patch; just Paz00, Ventana, Seaboard. I assume you
meant to ack Seaboard as well, not Harmony?
