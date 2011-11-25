From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: DT DMA channel binding for Tegra I2S
Date: Fri, 25 Nov 2011 16:09:09 +0000
Message-ID: <20111125160908.GF5315@opensource.wolfsonmicro.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF174F08C803@HQMAIL01.nvidia.com>
 <4ECD6BA4.1010607@gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C881@HQMAIL01.nvidia.com>
 <CAL_JsqLk=ExaPoy9f3CqEthjZsu7CVmAwcckpk5PyJA-NhMGVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLk=ExaPoy9f3CqEthjZsu7CVmAwcckpk5PyJA-NhMGVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 25, 2011 at 09:55:23AM -0600, Rob Herring wrote:

> Although, I think you are possibly missing some other properties for
> i2s mode like word size and master/slave mode. I think the ideal case
> is that a single ASoC platform driver for DT could handle multiple
> SoCs.

No.  You're not going to be able to get a single binding which handles
the setup for all systems based off a given SoC let alone multiple SoCs.
It is possible to come up with some subsets which work over multiple
boards but that's going to be outside the binding for the I2S controller
and in a board audio hardware binding for the subset.

This has been discussed repeatedly, we really need to work out how to
educate device tree people about this stuff, it gets *very* repetitive
having the discussion over and over again.
