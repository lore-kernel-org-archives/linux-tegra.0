From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH V4 0/9] Add mandatory regulator for all users of
 pwm-backlight.
Date: Wed, 20 Mar 2013 11:24:48 +0900
Message-ID: <51491DF0.10408@nvidia.com>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <20130320021442.GB20443@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130320021442.GB20443@S2101-09.ap.freescale.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "romain.naour@openwide.fr" <romain.naour@openwide.fr>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "laforge@openezx.org" <laforge@openezx.org>, "openezx-devel@lists.openezx.org" <openezx-devel@lists.openezx.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "lost.distance@yahoo.com" <lost.distance@yahoo.com>, "drwyrm@gmail.com" <drwyrm@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, eric.
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 11:14 AM, Shawn Guo wrote:
> On Tue, Mar 19, 2013 at 11:59:24AM -0700, Andrew Chew wrote:
>> Many backlights are enabled via GPIO.  We can generalize the GPIO to a
>> fixed regulator.
>>
> I think we should push the series of "Runtime Interpreted Power
> Sequences" moving forward, which should be useful this case and many
> other cases as well.
>
> http://thread.gmane.org/gmane.linux.kernel/1395912

That's still the medium-term plan. But doing this correctly requires 
some improvements to be done in the GPIO subsystem, which I am pushing 
at the moment.

Eventually power sequences should handle this kind of scenario, but by 
the meantime it cannot hurt to get the job done.

Alex.
