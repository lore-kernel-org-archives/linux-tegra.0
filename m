From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 18/23] memory: mtk-smi: Add argument to function
 definition
Date: Thu, 23 Jul 2020 10:55:33 +0200
Message-ID: <20200723085533.GA25935@kozik-lap>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-19-krzk@kernel.org>
 <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, linux-omap <linux-omap@vger.kernel.org>"open list:TEGRA ARCHITECTURE SUPPORT" <li>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 10:50:08AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Fix checkpatch warning:
> >     WARNING: function definition argument 'struct device *' should also have an identifier name
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Is this a bug in checkpatch? I don't see why it should warn about this,
> as there is no function definition here.
> 
> Your change is clearly harmless, but I wonder if we should fix
> checkpatch instead.

Good point. If this were not a warning, I would ignore it. However still
the common practice is to add arguments to such type definitions as it
helps to describe the type.

Best regards,
Krzysztof
