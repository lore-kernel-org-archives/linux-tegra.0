From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V5 3/9] ARM: pxa: Provide regulator to pwm-backlight
Date: Thu, 28 Mar 2013 15:47:32 +0100
Message-ID: <201303281547.32895.marex@denx.de>
References: <1364260913-25490-1-git-send-email-achew@nvidia.com> <1364260913-25490-4-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1364260913-25490-4-git-send-email-achew@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrew Chew <achew@nvidia.com>
Cc: romain.naour@openwide.fr, kgene.kim@samsung.com, drwyrm@gmail.com, stefan@openezx.org, laforge@openezx.org, philipp.zabel@gmail.com, lost.distance@yahoo.com, robert.jarzmik@free.fr, eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, kyungmin.park@samsung.com, gxt@mprc.pku.edu.cn, shawn.guo@linaro.org, linux@prisktech.co.nz, thierry.reding@avionic-design.de, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openezx-devel@lists.openezx.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Dear Andrew Chew,

> The pwm-backlight driver now takes a mandatory regulator that is gotten
> during driver probe.  Initialize a dummy regulator to satisfy this
> requirement.
> 
> Signed-off-by: Andrew Chew <achew@nvidia.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Looks reasonable. Add my

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
