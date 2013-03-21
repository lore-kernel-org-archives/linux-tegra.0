From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/4] ARM: tegra: dalmore: add cpu regulator node
Date: Thu, 21 Mar 2013 11:30:45 -0600
Message-ID: <514B43C5.6060404@wwwdotorg.org>
References: <1363873663-19272-1-git-send-email-ldewangan@nvidia.com> <1363873663-19272-2-git-send-email-ldewangan@nvidia.com> <514B1412.9060707@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <514B1412.9060707-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 08:07 AM, Sergei Shtylyov wrote:
> Hello.
> 
> On 21-03-2013 17:47, Laxman Dewangan wrote:
> 
>> Dalmore uses the TPS51632 as CPU regulator. The device is connected
>> on I2C5.
> 
>> Add DT node for TPS51632.

>> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts

>> +    i2c@7000d000 {
>> +        status = "okay";
>> +        clock-frequency = <400000>;
>> +
>> +        tps51632 {
> 
>    Should be named "tps51632@43" I think.

The unit-address (i.e. "@43" part) of the node name is typically omitted
if it isn't required to make the node name unique.
