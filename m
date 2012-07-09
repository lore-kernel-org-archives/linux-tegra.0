From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC][PATCH V2 2/3] pwm_backlight: use power sequences
Date: Mon, 9 Jul 2012 16:48:28 +0900
Message-ID: <4FFA8CCC.8060000@nvidia.com>
References: <1341814105-20690-1-git-send-email-acourbot@nvidia.com> <1341814105-20690-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341814105-20690-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sorry, I just noticed a mistake in this patch I made while merging 
another one. The following also needs to be changed, otherwise the 
power-on sequence will never be executed:

diff --git a/drivers/video/backlight/pwm_bl.c 
b/drivers/video/backlight/pwm_bl.c
index 1a38953..4546d23 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -65,7 +98,7 @@ static int pwm_backlight_update_status(struct 
backlight_device *bl)
                 duty_cycle = pb->lth_brightness +
                      (duty_cycle * (pb->period - pb->lth_brightness) / 
max);
                 pwm_config(pb->pwm, duty_cycle, pb->period);
-               pwm_enable(pb->pwm);
+               pwm_backlight_on(bl);
         }


Apologies for the inconvenience.

Alex.
