From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci
	devices are initialized
Date: Tue, 10 May 2011 22:01:15 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA0E4@HQMAIL01.nvidia.com>
References: <20110510201108.22693.50319.stgit@riker>
	<20110510201414.22693.7427.stgit@riker>
	<74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com>
	<BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04986AA077@HQMAIL01.nvidia.com>
	<4DC9BD39.30108@secretlab.ca>
	<74CDBE0F657A3D45AFBB94109FB122FF04986AA0A6@HQMAIL01.nvidia.com>
	<4DC9CB47.9000900@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DC9CB47.9000900-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

John Bonesio wrote at Tuesday, May 10, 2011 5:33 PM:
> On 05/10/2011 04:22 PM, Stephen Warren wrote:
> > John Bonesio wrote at Tuesday, May 10, 2011 4:33 PM:
> >> The goal I'm working towards right now is to have the platform specific
> >> code continue to register the devices that are inside the SoC. Then use
> >> the device tree to register all other on board devices.
> >
> > Sure, that sounds right.
> >
> > Which branch are your patches aimed at? My discussions are all based
> > on my experience with Grant's devicetree/test branch.
> >
> >> This patch doesn't accomplish the whole goal in one step, but gets the
> >> code a little closer toward this goal.
> >
> > So what's confusing me is that I think the devicetree/test branch is
> > already there; board-dt.c registers all 4 SDHCI controllers,
> > tegra250.dtsi defines each controller's memory map etc., and disables
> > them all, then tegra-harmony.dts and tegra-seaboard.dts enable the
> > relevant subset of those controllers, and provides the required
> > platform data for them.
> >
> > When adding the I2C controllers, it seems like they'd just work the
> > same way as the existing SDHCI code.
> 
> From a philosophical point of view, they should be initialized the same
> way.
> 
> Are you thinking that the i2c controller should be in the
> harmony_devices array and initialized with the other devices? If so i2c
> is different in the kernel. An i2c controller isn't registered with
> platform_device_register().

Um. Your patch (and all existing code I'm familiar with) *does* use
platform_device_register for it:

+	platform_device_register(&tegra_i2c_device1);

But, I'm not talking about registering the platform devices, i.e. I'm
not talking about the line of code quoted above. I'm talking about the
platform data setup for those devices, i.e. the following from your
SDHCI patch:

+static struct tegra_sdhci_platform_data sdhci_pdata1 = {
+	.cd_gpio        = -1,
+	.wp_gpio        = -1,
+	.power_gpio     = -1,
+};
...
+	tegra_sdhci_device1.dev.platform_data = &sdhci_pdata1;

The SDHCI driver has already been updated to get this platform data
from the OF node in the platform device; it doesn't need hard-coded
platform data to be passed to it.

Similarly, the following from your I2C patch shouldn't be required:

+static struct tegra_i2c_platform_data harmony_i2c1_platform_data = {
+	.bus_clk_rate   = 400000,
+};
...
+	tegra_i2c_device1.dev.platform_data = &harmony_i2c1_platform_data;

Instead, the I2C driver should be modified to get its data from the
OF node in the platform device just like the SDHCI driver does. This
should be a pretty trivial amount of code to add to the I2C patch.

> I may not be understanding your question.
> 
> >
> > So, all this already works without putting the board-specific platform
> > data definitions into board-dt.c as an temporary measure.
> >

-- 
nvpublic
