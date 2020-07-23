From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 23/23] MAINTAINERS: Add Krzysztof Kozlowski as maintainer
 of memory controllers
Date: Thu, 23 Jul 2020 10:12:36 -0700
Message-ID: <afee0362-e9b9-26da-04e2-136a8599bc79@gmail.com>
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-24-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20200723073744.13400-24-krzk@kernel.org>
Content-Language: en-US
Sender: linux-omap-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-tegra@vger.kernel.org

On 7/23/20 12:37 AM, Krzysztof Kozlowski wrote:
> The specific drivers in drivers/memory usually go via architecture (e.g.
> ARM SoC) maintainers but the generic parts (of_memory.[ch]) lacked any
> care.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

What does this mean for specific drivers? For instance I tend to send
updates to brcmstb_dpfe.c through the Broadcom ARM SoC pull requests,
shall I continue to do this, or are you going to send memory controller
subsystem pull requests including that file in the future?
-- 
Florian
