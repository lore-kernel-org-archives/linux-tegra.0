From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: palmas: fix pdata ptr not be updated after
 it has been allocated
Date: Wed, 24 Jul 2013 13:09:34 -0400
Message-ID: <51F00A4E.1020100@nvidia.com>
References: <1374683282-17517-1-git-send-email-rklein@nvidia.com> <20130724170215.GP9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130724170215.GP9858-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 7/24/2013 1:02 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Jul 24, 2013 at 12:28:02PM -0400, Rhyland Klein wrote:
> 
>> +	/* Store the pdata pointer after everything else passes */
>> +	pdev->dev.platform_data = pdata;
> 
> No, this is bad - the driver should not be modifying the platform_data
> pointer, it's owned by the thing that created the device.  If the
> platform data needs to be modified it should be copied somewhere in the
> driver data.

Alright, thanks.

-rhyland

> 
> * Unknown Key
> * 0x7EA229BD
> 


-- 
nvpublic
