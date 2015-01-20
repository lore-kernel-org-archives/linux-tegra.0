From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v2 02/11] ARM: tegra: Use the generated pinmux data
Date: Tue, 20 Jan 2015 14:59:43 +0100
Message-ID: <CAAObsKAaanrrSYd7gmLAS4K_G9fuU=WmsMXQk0G85hfy_XdE5Q@mail.gmail.com>
References: <1421338359-27467-1-git-send-email-tomeu.vizoso@collabora.com>
 <1421338359-27467-3-git-send-email-tomeu.vizoso@collabora.com> <54B7F7F7.1020202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54B7F7F7.1020202@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Dylan Reid <dgreid@chromium.org>, Simon Glass <sjg@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 15 January 2015 at 18:25, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 01/15/2015 09:12 AM, Tomeu Vizoso wrote:
>>
>> Google has submitted a board config for the pinmux programming of the
>> Nyan Big board. Use the whole of it as it's generated to make it easier
>> to update as the configuration gets fixed in the future.
>
>
> Submitted to where? I assume you mean tegra-pinmux-scripts. I don't see a
> Nyan/Nyan-big configuration there yet. IIRC (and I might not) one was
> posted, but there were some review comments that aren't yet addressed?

Yeah, that's what I meant by submitted. TTBOMK the v2 doesn't have any
comments pending of being addressed?

I have just sent a pinmux config file for the blaze that just changes
the configuration of usb_vbus_en0, usb_vbus_en1 and dp_hpd pins.

Regards,

Tomeu
