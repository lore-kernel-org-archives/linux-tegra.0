From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v4 02/11] ARM: tegra: Move out nyan-generic parts out from
 the nyan-big DT
Date: Thu, 12 Feb 2015 08:54:18 -0800
Message-ID: <CAL1qeaFaH4pBqOR_TKdsRLJG-_40k9X1+PFuSCd+3Tph4gQE2Q@mail.gmail.com>
References: <1423667220-1062-1-git-send-email-tomeu.vizoso@collabora.com>
	<1423667220-1062-3-git-send-email-tomeu.vizoso@collabora.com>
	<CAL1qeaHeB6vikVWquGM7psdKPKc0FVqj5-xuc3PXbJhok1vGoA@mail.gmail.com>
	<54DC45C7.8020907@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54DC45C7.8020907@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 11, 2015 at 10:18 PM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
> On 02/11/2015 06:26 PM, Andrew Bresticker wrote:
>> Hi Tomeu,
>>
>> On Wed, Feb 11, 2015 at 7:06 AM, Tomeu Vizoso
>> <tomeu.vizoso@collabora.com> wrote:
>>> In preparation for adding the DT for the nyan-blaze board.
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>
>> Maybe it's worth pulling the common pinmux bits into nyan.dtsi as well?
>
> I decided to have them in the leaf DTSs so the whole output from
> tegra-pinmux-scripts can be stuck in there without any extra processing.
>
> I think this way we can be more certain that the pinmux in the kernel
> isn't diverging from what it should be.

Ok, that makes sense to me.  Thanks.
