From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Thu, 11 Oct 2018 16:00:20 +0100
Message-ID: <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
 <20180906122436.25610-1-linus.walleij@linaro.org>
 <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Philipp Zabel <philipp.zabel@gmail.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, jacopo <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Russell King <rmk+kernel@armlinux.org.uk>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Linus,

On 11/10/18 10:29, Linus Walleij wrote:
> On Thu, Oct 11, 2018 at 11:01 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> 
>> I've just noticed that this patch causes regression on Samsung
>> Exynos4412-based Trats2 board. Conversion to GPIO descriptor breaks
>> operation when regulators used shared GPIO:  sii9234 i2c driver
>> is not able to get vcc33mhl regulator (it uses shared GPIO enable
>> line with vsil12 regulator).
> 
> So I guess this means that this physical GPIO line will enable the
> vcc33mhl and the vsil12 regulators at the same time?
> 
>> This issue has been already pointed in case of commits:
>> 37fa23dbccbd97663acc085bd79246f427e603a1
>> d1dae72fab2c377ff463742eefd8ac0f9e99b7b9
>> ab4d11e2c2329cf7cb7be31ff22489aae4dee5dc
> 
> A big sorry for my ignorance, I guess the information overload
> on the mailing list just makes me miss the important points.
> I'll try to be better, sadly I constantly fail to keep everything
> in mind and constantly break things like this.
> 
>> Maybe it would be better to first solve the handling of shared enable
>> GPIO in the descriptor-based interface before converting more regulators
>> and stepping into this issue again?
> 
> I am trying to solve it, but I just don't have systems to reproduce all
> kinds of things. It's a bit stressful since this is one of those runtime
> things that is hard to test when devising a patch for systems I don't
> have.

This also appears to be causing a regression on the Tegra124 Jetson TK1
that also uses a shared GPIO for two regulators. The 2nd regulator that
uses the GPIO now fails to probe [0] ...

[    0.680021] +5V_SATA: supplied by +5V_SYS
[    0.683964] reg-fixed-voltage: probe of regulators:regulator@14 failed with error -16

Not sure if you have one of these, but otherwise I can help test.

Cheers
Jon

[0] https://storage.kernelci.org/next/master/next-20181011/arm/tegra_defconfig/lab-baylibre-seattle/boot-tegra124-jetson-tk1.html 

-- 
nvpublic
