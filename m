From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v1 3/3] ARM: tegra: Add gpio-ranges property
Date: Wed, 08 Jul 2015 14:55:18 -0600
Message-ID: <559D8E36.50209@wwwdotorg.org>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com> <1435754753-31307-4-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435754753-31307-4-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 07/01/2015 06:45 AM, Tomeu Vizoso wrote:
> Specify how the GPIOs map to the pins in Tegra SoCs, so the dependency is
> explicit.
>
> This currently will add a duplicated entry in the map from pins to gpios
> in the pinmux controller but it should be harmless and will be fixed in a
> later commit.

Isn't it in an earlier commit now (patch 2/3)? :-)

At a quick glance, I think this approach will be fine, so the series,
Acked-by: Stephen Warren <swarren@nvidia.com>
