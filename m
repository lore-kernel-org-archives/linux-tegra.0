From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 0/6] Improvements for MAX77620 GPIO driver
Date: Thu, 16 Jul 2020 22:14:53 +0300
Message-ID: <c33c7f0d-cc0d-a9ba-dbd2-587c8cf9e2e8@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
 <CACRpkdZNLDgsrPRenyvPZD6A+Wvj-P3AJBf5Ke-uY9=R9DyjxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZNLDgsrPRenyvPZD6A+Wvj-P3AJBf5Ke-uY9=R9DyjxQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

16.07.2020 11:52, Linus Walleij пишет:
> On Thu, Jul 9, 2020 at 7:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> This series addresses a problem that I discovered on Nexus 7 device where
>> GPIO interrupts may be left enabled after bootloader and the driver isn't
>> prepared to this. It also makes a small improvements to the code, fixes the
>> non-released interrupt bug and converts driver to use irqchip template.
>>
>> Changelog:
>>
>> v4: - Added stable-tag to the patch "Fix missing release of interrupt".
> 
> This v4 series applied, thanks a *LOT* for your patient work on this!

Hello, Linus! Thank you for applying the patches!

> I need to fix the USB port on my Nexus 7 so I can test how the
> mainline support is working these days!

Please notice that this should be a Nexus 7 2012, which is NVIDIA
Tegra30-based Nexus 7.

The mainline support just starting to emerge for the 2012 model,
although not much is missed in the upstream. There are couple patches
currently under review which are necessary for Nexus 7 2012 in order to
make it ready for everyday use, like a tiny patch for the touchscreen
support and DRM bridges/panel orientation improvements for the Tegra DRM
driver. We're pretty close! :)
