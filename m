From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 09/10] clk: tegra: Implement clocks for Tegra114
Date: Fri, 15 Feb 2013 06:39:43 +0100
Message-ID: <20130215.073943.1228868991272784104.hdoyu@nvidia.com>
References: <1360580700-10245-1-git-send-email-pdeschrijver@nvidia.com><1360580700-10245-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360580700-10245-10-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Mon, 11 Feb 2013 12:04:59 +0100:

> +enum tegra114_clk {
.....
> +       i2c4 = 103, sbc5 = 104, sbc6 = 105, apbif = 107, d_audio, dam0, dam1,
> +       dam2, hda2codec_2x = 111, audio0_2x = 113, audio1_2x, audio2_2x,

The above doesn't match the definition in  .../bindings/clock/nvidia,tegra114-car.txt.

....
105	sbc6
106	d_audio
107	apbif
108	dam0
109	dam1
110	dam2
111	hda2codec_2x
....

Taking a look at TRM, d_audio = 106 seems to be correct?

-       i2c4 = 103, sbc5 = 104, sbc6 = 105, apbif = 107, d_audio, dam0, dam1,
+       i2c4 = 103, sbc5 = 104, sbc6 = 105, d_audio, apbif = 107, dam0, dam1,
