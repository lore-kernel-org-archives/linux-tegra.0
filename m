From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] ARM: tegra114: add speedo-based process identification
Date: Tue, 19 Mar 2013 11:54:13 -0600
Message-ID: <5148A645.9020009@wwwdotorg.org>
References: <1363605454-24176-1-git-send-email-dahuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363605454-24176-1-git-send-email-dahuang@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Danny Huang <dahuang@nvidia.com>
Cc: linux@arm.linux.org.uk, josephl@nvidia.com, pgaikwad@nvidia.com, ldewangan@nvidia.com, hdoyu@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 05:17 AM, Danny Huang wrote:
> Add speedo-based process identifictaion for Tegra114.

I have applied this to Tegra's for-3.10/soc branch, with one addition below:

> diff --git a/arch/arm/mach-tegra/tegra114_speedo.c b/arch/arm/mach-tegra/tegra114_speedo.c

> +#include <linux/kernel.h>

Here, I also added:

#include <linux/bug.h>

That's not needed in the Tegra for-next branch (which is based on
3.9-rc1), but is needed when merged into linux-next, and hence will
presumably be needed once this is submitted into 3.10.
