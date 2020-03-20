From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
Date: Fri, 20 Mar 2020 20:37:48 +0100
Message-ID: <CACRpkdY7LnyHdX4xKrr1V8Cquched0PMNL1sFTrWT6J3fdRx=w@mail.gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> This series of patches establishes the mapping of these two pins to
> their GPIO equivalents and implements the code necessary to switch
> between SFIO and GPIO modes when the kernel requests or releases the
> GPIOs, respectively.

Is it possible to apply the gpio and pinctrl patches to
each tree separately?

Yours,
Linus Walleij
