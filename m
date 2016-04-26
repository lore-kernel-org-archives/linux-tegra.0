From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 4/9] phy: Add Tegra XUSB pad controller support
Date: Tue, 26 Apr 2016 15:44:43 +0200
Message-ID: <CACRpkdYRt4t+XrV_6Ac6VvNDsdNdsLZJDuW6aRR2u-rV-J=HtA@mail.gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
	<1457108379-20794-4-git-send-email-thierry.reding@gmail.com>
	<20160418114318.GC17716@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160418114318.GC17716@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 18, 2016 at 1:43 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, Mar 04, 2016 at 05:19:34PM +0100, Thierry Reding wrote:
>> -MODULE_LICENSE("GPL v2");
>> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_legacy_remove);
>
> Since this merely implements the binding change, does your Acked-by on
> the binding apply to this part as well?

Sure
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for missing to reply to this, have been swamped.

Basically I trust anything that you and Stephen agree on.

Yours,
Linus Walleij
