From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: tegra: dts: add slink controller dt entry
Date: Fri, 19 Oct 2012 09:56:16 -0600
Message-ID: <50817820.6010301@wwwdotorg.org>
References: <1350557795-31487-1-git-send-email-ldewangan@nvidia.com> <1350557795-31487-3-git-send-email-ldewangan@nvidia.com> <50808595.8070505@wwwdotorg.org> <5081190D.50200@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5081190D.50200-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/19/2012 03:10 AM, Laxman Dewangan wrote:
> On Friday 19 October 2012 04:11 AM, Stephen Warren wrote:
>> On 10/18/2012 04:56 AM, Laxman Dewangan wrote:
>>> Add slink controller details in the dts file of
>>> Tegra20 and Tegra30.
>>> diff --git a/arch/arm/boot/dts/tegra20.dtsi
>>> b/arch/arm/boot/dts/tegra20.dtsi
>>> +    slink@7000d400 {
>>> +        compatible = "nvidia,tegra20-slink";
>>> +        reg =<0x7000d400 0x200>;
>>> +        interrupts =<0 59 0x04>;
>>> +        nvidia,dma-req-sel =<15>;
>

(Oh, you need a space before and after the = in all the lines above)

>> I thought the common DT DMA bindings were going to be in 3.7, and hence
>> we could just use them here rather than inventing another custom
>> property for this purpose?
>
> Adding Vinod here.
> 
> I looked the dma devicetree bingind document and did not found the
> generic binding name. Howvere, for arm-pl330.txt, it is explained as ...

That's not the generic bindings. I guess they didn't get merged then. I
guess we can continue with custom bindings until they are.
