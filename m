From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] regulator: palmas: fix pdata ptr not be updated after
 it has been allocated
Date: Wed, 24 Jul 2013 10:20:24 -0700
Message-ID: <51F00CD8.9000601@wwwdotorg.org>
References: <1374683282-17517-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374683282-17517-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/24/2013 09:28 AM, Rhyland Klein wrote:
> The pmic platform data wasn't updated to dev.platform_data after it had
> been allocated. That can cause the driver crash when using it.
> This patch fixes the issue.
> 
> We need to update the pdata pointer at the end of probe because if
> probe should fail for some reason, for instance if an in-supply
> isn't ready yet, then probe will defer. However, the pdata is allocated
> with devm, and so is freed when probe is deferred.

This looks wrong. If the module is removed and re-probed, then the pdata
pointer will still be set to a stale (free'd) value and hence not
re-allocated, but it will still be used.

This function shouldn't save the pdata in dev.platform_data, but rather
some data structure that has the same scope as probe()..remove(), for
example as a field in the drvdata struct, as set by dev_set_drvdata().
