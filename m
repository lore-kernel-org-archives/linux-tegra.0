From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 04/31] ARM: tegra: update DT files to add reset properties
Date: Tue, 03 Dec 2013 11:59:42 -0700
Message-ID: <529E2A1E.1000307@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-5-git-send-email-swarren@wwwdotorg.org> <20131129130031.GQ22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129130031.GQ22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 06:00 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:53:59PM -0700, Stephen Warren wrote:
...
>> @@ -110,6 +118,8 @@ reg = <0x54080000 0x00040000>; interrupts =
>> <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>; clocks = <&tegra_car
>> TEGRA30_CLK_VI>; +			resets = <&tegra_car 164>;
> 
> I think this needs to be 20.

Yes, I've fixed that to be 20 in both tegra20.dtsi and tegra30.dtsi in
this patch.
