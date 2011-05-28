From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Sat, 28 May 2011 09:28:44 +0800
Message-ID: <20110528012838.GC5971@opensource.wolfsonmicro.com>
References: <20110527205444.21000.90209.stgit@riker>
 <20110527205706.21000.34832.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110527205706.21000.34832.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 27, 2011 at 01:57:13PM -0700, John Bonesio wrote:

> +	harmony_audio: audio_card {
> +		compatible = "nvidia,harmony-audio";
> +	};
> +

Since the machine driver has been renamed to tegra_wm8903 to reflect the
fact that many of the nVidia designs are simple clones of each other we
ought to be using a similar name for the device tree binding for the
driver.
