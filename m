From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/5] ARM: DT: tegra114:add aliases and DMA requestor
 for serial controller
Date: Mon, 11 Mar 2013 11:42:47 -0600
Message-ID: <513E1797.4010808@wwwdotorg.org>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com> <1362852678-13421-4-git-send-email-ldewangan@nvidia.com> <20130310224219.GG4743@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130310224219.GG4743-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/10/2013 04:42 PM, Thierry Reding wrote:
> On Sat, Mar 09, 2013 at 11:41:16PM +0530, Laxman Dewangan wrote: 
> [...]
>> diff --git a/arch/arm/boot/dts/tegra114.dtsi 
>> b/arch/arm/boot/dts/tegra114.dtsi
> [...]
>> @@ -99,38 +106,50 @@ 0x70003000 0x40c>;	/* Mux registers */ };
>> 
>> -	serial@70006000 { +	/* +	 * There are two serial driver i.e. 
>> 8250 based simple serial +	 * driver and APB DMA based serial 
>> driver for higher baudrate +	 * and performace. To enable the 
>> 8250 based driver, the compatible +	 * is
>> "nvidia,tegra114-uart", "nvidia,tegra20-uart" and to enable +	 *
>> the APB DMA based serial driver, the comptible is +	 *
>> "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart". +	 */ +	uarta:
>> serial@70006000 {
> 
> I'm not sure if this is a good place for this comment. Perhaps it 
> should go into the binding documentation?

It is at least consistent with previous tegra20/30.dtsi. The two
compatible values are separate bindings, so a clue here re: which one
to go look at isn't a bad idea, although I agree that having each
binding document mention the other one would also be good.
