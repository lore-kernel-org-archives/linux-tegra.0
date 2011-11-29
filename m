From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: GPIO/IRQ expander cannot map interrupt
Date: Tue, 29 Nov 2011 11:48:58 +0000
Message-ID: <20111129114858.GB12111@sirena.org.uk>
References: <20111125104511.GA16748@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAF8B7@HQMAIL01.nvidia.com>
 <20111129065926.GA5044@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111129065926.GA5044-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 29, 2011 at 07:59:26AM +0100, Thierry Reding wrote:

> of hook that allows the driver to specify at probe time that some resources
> are still missing and is used for cases where there is no explicit dependency
> information and thus the driver core doesn't know in which order devices need
> to be probed.

The intention is to use it at all times and just not bother with
explicit ordering information as this is going to be more robust
especially given the need to sort out things like driver registration
ordering.

> However, for this particular case we actually have this explicit dependency
> information because the devices specify an interrupt and/or GPIO parent.
> Moreover it's not really the probing that is the issue here, but rather the
> device instantiation. The OF core instantiates the I2C slaves much too early
> (i.e. together with the interrupt parent) and therefore requires access to
> the IRQ domain mapping at the time of the instantiation already.

That's a separate issue though.
