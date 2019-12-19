From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: tegra: Use generic
 readl_relaxed/writel_relaxed accessors
Date: Thu, 19 Dec 2019 19:34:01 +0300
Message-ID: <e6a67fa4-977d-bac9-f7c0-51d5cea526e5@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
 <20191215183047.9414-2-digetx@gmail.com>
 <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
 <b38cd167-4a61-4903-cf44-910dcb66f751@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b38cd167-4a61-4903-cf44-910dcb66f751@codethink.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

19.12.2019 18:57, Ben Dooks пишет:
> On 19/12/2019 11:01, Bartosz Golaszewski wrote:
>> niedz., 15 gru 2019 o 19:31 Dmitry Osipenko <digetx@gmail.com>
>> napisał(a):
>>>
>>> There is no point in using old-style raw accessors, the generic
>>> accessors
>>> do the same thing and also take into account CPU endianness. Tegra
>>> SoCs do
>>> not support big-endian mode in the upstream kernel, but let's switch
>>> away
>>> from the outdated things anyway, just to keep code up-to-date.
> 
> Good idea, I think I got most of the way to booting a tegra jetson board
> with a big endian image a few years ago, but never got time to finish
> the work.
> 

Thanks, I remember yours effort in regards to the upstreaming big endian
support for Jetson :) You were pretty close back then, but Thierry had a
different opinion in regards to maintaining that support in terms of
having extra testing burden.
