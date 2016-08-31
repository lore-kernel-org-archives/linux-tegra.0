From: Mirza Krak <mirza.krak@gmail.com>
Subject: Re: [PATCH v2 0/6] Add support for Tegra GMI bus controller
Date: Wed, 31 Aug 2016 11:23:13 +0200
Message-ID: <CALw8SCXgKcRPk8qk9GqPiL6sJV6gRt93eFHfxFHj3WJZNHgv7w@mail.gmail.com>
References: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com> <1472569295.5703.20.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472569295.5703.20.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger>
List-Id: linux-tegra@vger.kernel.org

Hi Marcel.

2016-08-30 17:01 GMT+02:00 Marcel Ziswiler <marcel.ziswiler@toradex.com>:
> Hi Mirza
>
> Sorry, I long since wanted to give you some feedback on this as well.
>
> BTW: Thank you very much for taking this on!

It has been and still is a fun project. So gladly doing it.
>
> On Wed, 2016-08-24 at 15:37 +0200, Mirza Krak wrote:
>> From: Mirza Krak <mirza.krak@gmail.com>
>>
>> Hi.
>>
>> This is a follow up to my previous RFC to add support for Tegra GMI
>> bus
>> controller.
>>
>> I have tested this series on a Tegra30 using a Colibri T30 SOM on a
>> custom
>> carrier board which has multiple CAN controllers (SJA1000) connected
>> to the
>> GMI bus.
>
> We once did a nice GMI-Memory Board which mates with the extension
> connector X3 of our V3.x Colibri Evaluation boards and allows testing
> SRAM access not only in muxed but also in non-muxed mode albeit 16-bit
> only. I took your driver for a spin both on Colibri T20 as well as
> Colibri T30 both in muxed as well as non-muxed mode and it passed all
> tests being both manual devmem2 type reads/writes as well as memtester
> runs on the full 128K SRAM giving it the physical address using the -p
> argument.
>
> So you may add the following to the whole series:
>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board

Thank you very much for testing. Will add your tags in the upcoming V3.

Best Regards
Mirza
