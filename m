From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra HDMI audio CTS register settings
Date: Tue, 15 Feb 2011 12:37:41 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A51BF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Erik Gilling (konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Erik,

Can you say how much testing drivers/video/tegra/dc/hdmi.c has had re:
audio-over-HDMI and in what context? I assume some, due to commits such as
e47469d3fd "video: tegra: fix HDMI audio programming".

I ask because of the following code:

	tegra_hdmi_writel(hdmi, SPARE_HW_CTS | SPARE_FORCE_SW_CTS |
			  SPARE_CTS_RESET_VAL(1),
			  HDMI_NV_PDISP_HDMI_SPARE);

I had to remove SPARE_FORCE_SW_CTS from this register write to get
audio-over-HDMI working correctly.

As I read the specs, HW_CTS tells the HW to calculate the CTS value itself.
Adding SW_CTS into the mix overrides this request, and requires SW to both
program the selected CTS value into a register *and* program register
HDMI_NV_PDISP_HDMI_ACR_CTRL to tell the HW how to determine the current audio
sample rate, and the latter is not currently done.

Can you comment any further?

Thanks.

-- 
nvpublic


--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
