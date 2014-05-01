From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
Date: Thu, 01 May 2014 13:05:39 -0600
Message-ID: <53629B03.6090408@wwwdotorg.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org> <1398879850-9111-7-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398879850-9111-7-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, lee.jones@linaro.org, wsa@the-dreams.de
Cc: swarren@nvidia.com, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, sameo@linux.intel.com, jdelvare@suse.de, shane.huang@amd.com, maxime.ripard@free-electrons.com, laurent.pinchart+renesas@ideasonboard.com, u.kleine-koenig@pengutronix.de, bjorn.andersson@sonymobile.com, kevin.strasser@linux.intel.com, linux@prisktech.co.nz, andrew@lunn.ch, andriy.shevchenko@linux.intel.com, schwidefsky@de.ibm.com, matt.porter@linaro.org, ch.naveen@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/30/2014 11:44 AM, Doug Anderson wrote:
> On ARM Chromebooks we have a few devices that are accessed by both the
> AP (the main "Application Processor") and the EC (the Embedded
> Controller).  These are:
> * The battery (sbs-battery).
> * The power management unit tps65090.
...
> On the Samsung ARM Chromebook 2 the scheme is changed yet again, now:
> * The AP/EC comms are now using SPI for faster speeds.
> * The EC's i2c bus is exposed to the AP through a full i2c tunnel.
> 
> The upstream "tegra124-venice2" uses the same scheme as the Samsung
> ARM Chromebook 2, though it has a different set of components on the
> other side of the bus.
> 
> This driver supports the scheme used by the Samsung ARM Chromebook 2.
> Future patches to this driver could add support for the battery tunnel
> on the HP Chromebook 11 (and perhaps could even be used to access
> tps65090 on the HP Chromebook 11 instead of using a special driver,
> but I haven't researched that enough).

The binding looks reasonable to me, so that part,
Acked-by: Stephen Warren <swarren@nvidia.com>
