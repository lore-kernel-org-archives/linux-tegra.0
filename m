From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 0/7] Add cros_ec changes for newer boards
Date: Wed, 23 Apr 2014 10:20:02 -0600
Message-ID: <5357E832.1000806@wwwdotorg.org>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org> <20140423123240.GA640@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140423123240.GA640@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>
Cc: swarren@nvidia.com, wsa@the-dreams.de, abrestic@chromium.org, dgreid@chromium.org, olof@lixom.net, sjg@chromium.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, mark.rutland@arm.com, andrew@lunn.ch, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, matt.porter@linaro.org, jdelvare@suse.de, laurent.pinchart+renesas@ideasonboard.com, vpalatin@chromium.org, sameo@linux.intel.com, linux-doc@vger.kernel.org, bjorn.andersson@sonymobile.com, u.kleine-koenig@pengutronix.de, kevin.strasser@linux.intel.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, linux@arm.linux.org.uk, andriy.shevchenko@linux.intel.com, ch.naveen@samsung.com, linux-arm-kernel@lists.infradead.org, shane.huang@amd.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, linux@prisktech.co.nz, galak@codeaurora.org, schwidefsky@de.ib
List-Id: linux-tegra@vger.kernel.org

On 04/23/2014 06:32 AM, Lee Jones wrote:
> On Tue, 22 Apr 2014, Doug Anderson wrote:
> 
>> This series adds the most critical cros_ec changes for newer boards
>> using cros_ec.  Specifically:
>> * Fixes timing/locking issues with the previously upstreamed (but
>>   never used upstream) cros_ec_spi driver.
>> * Updates the cros_ec header file to the latest version which allows
>>   us to use newer EC features like i2c tunneling.
>> * Adds an i2c tunnel driver to allow communication to the EC's i2c
>>   devices.
>>
>> This _doesn't_ get the EC driver fully up to speed with what's in the
>> current Chromium OS trees.  There are a whole slew of cleanup patches
>> there, an addition of an LPC transport mode, and exports of functions
>> to userspace.  Once these patches land and we have functionality we
>> can continue to pick more cleanup patches.
...
> Need to wait for the ARM, DT and I2C guys to review, at which point
> I'll be happy to take in and supply a branch for them to pull from if
> required. If there are no _true_ dependencies and the MFD changes can
> be added independently without fear of build breakages, let me know
> and I'll apply them separately.

I believe there aren't direct dependencies between the patches. So, the
MFD patches can be applied to the MFD tree and the DT patch applied to
the Tegra tree. I'm simply waiting for the MFD patches to be applied
before applying the DT patch so that I know the DT binding definition is
fully accepted before applying a patch that uses it.
