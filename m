From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V4 6/9] ARM: mxs: Provide regulator to pwm-backlight
Date: Tue, 19 Mar 2013 22:27:21 +0100
Message-ID: <201303192227.21717.marex@denx.de>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com> <1363719573-20926-7-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1363719573-20926-7-git-send-email-achew@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrew Chew <achew@nvidia.com>
Cc: romain.naour@openwide.fr, kgene.kim@samsung.com, drwyrm@gmail.com, stefan@openezx.org, laforge@openezx.org, philipp.zabel@gmail.com, lost.distance@yahoo.com, robert.jarzmik@free.fr, eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, kyungmin.park@samsung.com, gxt@mprc.pku.edu.cn, shawn.guo@linaro.org, linux@prisktech.co.nz, swarren@wwwdotorg.org, thierry.reding@avionic-design.de, acourbot@nvidia.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openezx-devel@lists.openezx.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Dear Andrew Chew,

> The pwm-backlight driver now takes a mandatory regulator that is gotten
> during driver probe.  Initialize a dummy regulator to satisfy this
> requirement.
> 
> Signed-off-by: Andrew Chew <achew@nvidia.com>

Do we really need a mandatory regulator? Why can't it be optional?

Best regards,
Marek Vasut
