From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add clocks property to TWD node
Date: Tue, 12 Feb 2013 12:29:16 -0700
Message-ID: <511A980C.5050405@wwwdotorg.org>
References: <1360684611-11152-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360684611-11152-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2013 08:56 AM, Thierry Reding wrote:
> The generic ARM TWD code has recently gained support for looking up the
> clock from DT. Adding the appropriate clocks property allows the driver
> to successfully register the clock event device.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
> Note that the binding documentation says that the twd clock is 132 on
> Tegra20, but according to drivers/clk/tegra/clk-tegra20.c it is in fact
> 130. The patch doesn't update the binding documentation because some
> other offsets are probably also wrong and I didn't have the time to go
> through all of them.

The driver is buggy in that it doesn't match the DT bindings. I'll send
a patch to fix that up very soon. Then this patch can be rebased.
