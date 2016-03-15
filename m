From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 2/9] dt-bindings: pinctrl: Deprecate Tegra XUSB pad
 controller binding
Date: Tue, 15 Mar 2016 10:01:25 +0100
Message-ID: <CACRpkda_YvQQesSUiZB0cpotZWyyd+5nUqzz3HjnY9fCanWJwQ@mail.gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
	<1457108379-20794-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457108379-20794-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 4, 2016 at 5:19 PM, Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> This is an old version of the binding that isn't flexible enough to
> describe all aspects of the XUSB pad controller. Specifically with the
> addition of XUSB support (for SuperSpeed USB) the existing binding is
> no longer suitable.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

That's unfortunate, not to say unelegant. I want to know Stephen's
opinion on these patches (probably they are in another mail)
before merging.

Will the new binding also work with SuperDuperSpeed USB and
SuperSuperMegaUltraOrtonSpeed USB I wonder... or will we
change the bindings again?

Yours,
Linus Walleij
