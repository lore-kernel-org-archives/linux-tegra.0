From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
Date: Fri, 27 Mar 2020 11:39:00 +0100
Message-ID: <CACRpkdZ1vN1Rv-jfGZNGU3saxGXDhKj=2ptm-zpk3mb=rXmuMA@mail.gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The GG.0 and GG.1 GPIOs serve as CLKREQ and RST pins, respectively, for
> PCIe controller 5 on Tegra194. When this controller is configured in
> endpoint mode, these pins need to be used as GPIOs by the PCIe endpoint
> driver. Typically the mode programming of these pins (GPIO vs. SFIO) is
> performed by early boot firmware to ensure that the configuration is
> consistent.
>
> However, the GG.0 and GG.1 pins are part of a special power partition
> that is not enabled during early boot, and hence the early boot firmware
> cannot program these pins to be GPIOs (they are SFIO by default). Adding
> them as pin ranges for the pin controller allows the pin controller to
> be involved when these pins are requested as GPIOs and allows the proper
> programming to take place.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Patch applied!

Yours,
Linus Walleij
