From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V4 6/9] ARM: mxs: Provide regulator to pwm-backlight
Date: Tue, 19 Mar 2013 22:35:05 +0100
Message-ID: <201303192235.06137.marex@denx.de>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <201303192227.21717.marex@denx.de>
 <643E69AA4436674C8F39DCC2C05F7638629CD2FDF4@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F7638629CD2FDF4@HQMAIL03.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Chew <AChew@nvidia.com>
Cc: "romain.naour@openwide.fr" <romain.naour@openwide.fr>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "laforge@openezx.org" <laforge@openezx.org>, "openezx-devel@lists.openezx.org" <openezx-devel@lists.openezx.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "lost.distance@yahoo.com" <lost.distance@yahoo.com>, "drwyrm@gmail.com" <drwyrm@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Alex Courbot <acourbot@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-arm-kernel@lists.i
List-Id: linux-tegra@vger.kernel.org

Dear Andrew Chew,

> > Dear Andrew Chew,
> > 
> > > The pwm-backlight driver now takes a mandatory regulator that is
> > > gotten during driver probe.  Initialize a dummy regulator to satisfy
> > > this requirement.
> > > 
> > > Signed-off-by: Andrew Chew <achew@nvidia.com>
> > 
> > Do we really need a mandatory regulator? Why can't it be optional?
> > 
> > Best regards,
> > Marek Vasut
> 
> Because for those using board setup code (and not devicetree), it was
> not possible to distinguish between opting out of the regulator, and
> deferred probe, without adding something to the platform data that
> board setup code needed to fill in anyway.

Sure, but this adds a bit of overhead for the DT platforms, no?

Other than this curiosity, I have no problems with this stuff.

Best regards,
Marek Vasut
