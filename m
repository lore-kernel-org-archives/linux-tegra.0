From: Markus Mayer <mmayer@broadcom.com>
Subject: Re: [PATCH 16/23] memory: brcmstb_dpfe: Constify the contents of string
Date: Thu, 23 Jul 2020 10:15:36 -0700
Message-ID: <CAGt4E5v3mbY_S2Q=Tq5ZKSY450weu9kFZ9R3bkJ1=3VPobZGsg@mail.gmail.com>
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-17-krzk@kernel.org>
 <b9519b7f-9cf0-3715-bca9-05905035eada@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <b9519b7f-9cf0-3715-bca9-05905035eada@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg
List-Id: linux-tegra@vger.kernel.org

On Thu, 23 Jul 2020 at 10:11, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> > The string itself can be made const for safety.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Markus Mayer <mmayer@broadcom.com>
