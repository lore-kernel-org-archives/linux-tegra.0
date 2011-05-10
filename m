From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci devices
 are initialized
Date: Tue, 10 May 2011 16:33:27 -0700
Message-ID: <4DC9CB47.9000900@secretlab.ca>
References: <20110510201108.22693.50319.stgit@riker>	<20110510201414.22693.7427.stgit@riker>	<74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com> <BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF04986AA077@HQMAIL01.nvidia.com> <4DC9BD39.30108@secretlab.ca> <74CDBE0F657A3D45AFBB94109FB122FF04986AA0A6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA0A6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/10/2011 04:22 PM, Stephen Warren wrote:
> John Bonesio wrote at Tuesday, May 10, 2011 4:33 PM:
>> The goal I'm working towards right now is to have the platform specific
>> code continue to register the devices that are inside the SoC. Then use
>> the device tree to register all other on board devices.
> 
> Sure, that sounds right.
> 
> Which branch are your patches aimed at? My discussions are all based
> on my experience with Grant's devicetree/test branch.
> 
>> This patch doesn't accomplish the whole goal in one step, but gets the
>> code a little closer toward this goal.
> 
> So what's confusing me is that I think the devicetree/test branch is
> already there; board-dt.c registers all 4 SDHCI controllers,
> tegra250.dtsi defines each controller's memory map etc., and disables
> them all, then tegra-harmony.dts and tegra-seaboard.dts enable the
> relevant subset of those controllers, and provides the required
> platform data for them.
> 
> When adding the I2C controllers, it seems like they'd just work the
> same way as the existing SDHCI code.

From a philosophical point of view, they should be initialized the same way.

Are you thinking that the i2c controller should be in the
harmony_devices array and initialized with the other devices? If so i2c
is different in the kernel. An i2c controller isn't registered with
platform_device_register().

I may not be understanding your question.

> 
> So, all this already works without putting the board-specific platform
> data definitions into board-dt.c as an temporary measure.
> 
