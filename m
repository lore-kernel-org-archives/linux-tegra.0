From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 03/31] ARM: tegra: document use of standard DMA DT bindings
Date: Sun, 01 Dec 2013 12:09:51 -0700
Message-ID: <529B897F.1010101@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-4-git-send-email-swarren@wwwdotorg.org> <20131129122907.GP22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131129122907.GP22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2013 05:29 AM, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:53:58PM -0700, Stephen Warren wrote: 
> [...]
>> diff --git
>> a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
>> b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
>>
>> 
index 2b6817f6e40e..eaf00102d92c 100644
>> ---
>> a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
>>
>> 
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
>> @@ -4,14 +4,17 @@ Required properties: - compatible :
>> "nvidia,tegra20-ac97" - reg : Should contain AC97 controller
>> registers location and length - interrupts : Should contain AC97
>> interrupt -- clocks : Must contain one entry, for the module
>> clock. -  See ../clocks/clock-bindings.txt for details. - resets
>> : Must contain an entry for each entry in reset-names. See
>> ../reset/reset.txt for details. - reset-names : Must include the
>> following entries: - ac97 -- nvidia,dma-request-selector : The
>> Tegra DMA controller's phandle and -  request selector for the
>> AC97 controller +- dmas : Must contain an entry for each entry in
>> clock-names. +  See ../dma/dma.txt for details. +- dma-names :
>> Must include the following entries: +  - rx +  - tx +- clocks :
>> Must contain one entry, for the module clock. +  See
>> ../clocks/clock-bindings.txt for details.
> 
> Was this unintentionally moved?

IIRC, at the end of the series, each binding describes reg,
interrupts, clocks, reset, dmas in that order, for consistency.

>> diff --git
>> a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
>> b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
>>
>> 
index e144f144717f..bdf08e6dec9b 100644
>> ---
>> a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
>>
>> 
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
>> @@ -4,14 +4,17 @@ Required properties: - compatible : should be
>> "nvidia,tegra20-sflash". - reg: Should contain SFLASH registers
>> location and length. - interrupts: Should contain SFLASH
>> interrupts. -- nvidia,dma-request-selector : The Tegra DMA
>> controller's phandle and -  request selector for this SFLASH
>> controller. - clocks : Must contain one entry, for the module
>> clock.
> 
> But then this doesn't move it... perhaps it really is accidental
> in other places. =)

The patch to that file does move the docs for the dmas property...
