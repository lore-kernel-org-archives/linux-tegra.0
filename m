From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 11:25:28 +0100
Message-ID: <71e2a853-2f44-e2db-8e43-dcde9f6864db@nvidia.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
 <20180906122436.25610-1-linus.walleij@linaro.org>
 <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
 <CACRpkda+J6R99SQP9yFVH2HANJSi3M4GjT0duaHdv8wZcs7ahQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda+J6R99SQP9yFVH2HANJSi3M4GjT0duaHdv8wZcs7ahQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Philipp Zabel <philipp.zabel@gmail.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, jacopo <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Russell King <rmk+kernel@armlinux.org.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Linus,

On 11/10/18 18:45, Linus Walleij wrote:
> Hi Jon,
> 
> On Thu, Oct 11, 2018 at 5:00 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> 
>> This also appears to be causing a regression on the Tegra124 Jetson TK1
>> that also uses a shared GPIO for two regulators. The 2nd regulator that
>> uses the GPIO now fails to probe [0] ...
>>
>> [    0.680021] +5V_SATA: supplied by +5V_SYS
>> [    0.683964] reg-fixed-voltage: probe of regulators:regulator@14 failed with error -16
>>
>> Not sure if you have one of these, but otherwise I can help test.
> 
> Would be great if you could test the patch I came up with for Marek:
> https://marc.info/?l=linux-kernel&m=153926854327176&w=2

Yes works for me! I will respond to your actual patch as well with
tested-by.

Cheers
Jon

-- 
nvpublic
