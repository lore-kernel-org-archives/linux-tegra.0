From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Mon, 25 Jun 2012 09:36:42 -0600
Message-ID: <4FE8858A.5000700@wwwdotorg.org>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org> <4FE80413.6070001@nvidia.com> <4FE87FE3.1080608@wwwdotorg.org> <4FE882A5.3080504@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE882A5.3080504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/25/2012 09:24 AM, Laxman Dewangan wrote:
> On Monday 25 June 2012 08:42 PM, Stephen Warren wrote:
>> On 06/25/2012 12:24 AM, Laxman Dewangan wrote:
>>> On Saturday 23 June 2012 04:44 AM, Stephen Warren wrote:
>>>> From: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> Seaboard uses a TPS6586x regulator. Instantiate this, and hook up a
>>>> couple of fixed GPIO-controlled regulators too.
...
>>>> +                regulator@3 {
>>>> +                    reg =<3>;
>>>> +                    regulator-compatible = "ldo0";
>>>> +                    regulator-name = "vdd_ldo0";
>>>> +                    regulator-min-microvolt =<1250000>;
>>>> +                    regulator-max-microvolt =<3300000>;
>>>> +                    vin-supply =<&sm2_reg>;
>>> I think support for vin-supply is still not there for this regulator in
>>> driver.
>> That's also true. I wonder if we shouldn't support this in the regulator
>> core bindings instead, since the existence of a parent regulator seems
>> likely to be common. Either way, I'd like to include the property to
>> document it for now.
> 
> I had detailed discussion with Mark on  this support and as per him
> (based on my understanding), the input to different regulator is from
> the pin of the chips and so the name should be the <pin-name>-supply
> which should be part of chip-dt binding, not to the particular rail.

OK, that's fine. Can you please update the TPS6586x binding and driver
to allow this to be represented correctly then. Thanks.
