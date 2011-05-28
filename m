From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
 gpio's from the device tree.
Date: Sat, 28 May 2011 09:24:47 +0800
Message-ID: <20110528012427.GB5971@opensource.wolfsonmicro.com>
References: <20110527205444.21000.90209.stgit@riker>
 <20110527205721.21000.78599.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110527205721.21000.78599.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 27, 2011 at 01:57:26PM -0700, John Bonesio wrote:

>  	harmony_audio: audio_card {
>  		compatible = "nvidia,harmony-audio";
> +
> +		gpios = <&codec 226 0>, /* spkr_en, gpio wm8903 #2 */
> +			<&gpio 178 0>, /* hp_det, gpio PW2 */
> +			<&gpio 184 0>, /* int_mic_en, gpio PX0 */
> +			<&gpio 185 0>; /* ext_mic_en, gpio PX1 */
> +

This is a step back from the usability of the existing platform data -
the platform data uses a series of individually named GPIOs while this
uses an array of GPIO numbers with magic indexes.  The fact that you
need comments explaining what the functions of the array elements are
is a bit of a red flag here.
