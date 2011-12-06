From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 5/5] ASoC: WM8903: Add device tree binding
Date: Tue, 6 Dec 2011 10:22:24 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1750B773EE@HQMAIL01.nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
 <1322863721-29793-6-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322863721-29793-6-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Friday, December 02, 2011 3:09 PM:
> Document the device tree binding for the WM8903 codec, and modify the
> driver to extract platform data from the device tree, if present.

Mark,

I just realized that when I was re-organizing all the WM8903 patches, I
dropped the part that added the of_match table to the driver:

+static const struct of_device_id wm8903_of_match[] __devinitconst = {
+	{ .compatible = "wlf,wm8903", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, wm8903_of_match);

Now, everything still works without this. Looking at the Linux OF code,
it works by retrieving the compatible property, taking everything after
the comma if present, and then creating an i2c_board_info with that
type, which in this case is "wm8903" and matches wm8903.c's i2c_device_id
table. See drivers/of/of_i2c.c:of_i2c_register_devices() and the call to
base.c:of_modalias_node().

So, the question is: Should I go back and add the of_match table, or
is I2C intended to work without it perpetually? I notice that you added
an of_match table for all the other WM codecs.

Thanks.

-- 
nvpublic
