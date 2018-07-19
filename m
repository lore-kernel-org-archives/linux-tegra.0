From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM: tegra: apalis-tk1: Fix SPDX license identifier format
Date: Thu, 19 Jul 2018 08:53:55 +0200
Message-ID: <CAJKOXPfKunyOqYA8vNjN71K92=FW4vcTjdcz9TQ8mHdFJL7VKQ@mail.gmail.com>
References: <20180718194824.3704-1-krzk@kernel.org> <1531946245.26473.2.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531946245.26473.2.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "stefan@agner.ch" <stefan@agner.ch>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dev@lynxeye.de" <dev@lynxeye.de>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "pombredanne@nexb.com" <pombredanne@nexb.com>
List-Id: linux-tegra@vger.kernel.org

On 18 July 2018 at 22:37, Marcel Ziswiler <marcel.ziswiler@toradex.com> wrote:
> On Wed, 2018-07-18 at 21:48 +0200, Krzysztof Kozlowski wrote:
>> Fix incorrect format used for OR clause in SPDX license identifier.
>
> Can you please elaborate how you got to that conclusion as there are
> various other device trees having it specified the exact same way. Plus
> I was actually even in discussion with Philippe on that patch set back
> when I introduced those.

Hi,

I thought these were pointed by checkpatch but it was my mistake -
checkpatch complained about missing SPDX in tegra124-apalis.dtsi, not
about these files. Maybe I was mislead by the in-kernel example [1]...
although SPDX specification uses them so I think this patch can be
abandoned.

[1] https://elixir.bootlin.com/linux/v4.18-rc5/source/Documentation/process/license-rules.rst#L130

Best regards,
Krzysztof
