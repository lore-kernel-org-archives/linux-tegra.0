From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: tamonten: Add DDC/PTA pinmux
Date: Fri, 09 Nov 2012 14:56:29 -0700
Message-ID: <509D7C0D.6010704@wwwdotorg.org>
References: <1352466291-27333-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352466291-27333-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2012 06:04 AM, Thierry Reding wrote:
> This commit allows the I2C2 controller on Tegra20 to be routed either to
> the DDC or the PTA pin group at runtime. On Tamonten this allows the I2C
> bus to be used for the DDC of the HDMI connector or to access I2C chips
> on the carrier board.

Both patches applied to Tegra's for-3.8/dt branch. Thanks.
