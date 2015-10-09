From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Fri, 9 Oct 2015 11:20:53 +0100
Message-ID: <56179505.7020301@nvidia.com>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <56145369.7040404@wwwdotorg.org> <5614DB41.5080907@nvidia.com>
 <561543A2.2090402@wwwdotorg.org> <56154629.8080205@nvidia.com>
 <5615744E.2060209@wwwdotorg.org> <56163E33.4080303@nvidia.com>
 <56167D4D.2020404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56167D4D.2020404@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 08/10/15 15:27, Stephen Warren wrote:
> On 10/08/2015 03:58 AM, Jon Hunter wrote:

[snip]

>> That's fine. From my perspective I don't have a strong objection either
>> way, however, I can see that given that the name indicates rx or tx,
>> then the direction in the binding could be seen as redundant.
>>
>> So to confirm you are happy with the client bindings being as follows?
>>
>> tegra_admaif: admaif@0x702d0000 {
>>        ...
>>       dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>>              <&adma 3>, <&adma 3>, <&adma 4>, <&adma 4>,
>>              <&adma 5>, <&adma 5>, <&adma 6>, <&adma 6>,
>>              <&adma 7>, <&adma 7>, <&adma 8>, <&adma 8>,
>>              <&adma 9>, <&adma 9>, <&adma 10>, <&adma 10>;
>>       dma-names = "rx1", "tx1", "rx2", "tx2", "rx3", "tx3",
>>                   "rx4", "tx4", "rx5", "tx5", "rx6", "tx6",
>>                   "rx7", "tx7", "rx8", "tx8", "rx9", "tx9",
>>                   "rx10", "tx10";
>>       ...
>> };
> 
> Yes, that looks good for the client binding.

One more clarifying question ... should the xlate verify that no other
dma channel is using the same hardware request signal?

I understand that typically the xlate decodes the binding to get the
channel info, but because this is invoked by dmaengine while allocating
a channel, I was wondering if we should prevent dmaengine allocating
more than one channel to be used with the same hardware request? If so,
then passing the direction to the xlate would be necessary (so I can
determine in the xlate that no one else is currently using this, which
is what I currently do).

Alternatively, I could check that no one else is using the request
signal at a later when the transfer is being prepared.

If you are wondering why I am worried about this, I my mind I think that
the driver should be robust enough to check for conflicts in the request
signals used by the various channels.

Jon
