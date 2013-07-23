From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra114: dalmore: fix the irq trigger type
 of Palmas MFD device
Date: Tue, 23 Jul 2013 11:15:12 -0700
Message-ID: <51EEC830.9000407@wwwdotorg.org>
References: <1374574191-24396-1-git-send-email-josephl@nvidia.com> <51EE968B.1050103@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51EE968B.1050103-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/23/2013 07:43 AM, Laxman Dewangan wrote:
> On Tuesday 23 July 2013 03:39 PM, Joseph Lo wrote:
>> The IRQ trigger type of Palmas MFD device (tps65913) is low-level
>> sensitive. The wrong configuration would cause an interrupt storm
>> when booting the system. Fixing it in DT with appropriate interrupt
>> type.

>> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts

>>           palmas: tps65913 {
>>               compatible = "ti,palmas";
>>               reg = <0x58>;
>> -            interrupts = <0 86 0x4>;
>> +            interrupts = <0 86 0x8>;
> 
> This fails as GIC does not support the interrupt flag of 8.
...
> I did not get the interrupt storm and even interrupt is not working on tot.
> Two ways to resolve this:
> - Change the interrupt flag to 0 from 4. Or
> - Remove the nvidia,invert-interrupt; for PMC node.

Yes, use the PMIC property please.
