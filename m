From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Add PMC thermtrip programming to Jetson
 TK1 device tree
Date: Wed, 13 Aug 2014 11:06:14 +0300
Message-ID: <53EB1C76.2000702@nvidia.com>
References: <1407226380-747-1-git-send-email-mperttunen@nvidia.com> <1407226380-747-3-git-send-email-mperttunen@nvidia.com> <20140813073736.GB17466@ulmo> <53EB1932.9040601@nvidia.com> <20140813080324.GC7735@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140813080324.GC7735@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 13/08/14 11:03, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Wed, Aug 13, 2014 at 10:52:18AM +0300, Mikko Perttunen wrote:
>> On 13/08/14 10:37, Thierry Reding wrote:
>>>> Old Signed by an unknown key
>>>
>>> On Tue, Aug 05, 2014 at 11:12:59AM +0300, Mikko Perttunen wrote:
>>>> This adds the required information to reset the board during an overheating
>>>> situation to the Jetson TK1 device tree. The thermal reset is handled by the
>>>> PMC by sending an I2C message to the PMIC. The entries specify the I2C
>>>> message to be sent.
>>>>
>>>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
>>>> index 624b0fb..ee178c4 100644
>>>> --- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
>>>> +++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
>>>> @@ -1617,6 +1617,11 @@
>>>>   		nvidia,core-pwr-off-time = <61036>;
>>>>   		nvidia,core-power-req-active-high;
>>>>   		nvidia,sys-clock-req-active-high;
>>>> +
>>>> +		nvidia,thermtrip-pmu-i2c-addr = <0x40>;
>>>> +		nvidia,thermtrip-i2c-controller = <4>;
>>>> +		nvidia,thermtrip-reg-addr = <0x36>;
>>>> +		nvidia,thermtrip-reg-data = <0x2>;
>>>
>>> Given the number of properties that this can potentially have, I wonder
>>> if perhaps it would be a good idea to put this into a subnode, like
>>> this:
>>>
>>> 		thermtrip {
>>> 			pmu-i2c-addr = <0x40>;
>>> 			i2c-controller = <4>;
>>> 			...
>>> 		};
>>
>> I guess that'd look a bit nicer.
>
> Mind you, this may be somewhat on the edge of what's considered good
> practice for DT content, so maybe wait for a second opinion before going
> ahead with this.
>
> I don't have any objections to a set of nvidia,thermtrip-* properties, I
> just think it's fairly redundant to keep repeating that prefix (and it
> causes ugliness in drivers, too).

Hmm, ok. I'll fix the other stuff first.

>
> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>
