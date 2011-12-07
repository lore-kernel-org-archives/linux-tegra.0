From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ASoC: WM8903: Fix platform data gpio_cfg confusion
Date: Wed, 7 Dec 2011 15:49:27 -0800
Message-ID: <20111207234927.GA12676@quad.lixom.net>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
 <1322863721-29793-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322863721-29793-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 02, 2011 at 03:08:37PM -0700, Stephen Warren wrote:
> wm8903_platform_data.gpio_cfg[] was intended to be interpreted as follows:
> 0:       Don't touch this GPIO's configuration register
> 1..7fff: Write that value to the GPIO's configuration register
> 8000:    Write zero to the GPIO's configuration register
> other:   Undefined (invalid)
> 
> The rationale is that platform data is usually global data, and a value of
> zero means that the field wasn't explicitly set to anything (e.g. because
> the field was new to the pdata type, and existing users weren't update to
> initialize it) and hence the value zero should be ignored. 0x8000 is an
> explicit way to get 0 in the register.
> 
> The code worked this way until commit 7cfe561 "ASoC: wm8903: Expose GPIOs
> through gpiolib", where the behaviour was changed due to my lack of
> awareness of the above rationale.
> 
> This patch reverts to the intended behaviour, and updates all in-tree users
> to use the correct scheme. This also makes WM8903 consistent with other
> devices that use a similar scheme.
> 
> WM8903_GPIO_NO_CONFIG is also renamed to WM8903_GPIO_CONFIG_ZERO so that
> its name accurately reflects its purpose.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> ---
> Olof, Colin, could you please ack this so that Mark can apply it to the
> ASoC tree even though it touches Tegra code? Thanks.

Mark, since Stephen is a tegra maintainer, there's no real need to have an
explicit ack from one of the others, IMHO. But here you have it. :)

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>


-Olof
