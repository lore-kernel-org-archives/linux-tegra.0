From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 0/7] Add cros_ec changes for newer boards
Date: Thu, 17 Apr 2014 11:23:50 -0700
Message-ID: <CAL1qeaE+8km8K4gJvFaYiBxvVO+SD16f17w8pqdHS=OQB4SEoA@mail.gmail.com>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397757570-19750-1-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Matt Porter <matt.porter@linaro.org>, Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-doc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Kevin Strasser <kevin.strasser@linux.intel.com>, Dylan Reid <dgreid@chromium.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Martin Schwidefsky <schwidefsky@de.ibm.com>Rob Herring <ro>
List-Id: linux-tegra@vger.kernel.org

Doug,

> This series adds the most critical cros_ec changes for newer boards
> using cros_ec.  Specifically:
> * Fixes timing/locking issues with the previously upstreamed (but
>   never used upstream) cros_ec_spi driver.
> * Updates the cros_ec header file to the latest version which allows
>   us to use newer EC features like i2c tunneling.
> * Adds an i2c tunnel driver to allow communication to the EC's i2c
>   devices.
>
> This _doesn't_ get the EC driver fully up to speed with what's in the
> current Chromium OS trees.  There are a whole slew of cleanup patches
> there, an addition of an LPC transport mode, and exports of functions
> to userspace.  Once these patches land and we have functionality we
> can continue to pick more cleanup patches.

I can now talk to the charger and battery over the tunnel on my
Venice2 and other communication with the EC still works, so:

Tested-by: Andrew Bresticker <abrestic@chromium.org>
