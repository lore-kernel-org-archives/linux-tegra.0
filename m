From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH V4 0/9] Add mandatory regulator for all users of
 pwm-backlight.
Date: Wed, 20 Mar 2013 10:14:44 +0800
Message-ID: <20130320021442.GB20443@S2101-09.ap.freescale.net>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363719573-20926-1-git-send-email-achew@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Andrew Chew <achew@nvidia.com>
Cc: romain.naour@openwide.fr, kgene.kim@samsung.com, drwyrm@gmail.com, stefan@openezx.org, laforge@openezx.org, philipp.zabel@gmail.com, lost.distance@yahoo.com, marek.vasut@gmail.com, robert.jarzmik@free.fr, eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, kyungmin.park@samsung.com, gxt@mprc.pku.edu.cn, linux@prisktech.co.nz, swarren@wwwdotorg.org, thierry.reding@avionic-design.de, acourbot@nvidia.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openezx-devel@lists.openezx.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 19, 2013 at 11:59:24AM -0700, Andrew Chew wrote:
> Many backlights are enabled via GPIO.  We can generalize the GPIO to a
> fixed regulator.
> 
I think we should push the series of "Runtime Interpreted Power
Sequences" moving forward, which should be useful this case and many
other cases as well.

http://thread.gmane.org/gmane.linux.kernel/1395912

Shawn
