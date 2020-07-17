From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 6/7] ARM: tegra: Default configuration changes for v5.9-rc1
Date: Fri, 17 Jul 2020 21:24:07 +0200
Message-ID: <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com> <20200717161300.1661002-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200717161300.1661002-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ARM: tegra: Default configuration changes for v5.9-rc1
>
> Enables a few new configuration options that are useful on the new Nexus
> 7 and Acer A500 devices, as well as the userspace CPU frequency governor
> that's mainly used for testing.

I've pulled all the other branches, but I'm a little bit wary about
this one since
Dmitry's patch enables a number of options that would increase the kernel
size, and I see no indication that it has been reviewed by anyone else.

I think the changes all make sense, but I would prefer to have a wider
audience for that patch and get some Acks. If you like, you can send the
tegra specific changes in a new pull request in the meantime, and then
send the remaining additions to the usual suspects as an RFC, with
Cc:soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, so I can apply it later if everyone is happy enough
with it.

      Arnd
