From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: ASoC HDMI codec location
Date: Tue, 15 Feb 2011 12:29:59 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A51BE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Mark Brown (broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org)" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark,

I'm looking at enabling audio-over-HDMI on Tegra in the ChromeOS kernel.
This will use the SPDIF controller as the CPU DAI. Right now, I have things
working with the stub SPDIF codec (codecs/spdif_transciever.c), but to
support a non-hard-coded sample rate, need a real codec driver that writes
registers in the HDMI controller.

I see that a Samsung chip has such a codec in drivers/video/sh_mobile_hdmi.c.
The equivalent for Tegra would be drivers/video/tegra/dc/hdmi.c. Note that
this location doesn't yet exist upstream. I just wanted to confirm that this
location makes sense to you, vs. implementing a codec in sound/soc/tegra/hdmi.c,
and having that call functions exposed by the Tegra dc/hdmi.c driver?

Note that the SPDIF controller isn't involved in the Tegra Digital Audio
Switch muxing/switching module at all.

Thanks.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
