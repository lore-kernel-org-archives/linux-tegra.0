From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 17/23] memory: brcmstb_dpfe: Remove unneeded braces
Date: Thu, 23 Jul 2020 10:11:19 -0700
Message-ID: <e65d4ed3-3c01-acb7-f324-be99201815df@gmail.com>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-18-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20200723073744.13400-18-krzk@kernel.org>
Content-Language: en-US
Sender: linux-omap-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-tegra@vger.kernel.org

On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> Single statement blocks don't need braces.  Fixes checkpatch warning:
> 
>     WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
