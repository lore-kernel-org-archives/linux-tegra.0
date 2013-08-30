From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 0/5] ARM: tegra: support for Trusted Foundations
Date: Fri, 30 Aug 2013 10:23:03 +0200
Message-ID: <13779002.NFLbqBjPSE@flatron>
References: <1377770268-14014-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377770268-14014-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dave Martin <Dave.Martin@arm.com>, gnurou@gmail.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Alexandre,

On Thursday 29 of August 2013 18:57:43 Alexandre Courbot wrote:
> New version revised according to comments received for v3. Hopefully
> it will be good enough to be merged.
> 
> Changes since v3:
> - Added of_register_trusted_foundations() function to avoid duplicate
>   device tree parsing code in arch files
> - Added ability to initialize Trusted Foundations through platform data
> - Changed TF version number to integers
> - Refactored Kconfig menu for more clarity

Except some minor comments to patch 1/5, the series looks good to me.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
