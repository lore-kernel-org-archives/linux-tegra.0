From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH V4 0/9] Add mandatory regulator for all users of
 pwm-backlight.
Date: Wed, 20 Mar 2013 11:08:09 +0800
Message-ID: <20130320030806.GA26941@S2101-09.ap.freescale.net>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <20130320021442.GB20443@S2101-09.ap.freescale.net>
 <51491DF0.10408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51491DF0.10408@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: "drwyrm@gmail.com" <drwyrm@gmail.com>, "stefan@openezx.org" <stefan@openezx.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "openezx-devel@lists.openezx.org" <openezx-devel@lists.openezx.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "romain.naour@openwide.fr" <romain.naour@openwide.fr>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Andrew Chew <AChew@nvidia.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "lost.distance@yahoo.com" <lost.distance@yahoo.com>li
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 20, 2013 at 11:24:48AM +0900, Alex Courbot wrote:
> On 03/20/2013 11:14 AM, Shawn Guo wrote:
> >On Tue, Mar 19, 2013 at 11:59:24AM -0700, Andrew Chew wrote:
> >>Many backlights are enabled via GPIO.  We can generalize the GPIO to a
> >>fixed regulator.
> >>
> >I think we should push the series of "Runtime Interpreted Power
> >Sequences" moving forward, which should be useful this case and many
> >other cases as well.
> >
> >http://thread.gmane.org/gmane.linux.kernel/1395912
> 
> That's still the medium-term plan. But doing this correctly requires
> some improvements to be done in the GPIO subsystem, which I am
> pushing at the moment.
> 
Thanks for updating the status.

> Eventually power sequences should handle this kind of scenario, but
> by the meantime it cannot hurt to get the job done.
> 
It just makes us a little sick that a dummy fixed regulator is added
all over the places merely for pwm-backlight to retrieve a GPIO from
device tree.

Shawn
