From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci
	devices are initialized
Date: Tue, 10 May 2011 23:42:33 +0100
Message-ID: <20110510224233.GB19154@sirena.org.uk>
References: <20110510201108.22693.50319.stgit@riker> <20110510201414.22693.7427.stgit@riker> <74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com> <BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF04986AA077@HQMAIL01.nvidia.com> <4DC9BD39.30108@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4DC9BD39.30108-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 10, 2011 at 03:33:29PM -0700, John Bonesio wrote:

> A following patch, which I'll send later this week/early next week, will
> instantiate the wm8903 audio codec device solely from the device tree.

Please CC me on this work - I've got an interest both from the chip and
subsystem point of view in how this stuff ends up looking and there's
some fun and games with audio in device tree.
