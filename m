From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 4/5] ARM: dt: tegra30.dtsi: Add audio-related nodes
Date: Tue, 10 Apr 2012 23:28:19 -0600
Message-ID: <4F851673.6030000@wwwdotorg.org>
References: <1334099980-19527-1-git-send-email-swarren@wwwdotorg.org> <1334099980-19527-4-git-send-email-swarren@wwwdotorg.org> <CAOesGMhDDenRK_GeR=jWJbcoacRMUPnjFu5w4DCyUWC=CadnbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhDDenRK_GeR=jWJbcoacRMUPnjFu5w4DCyUWC=CadnbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/10/2012 10:27 PM, Olof Johansson wrote:
...
> On Tue, Apr 10, 2012 at 4:19 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add nodes for the Tegra30 AHUB and I2S controllers.
...
>> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
...
>> +       ahub@70080000 {
> 
> No need for unit address here since there's only one node with this
> name -- "ahub {"  is sufficient.

Is there actually a benefit from leaving it out though?

>> +               compatible = "nvidia,tegra30-ahub";
>> +               reg = <0x70080000 0x200 0x70080200 0x100>;
> 
> Why not just use 0x70080000 0x300?

The register space is logically divided into two chunks; the first for
the DMA FIFOs and the second for the AHUB routing registers. Future
chips may change the relative positions and sizes of these two chunks,
hence I figured it was best to model them independently even though
they're contiguous in Tegra30.
