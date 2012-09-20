From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 1/5] ARM: tegra: dts: Add pwm label
Date: Thu, 20 Sep 2012 09:43:38 -0600
Message-ID: <505B39AA.3090301@wwwdotorg.org>
References: <1348153569-19083-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348153569-19083-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/20/2012 09:06 AM, Thierry Reding wrote:
> PWM devices can be referenced in the DT by phandle and per-chip index.
> In order for this to work properly, the PWM controller needs to have a
> label attached to it.

I've applied the series to Tegra's for-3.7/dt2 branch, and will send a
pull request very shortly.
