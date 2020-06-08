From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 0/7] Support inhibiting input devices
Date: Sun, 7 Jun 2020 22:37:37 -0700
Message-ID: <20200608053737.GS89269@dtor-ws>
References: <20200604072853.GP89269@dtor-ws>
 <20200605173335.13753-1-andrzej.p@collabora.com>
 <20200607202414.GB13138@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200607202414.GB13138@amd>
Sender: linux-acpi-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 07, 2020 at 10:24:14PM +0200, Pavel Machek wrote:
> On Fri 2020-06-05 19:33:28, Andrzej Pietrasiewicz wrote:
> > Userspace might want to implement a policy to temporarily disregard input
> > from certain devices.
> 
> Wow, you certainly cc a lot of lists.
> 
> > An example use case is a convertible laptop, whose keyboard can be folded
> > under the screen to create tablet-like experience. The user then must hold
> > the laptop in such a way that it is difficult to avoid pressing the keyboard
> > keys. It is therefore desirable to temporarily disregard input from the
> > keyboard, until it is folded back. This obviously is a policy which should
> > be kept out of the kernel, but the kernel must provide suitable means to
> > implement such a policy.
> > 
> > Due to interactions with suspend/resume, a helper has been added for drivers
> > to decide if the device is being used or not (PATCH 1/7) and it has been
> > applied to relevant drivers (PATCH 2,4,5,6/7).
> 
> But is that a right way to implement it?
> 
> We want this for cellphones, too -- touchscreen should be disabled
> while the device is locked in the pocket -- but we really want the
> touchscreen hardware to be powered down in that case (because it keeps
> SoC busy and eats a _lot_ of electricity).
> 
> But simplistic "receive an event and then drop it if device is
> inhibited" does not allow that...

I do not think you read the entirety of this patch series...

Thanks.

-- 
Dmitry
