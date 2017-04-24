From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: xusb: Silence sparse warnings
Date: Mon, 24 Apr 2017 18:36:32 +0200
Message-ID: <CACRpkdYYnUGbCs-9bE6FpWf6Oc2vORbyMtQphZdXQS00HFHx9w@mail.gmail.com>
References: <20170424115649.17424-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424115649.17424-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 24, 2017 at 1:56 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Commit 53d2a715c240 ("phy: Add Tegra XUSB pad controller support") added
> a new driver for the XUSB pad controller that implements a more flexible
> devicetree binding. In order to preserve backwards compatibility the old
> driver can be probed if the obsolete bindings are detected.
>
> In order to hide the legacy code, these prototypes were defined in a
> header private to the new driver. This has the disadvantage of making
> the sparse code checker complain about the missing declarations when
> compiling the old driver and suggesting to make the functions static.
>
> Avoid these sparse warnings by adding local prototype declarations into
> the compatibility driver.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch applied.

Yours,
Linus Walleij
