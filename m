From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4 8/9] ARM: tegra: Provide regulator to pwm-backlight
Date: Thu, 21 Mar 2013 14:01:54 -0600
Message-ID: <514B6732.7020107@wwwdotorg.org>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com> <1363719573-20926-9-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1363719573-20926-9-git-send-email-achew@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrew Chew <achew@nvidia.com>
Cc: romain.naour@openwide.fr, kgene.kim@samsung.com, drwyrm@gmail.com, stefan@openezx.org, laforge@openezx.org, philipp.zabel@gmail.com, lost.distance@yahoo.com, marek.vasut@gmail.com, robert.jarzmik@free.fr, eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, kyungmin.park@samsung.com, gxt@mprc.pku.edu.cn, shawn.guo@linaro.org, linux@prisktech.co.nz, thierry.reding@avionic-design.de, acourbot@nvidia.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openezx-devel@lists.openezx.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 12:59 PM, Andrew Chew wrote:
> The pwm-backlight driver now takes a mandatory regulator that is gotten
> during driver probe.  Initialize a dummy regulator to satisfy this
> requirement.

I assume these patches will get merged through the PWM tree? If so,
Acked-by: Stephen Warren <swarren@nvidia.com>
