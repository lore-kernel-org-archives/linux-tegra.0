From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 3/5] memory: tegra: Changes for v4.16-rc1
Date: Thu, 21 Dec 2017 18:07:09 +0100
Message-ID: <CAK8P3a1aJSoty8DqKwpuy7-cFR3fAu3nHRvzrvqz3X5fMgbJZQ@mail.gmail.com>
References: <20171220191900.757-1-thierry.reding@gmail.com> <20171220191900.757-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220191900.757-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 20, 2017 at 8:18 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ----------------------------------------------------------------
> memory: tegra: Changes for v4.16-rc1
>
> The Tegra memory controller driver will now instruct the SMMU driver to
> create groups, which will make it easier for device drivers to share an
> IOMMU domain between multiple devices.
>
> Initial Tegra186 support is also added in a separate driver.

Pulled into next/drivers.

      Arnd
